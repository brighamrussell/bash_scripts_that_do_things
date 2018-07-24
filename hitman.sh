#!/bin/bash
# This script will continuously kill (Hence the name hitman) a program that wants to run even after you kill it.
# I wrote this because TeamViewer kept automatically starting up on my MacBook, and I didn't want it to.
# Since I didn't want to uninstall it, nor did I want to take the time to figure out how to configure it to not always run,
# I decided to whip up this script and run it in the background

# Set the variable "applic" to the name of your application as indicated in ps or top:
declare applic='YourApplication.app'

declare valu;
while [ 0 -lt 1 ]
  do
    valu=`ps aux|grep $applic|grep -v 'grep'|awk '{print $2}'`
    if [ -z "$valu" ]
      then sleep 5
    else 
      echo $valu 
      sudo kill -9 $valu
    fi
  done