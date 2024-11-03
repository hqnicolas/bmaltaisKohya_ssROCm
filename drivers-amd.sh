#!/bin/bash
sudo apt update -y && sudo apt full-upgrade -y
sudo apt install "linux-headers-$(uname -r)" "linux-modules-extra-$(uname -r)"
sudo usermod -a -G render,video $LOGNAME
# to radeon RX6000: wget https://repo.radeon.com/amdgpu-install/6.0.2/ubuntu/jammy/amdgpu-install_6.0.60002-1_all.deb
wget https://repo.radeon.com/amdgpu-install/6.1.4/ubuntu/jammy/amdgpu-install_6.1.60104-1_all.deb
# to Ubuntu 20.04: wget https://repo.radeon.com/amdgpu-install/6.0.2/ubuntu/focal/amdgpu-install_6.0.60002-1_all.deb
# to radeon RX6000: sudo apt install ./amdgpu-install_6.0.60002-1_all.deb -y
sudo apt install ./amdgpu-install_6.1.60104-1_all.deb -y
sudo apt-get update
sudo apt install amdgpu-dkms -y
sudo apt install rocm -y
