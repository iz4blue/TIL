#!/bin/bash

dd if=/dev/zero of=./swap-file-2g.img bs=1024M count=2
sudo chmod 600 ./swap-file-2g.img
sudo mkswap ./swap-file-2g.img
sudo swapon ./swap-file-2g.img

sudo swapon -s
