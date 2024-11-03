#!/bin/bash
sudo apt update -y
# taken from https://rocm.docs.amd.com/projects/install-on-linux/en/latest/install/quick-start.html
# Enter one of the following lines depending on your version of Ubuntu:
# Ubuntu 24.04: wget https://repo.radeon.com/amdgpu-install/6.2/ubuntu/noble/amdgpu-install_6.2.60200-1_all.deb
# Ubuntu 22.04: wget https://repo.radeon.com/amdgpu-install/6.2/ubuntu/jammy/amdgpu-install_6.2.60200-1_all.deb
sudo apt install "linux-headers-$(uname -r)" "linux-modules-extra-$(uname -r)"
sudo usermod -a -G render,video $LOGNAME
wget https://repo.radeon.com/amdgpu-install/6.2.2/ubuntu/jammy/amdgpu-install_6.2.60202-1_all.deb
sudo apt install ./amdgpu-install_6.2.60202-1_all.deb -y
sudo apt-get update -y
sudo apt install gcc-12 -y
export CC=/usr/bin/gcc-12
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 12
sudo update-alternatives --config gcc
sudo apt install aptitude -y
echo -e "n\ny" | sudo aptitude install libsystemd-dev libdrm-dev
sudo apt install amdgpu-dkms -y
sudo apt install rocm -y
