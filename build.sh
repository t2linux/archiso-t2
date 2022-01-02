#!/bin/bash
sudo ln -s $PWD/archiso/airootfs/t2kern /t2kern
sudo mkarchiso -v archiso
