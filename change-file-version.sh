#!/bin/bash
#
# Filename:  change-file-version.sh
# Author:    Richard Lee
# Date:      17 Feb 2023
#

tgtPath="./testFolder"

case $1 in
00[1-9])

  case $2 in
  00[1-9])

    if [ ! -d $tgtPath ]; then
      echo "+ERROR: [$tgtPath] does not exist. Abort."
      exit 1
    else
      fileList="`ls -1 $tgtPath`"
      for i in $fileList;
      do

        if [ "`echo $i | grep \"_$1_\" | wc -l`" -ne 0 ]; then
          changeFileVersion="`echo $i | sed \"s/$1/$2/g\"`"
          echo "Rename: [$tgtPath/$i]"
          echo "    ==> [$tgtPath/$changeFileVersion]"
          echo ""
          mv $tgtPath/$i $tgtPath/$changeFileVersion
        else
          echo "+INFO: No file(s) matched. No action taken."
          exit 0
        fi
      done
    fi
    ;;
  *)
    echo "+ERROR: Invalid or unspecified [toVersion]. Please try again."
    exit 0
    ;;
  esac
  ;;
*)
  echo "-------------------------------------------"
  echo "Change File Version - Ver 0.1"
  echo "Written by Richard Lee - 17 Feb 2023"
  echo "-------------------------------------------"
  echo "Usage: $0 [fromVersion] [toVersion]"
  echo ""
  echo "Example - Change file version from 001 to 002."
  echo "$0 001 002"
  echo ""
  exit 0
  ;;
esac