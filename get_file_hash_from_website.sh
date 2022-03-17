#!/bin/bash

display_usage() {
        echo -e "\nUsage:\n$0 <url>\n"
}

if [[ ( $1 == "--help" ) || $1 == "-h" ]]
then
        display_usage
        exit 0
fi

curl -L --silent $1 | sha256sum
