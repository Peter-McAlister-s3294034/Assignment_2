#! /bin/bash

<<COMMENT
*****************************************************************************
********** Student Name: Peter McAlister     ********************************
********** Student Number: s3294034          ********************************
********** Assignment: 2                     ********************************
*****************************************************************************
COMMENT

# To ensure this works the collaborator must have their ssh key set uo
# If this is done then the git clone will look in the appropriate .ssh 
# to validate the rsa key
# There was no specification to assign a specific folder so the file will 
# be cloned into the folder the script is run in

git clone git@github.com:Peter-McAlister-s3294034/Assignment_2.git

# This will clone the repositoryas specified from week 7
# It wil be cloned into a sub-folder of assignment_2 called linux

git clone --depth=1 https://github.com/raspberrypi/linux

# Copy the .config file from the Assignment_2 file to the linux folder

cp -r Assignment_2/.config linux/

# I used a RaspberryPi 4
# Raspberry Pi 4 default build configuration
# Changes directory and applies default configuration

cd linux
KERNEL=kernel7l
make bcm2711_defconfig


