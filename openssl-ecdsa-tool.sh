#!/bin/bash
#
# Filename: openssl-ecdsa-tool.sh
# Author:   Richard Lee
# Date:     12 Feb 2023
#
# Purpose:  Provide Linux Tool wrapper to OpenSSL tool in creating Elliptical Curve Keys
# Ref:      https://www.scottbrady91.com/openssl/creating-elliptical-curve-keys-using-openssl

case $1 in
"-list")
   openssl ecparam -list_curves
   ;;
"-gen-privatekey")
   if [ "$2" != "" ]; then
      openssl ecparam -name prime256v1 -genkey -noout -out $2
      if [ -f $2 ]; then
         echo "+INFO: Private key [$2] generated."
         exit 0
      else
         echo "+ERROR: Private key [$2] not generated."
         exit 1
      fi
   else
      echo "+WARNING: Private key name not specified. Please try again."
      exit 0
   fi
   ;;
"-gen-publickey")
   if [ "$2" == "" ]; then
      echo "+WARNING: Private key name not specified. Please try again."
      exit 0
   else
      if [ -f $2 ]; then
         if [ "$3" != "" ]; then
            openssl ec -in $2 -pubout -out $3
            if [ -f $3 ]; then
               echo "+INFO: Public key [$3] generated."
               exit 0
            else
               echo "+ERROR: Public key [$3] not generated."
               exit 1
            fi
         else
            echo "+WARNING: Public key name not specified. Please try again."
            exit 0
         fi
      else
         echo "+WARNING: Private key [$2] not found. Please try again."
         exit 0
      fi
   fi
   ;;
*)
   echo "----------------------------------------------"
   echo "OpenSSL Elliptical Curve Key Tool - Ver 1.0"
   echo "Written by Richard Lee - 12 Feb 2023"
   echo "----------------------------------------------"
   echo "Usage: $0 <options>"
   echo ""
   echo "   Options:"
   echo "   -list"
   echo ""
   echo "   -gen-privatekey <keyname>"
   echo "      Eg. -gen-privatekey myprivatekey.pem"
   echo ""
   echo "   -gen-publickey <privatekey> <publickey>"
   echo "      Eg. -gen-publickey myprivatekey.pem mypublickey.pem"
   echo ""
   echo ""
   exit 0
   ;;
esac
