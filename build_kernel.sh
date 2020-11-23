#! /bin/bash

<<COMMENT
*****************************************************************************
********** Student Name: Peter McAlister     ********************************
********** Student Number: s3294034          ********************************
********** Assignment: 2                     ********************************
*****************************************************************************
COMMENT

# To ensure this works the collaborator must have their ssh key set up on GIT
# If this is done then the git clone will look in the appropriate .ssh 
# to validate the rsa key
# There was no specification to assign a specific folder so the file will 
# be cloned into the folder the script is run in as below

# make directory for the files to be copied into
mkdir s3294034_Assignment_2

# change to that directory
cd s3294034_Assignment_2

#.ssh clone for the repository - rmitusap has been made collaborator
git clone git@github.com:Peter-McAlister-s3294034/Assignment_2.git

# This will clone the repositoryas specified from week 7
# It wil be cloned into a sub-folder of assignment_2 called 
# the folder will be called linux

git clone --depth=1 https://github.com/raspberrypi/linux

# Copy the .config file from the Assignment_2 file to the linux folder

cp -r ~/s3294034_Assignment_2/Assignment_2/.config ~/s3294034_Assignment_2/linux/

# I used a RaspberryPi 4
# Raspberry Pi 4 default build configuration
# Changes directory and applies default configuration

cd linux
KERNEL=kernel7l
make bcm2711_defconfig

# Build the kernel

make -j4 zImage modules dtbs

# compress the file
# copy to /boot folder

tar -pczf linux.tar.gz ~/boot/backup

# copy the new files created by this build process into the right place and reboot the system.

make modules_install
cp arch/arm/boot/dts/*.dtb /boot/
cp arch/arm/boot/dts/overlays/*.dtb* /boot/overlays/
cp arch/arm/boot/dts/overlays/README /boot/overlays/
cp arch/arm/boot/zImage /boot/$KERNEL.img

# reboot the system
reboot



