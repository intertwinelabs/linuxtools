#!/bin/bash
#
# Filename:   whatismypublicip.sh
# Author:     Richard Lee
# Date:       26 Mar 2023
#
# Purpose:    Display my Public IP Address
#
# Credits:    https://www.tecmint.com/find-linux-server-public-ip-address/
#             Written by Aaron Kili

case $1 in
1)
  _mypublicip="`dig +short myip.opendns.com @resolver1.opendns.com`"
  echo "$_mypublicip"
  ;;
2)
  _mypublicip="`host myip.opendns.com resolver1.opendns.com | grep 'myip.opendns.com has' | awk '{print $4}'`"
  echo "$_mypublicip"
  ;;
*)
  echo "=== What Is My Public IP Address ==="
  echo "Adapted by Richard Lee - 26 Mar 2023"
  echo ""
  echo "Credits: https://www.tecmint.com/find-linux-server-public-ip-address/"
  echo "         by Aaron Kili"
  echo ""
  echo "Usage: $0 [1|2]"
  echo ""
  echo "[1] Approach using dig utility"
  echo "[2] Approach using host utility"
  echo ""
  ;;
esac

