#!/bin/bash

# echo "Unloading all CAS modules..."
# sudo rmmod cas_cache

# echo "Cleaning previous build..."
# sudo make clean

# echo "Building with DEBUG=1..."
# sudo make DEBUG=1 -j 30

# echo "Installing with DEBUG=1..."
# sudo make install DEBUG=1 -j 30

# echo "Checking module installation..."
# ls -l /lib/modules/5.4.43/extra/block/opencas/cas*

# echo "Loading CAS modules..."
# sudo modprobe cas_cache

# echo "Checking loaded modules..."
# lsmod | grep cas

# sudo depmod -a

# echo "Build process completed!"


cd ../shell
sudo ./teardown_opencas_pmem.sh
cd ../open-cas-linux-network-split

echo "sudo rmmod cas_cache..."
sudo rmmod cas_cache
sudo rmmod cas_disk

echo "Cleaning previous build..."
sudo make clean

echo "Building with DEBUG=1..."
sudo make DEBUG=1 -j 30

echo "Installing with DEBUG=1..."
sudo make install DEBUG=1 -j 30

echo "sudo modprobe cas_cache..."
sudo modprobe cas_disk
sudo modprobe cas_cache

echo "Build process completed!"

cd ../shell
sudo ./connect-rdma.sh
sudo ./setup_opencas_pmem.sh