#!/usr/bin/env python
import requests
import hashlib

with open('/path/to/virustotal.config') as f: # Sets the public API key for VirusTotal.
        vtapipub = f.read().strip()
dloadurl = 'https://virustotal.com/vtapi/v2/file/download'
my_hash = raw_input('>>> Please enter the file hash\n>>> ')
params = {'apikey':vtapipub, 'hash':my_hash}
dload = requests.get(dloadurl, params=params)
content = dload.content
hash_object = hashlib.sha256(content)
with open(hash_object.hexdigest(),'wb') as f:
        f.write(content)
