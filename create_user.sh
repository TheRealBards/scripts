#!/usr/bin/env bash

## Help string
if [ "$1" == "-h" ] ; then
    echo "Usage: `basename $0` <username>"
    exit 0
fi

## Check if running as root
if ((EUID != 0)); then
    echo "Root or Sudo  Required for script ( $(basename $0) )"
    exit
fi

if [[ $1 != "" ]]; then
	echo "Creating user account : $1"
	useradd $1
	
	echo "Make SSH directory"
	mkdir /home/$1/.ssh
	
	echo "Creating SSH Key"
	ssh-keygen -f /home/$1/.ssh/id_rsa
	cat /home/$1/.ssh/id_rsa.pub > /home/$1/.ssh/authorized_keys
	
	echo "Setting folder permissions"
	chmod 700 /home/$1/.ssh
	chmod 644 /home/$1/.ssh/id_rsa.pub
	chmod 600 /home/$1/.ssh/id_rsa
	chmod 640 /home/$1/.ssh/authorized_keys
	chown $1:$1 /home/$1/.ssh -R
	
	echo "Save the below output as your SSH Private Key"
	cat /home/$1/.ssh/id_rsa
	
	exit 1
else
	echo "No username provided. Exiting"
	exit 1
fi
