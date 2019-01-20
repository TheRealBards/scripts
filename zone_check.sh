#!/bin/bash

display_usage() {
        echo -e "\nUsage:\n./zone_check.sh <url>\n"
}

if [[ ( $1 == "--help" ) || $1 == "-h" ]]
then
        display_usage
        exit 0
fi

curl https://api.hackertarget.com/zonetransfer/?q=$1
