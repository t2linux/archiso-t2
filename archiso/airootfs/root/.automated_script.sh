#!/usr/bin/env bash

script_cmdline() {
    local param
    for param in $(</proc/cmdline); do
        case "${param}" in
            script=*)
                echo "${param#*=}"
                return 0
                ;;
        esac
    done
}

automated_script() {
    local script rt
    script="$(script_cmdline)"
    if [[ -n "${script}" && ! -x /tmp/startup_script ]]; then
        if [[ "${script}" =~ ^((http|https|ftp|tftp)://) ]]; then
            printf '%s: downloading %s\n' "$0" "${script}"
            # there's no synchronization for network availability before executing this script; to ensure the network
            # is online, we use a transient systemd service that depends on network-online.target to download the
            # script rather than manually polling the target
            systemd-run --pty --quiet -p Wants=network-online.target -p After=network-online.target \
                curl "${script}" --location --retry-connrefused --retry 10 --fail -s -o /tmp/startup_script
            rt=$?
        else
            cp "${script}" /tmp/startup_script
            rt=$?
        fi
        if [[ ${rt} -eq 0 ]]; then
            chmod +x /tmp/startup_script
            printf '%s: executing automated script\n' "$0"
            # note that script is executed when other services (like pacman-init) may be still in progress, please
            # synchronize to "systemctl is-system-running --wait" when your script depends on other services
            /tmp/startup_script
        fi
    fi
}


t2_firmware() {
    # Wi-Fi and Bluetooth firmware for T2 Macs lives on the macOS volume. apple-bcm-firmware-fetcher mounts it via the
    # in-tree APFS driver, installs the firmware to /lib/firmware/brcm and reloads brcmfmac/hci_bcm4377. Only run it on
    # Apple hardware (nothing to fetch in a VM) and only once per boot (the fetcher records what it installed).
    if [[ "$(cat /sys/class/dmi/id/sys_vendor 2>/dev/null)" != 'Apple Inc.' ]]; then
        return 0
    fi
    if [[ -f /var/lib/apple-bcm-firmware-fetcher/installed-files ]]; then
        return 0
    fi
    printf '%s: fetching Wi-Fi and Bluetooth firmware from the macOS volume\n' "$0"
    if ! apple-bcm-firmware-fetcher; then
        printf '%s: firmware fetch failed; run apple-bcm-firmware-fetcher again or see https://wiki.t2linux.org/guides/wifi-bluetooth/\n' "$0"
    fi
}

if [[ $(tty) == "/dev/tty1" ]]; then
    t2_firmware
    automated_script
fi
