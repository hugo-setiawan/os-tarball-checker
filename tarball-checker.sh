#!/bin/bash
# Copyright (C) 2021 Muhammad Athallah

# This free document is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied
# warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# REV04 Sun 21 Nov 2021 18:29:25 WIB
# REV03 Sun 21 Nov 2021 16:45:48 WIB
# REV02 Tue 19 Oct 2021 13:30:00 WIB
# REV01 Tue 19 Oct 2021 12:40:50 WIB
# START Tue 19 Oct 2021 11:02:45 WIB

read -p "Please enter the desired week to be checked (use two-digit format): " WEEK

# ATTN: Please set the following variable according to the os repo name (i.e. os222, os223, etc)
REPO_NAME=os222

# Get the GitHub username from the username of Linux
ACCNAME=$USER

# Remove temporary directory (if any)
rm -rf /tmp/tarball-grade/

# Make directories
mkdir /tmp/tarball-grade/
mkdir /tmp/tarball-grade/mygrade
mkdir /tmp/tarball-grade/benchmark

# Download mygrade
wget https://os.vlsm.org/Log/$ACCNAME.tar.bz2.txt -O /tmp/tarball-grade/$ACCNAME.tar.bz2.txt
gpg --decrypt /tmp/tarball-grade/$ACCNAME.tar.bz2.txt > /tmp/tarball-grade/$ACCNAME.tar.bz2
tar -xf /tmp/tarball-grade/$ACCNAME.tar.bz2 -C /tmp/tarball-grade/mygrade

# Download benchmark
wget https://cbkadal.github.io/$REPO_NAME/SandBox/TARBALL.tar.bz2 -O /tmp/tarball-grade/TARBALL.tar.bz2
tar -xf /tmp/tarball-grade/TARBALL.tar.bz2 -C /tmp/tarball-grade/benchmark

# Print grades
echo "### GRADES OF DW$WEEK ###"
echo "GRADE DETAILS   | MYGRADE          | BENCHMARK"
echo "-----------------------------------------------------"
for file in /tmp/tarball-grade/mygrade/DW$WEEK/*
do
    FILENAME="${file##*/}"
    FIRSTPART=$(printf '%-15s' "$FILENAME")
    MYGRADE=$(cat $file)
    SECONDPART=$(printf '%-16s' "$MYGRADE")
    BENCHMARK=$(cat /tmp/tarball-grade/benchmark/DW$WEEK/$FILENAME)
    THIRDPART=$(printf '%-16s' "$BENCHMARK")
    echo "$FIRSTPART | $SECONDPART | $THIRDPART"
done
