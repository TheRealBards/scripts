#!/usr/bin/python

## Imports ##
import socks, socket
import urllib2

## Set user agent in headers ##
headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'
}

def create_connection(address, timeout=4, headers=headers):
        sock = socks.socksocket()
        sock.connect(address)
        return sock

socks.setdefaultproxy(socks.PROXY_TYPE_SOCKS5, "127.0.0.1",9050)
socket.socket = socks.socksocket
socket.create_connection = create_connection

site = raw_input('Please enter the URL\n>>> ')

onionsite = urllib2.urlopen('http://' + site)
with open(site,'wb') as f:
        f.write(onionsite.read())
