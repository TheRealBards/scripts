if [ "$1" == "-h" ]; then
  echo "Usage: `basename $0` <alias_name> <ip_address|hostname> <identity_file> <user>"
  exit 0
fi

echo "
Host $1
        HostName $2
        IdentityFile $3
        User $4" >> $HOME/.ssh/config
