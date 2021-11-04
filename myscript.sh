#!/bin/bash
# Copyright (C) 2021 Muhammad Athallah

# This free document is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied
# warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# REV02 Tue 19 Oct 2021 13:30:00 WIB
# REV01 Tue 19 Oct 2021 12:40:50 WIB
# START Tue 19 Oct 2021 11:02:45 WIB

# Change ACCNAME to your GitHub account!
ACCNAME="determinedguy"

read -p "Please enter the desired week to be checked (use two-digit format): " WEEK

# Remove current directories (if any)
rm -rf $HOME/tarball-grade/mygrade
rm -rf $HOME/tarball-grade/benchmark

# Remove past files
rm -f $ACCNAME*
rm -f TARBALL*

# Make directory
mkdir $HOME/tarball-grade/mygrade
mkdir $HOME/tarball-grade/benchmark

# Download mygrade
wget https://os.vlsm.org/Log/$ACCNAME.tar.bz2.txt
gpg --decrypt $ACCNAME.tar.bz2.txt > $ACCNAME.tar.bz2
tar -xf $ACCNAME.tar.bz2 -C $HOME/tarball-grade/mygrade

# Download benchmark
wget https://cbkadal.github.io/os212/SandBox/TARBALL.tar.bz2
tar -xf TARBALL.tar.bz2 -C $HOME/tarball-grade/benchmark

# Print grades
echo "### GRADES OF DW$WEEK ###"
echo "GRADE DETAILS   | MYGRADE          | BENCHMARK"
echo "-----------------------------------------------------"
for file in $HOME/tarball-grade/mygrade/DW$WEEK/*
do
    FILENAME="${file##*/}"
    FIRSTPART=$(printf '%-15s' "$FILENAME")
    MYGRADE=$(cat $file)
    SECONDPART=$(printf '%-16s' "$MYGRADE")
    BENCHMARK=$(cat $HOME/tarball-grade/benchmark/DW$WEEK/$FILENAME)
    THIRDPART=$(printf '%-16s' "$BENCHMARK")
    echo "$FIRSTPART | $SECONDPART | $THIRDPART"
done
