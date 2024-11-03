#!/bin/bash
sudo apt update -y
# taken from https://rocm.docs.amd.com/projects/install-on-linux/en/latest/install/quick-start.html
sudo apt install "linux-headers-$(uname -r)" "linux-modules-extra-$(uname -r)"
sudo usermod -a -G render,video $LOGNAME
wget https://repo.radeon.com/amdgpu-install/6.2.2/ubuntu/jammy/amdgpu-install_6.2.60202-1_all.deb
sudo apt install ./amdgpu-install_6.2.60202-1_all.deb -y
sudo apt-get update
sudo apt install amdgpu-dkms -y
sudo apt install rocm -y
