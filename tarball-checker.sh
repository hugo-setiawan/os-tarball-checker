#!/bin/bash
# Copyright (C) 2022 Muhammad Athallah, Hugo Sulaiman Setiawan

# This free document is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied
# warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# REV05 Tue 20 Sep 2022 15:13:00 WIB
# REV04 Sun 21 Nov 2021 18:29:25 WIB
# REV03 Sun 21 Nov 2021 16:45:48 WIB
# REV02 Tue 19 Oct 2021 13:30:00 WIB
# REV01 Tue 19 Oct 2021 12:40:50 WIB
# START Tue 19 Oct 2021 11:02:45 WIB

# Declare variables
VER="REV05-dev"

# ATTN: Please set the following variable according to the os repo name (i.e. os222, os231, etc)
REPO_NAME=os222

# ATTN: Make sure Linux username = Linux group = GitHub username
ACC_NAME=$USER

CLEAN_TEMP=true

# getopts for cli options
while getopts "hs" option; do
    case ${option} in
    h) # Display help message
        echo "Usage:"
        echo "    tarball-checker.sh [options]"
        echo
        echo "Options:"
        echo "    -h	show this help list"
        echo "    -s	save (don't delete) downloaded tarball and benchmark upon exit"
        echo
        echo "os-tarball-checker version $VER"
        exit 0
        ;;
    s) # Save (keep) temp directory on exiting; useful if user wants to check tarball manually
        CLEAN_TEMP=false
        ;;
    esac
done

read -p "Please enter the desired week to be checked (use two-digit format): " WEEK

# Make directories (using timestamp and mktemp to avoid directory collision)
TARBALL_TEMP_DIR=$(mktemp -d /tmp/tarball-checker-$(date +"%Y%m%d-%H:%M:%S")-XXXX)
mkdir $TARBALL_TEMP_DIR/mygrade
mkdir $TARBALL_TEMP_DIR/benchmark

# If compression is bz2, use tar -xj. If compression is xz, use tar -xJ. I will find a more elegant solution to this.
# Download mygrade
wget https://os.vlsm.org/Log/$ACC_NAME.tar.bz2.txt -O - | gpg --decrypt | tar -xj -C $TARBALL_TEMP_DIR/mygrade

# Download benchmark
wget https://cbkadal.github.io/$REPO_NAME/SandBox/cbkadal.tar.xz -O - | tar -xJ -C $TARBALL_TEMP_DIR/benchmark

# Print grades
echo "### GRADES OF DW$WEEK ###"
echo "GRADE DETAILS   | MYGRADE          | BENCHMARK"
echo "-----------------------------------------------------"
for file in $TARBALL_TEMP_DIR/mygrade/$ACC_NAME/DW$WEEK/*
do
    FILENAME="${file##*/}"
    FIRSTPART=$(printf '%-15s' "$FILENAME")
    MYGRADE=$(cat $file)
    SECONDPART=$(printf '%-16s' "$MYGRADE")
    BENCHMARK=$(cat $TARBALL_TEMP_DIR/benchmark/cbkadal/DW$WEEK/$FILENAME)
    THIRDPART=$(printf '%-16s' "$BENCHMARK")
    echo "$FIRSTPART | $SECONDPART | $THIRDPART"
done

# Delete temp files if user didn't ask to keep them
if [[ $CLEAN_TEMP = true ]]
then
    rm -r $TARBALL_TEMP_DIR
else
    echo
    echo "The opened tarballs are saved in $TARBALL_TEMP_DIR"
fi
