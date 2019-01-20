if [ "$1" == "-h" ]; then
  echo "Usage: `basename $0` <access_log location>"
  exit 0
fi

if [ "$(id -u)" != "0" ]; then
        echo "Please run using sudo."
        exit 1
fi

/bin/echo -e "\e[1;31mTop 10 IP Addresses\e[0m"
cat $1 | cut -f1 -d"-" | sort | uniq -c | sort -r | head -n 10

/bin/echo -e "\n\e[1;31mNumber of requests by type\e[0m"
cat $1 | cut -f6 -d" " | cut -c 2- | sort | uniq -c | sort -r

/bin/echo -e "\n\e[1;31mTop Referer\e[0m"
cat $1 | cut -f4 -d'"' | sort | uniq -c | sort -r | head -n 10

/bin/echo -e "\n\e[1;31mTop User Agent String\e[0m"
cat $1 | cut -f6 -d'"' | sort | uniq -c | sort -r | head -n 10

/bin/echo -e "\n\e[1;31mLeast Common User Agent String\e[0m"
cat $1 | cut -f12- -d" " | sort | uniq -c | sort
