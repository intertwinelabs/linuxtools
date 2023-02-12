#!/bin/bash
#
# Filename: remove_ds_store_file.sh
# Author:   Richard Lee
# Date:     12 Feb 2023
#
# Purpose:  To remove .DS_Store files on local file systems recursively

_target_file=".DS_Store"

case $1 in
"-list")
   find . -type file -name $_target_file -print
   ;;
"-remove")
   find . -type file -name $_target_file -exec rm -i {} \;
   ;;
*)
   echo "---------------------------------------------------------"
   echo "Housekeeping Tool to remove .DS_Store Files with prompt"
   echo "---------------------------------------------------------"
   echo "Usage: $0 [-list | -remove]"
   ;;
 esac
