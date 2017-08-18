#!/usr/bin/python
# -*- coding: utf-8 -*-
from bs4 import BeautifulSoup
import urllib.request
import urllib.parse
import json
from pprint import pprint
import string
from duckduckgo import search
import json
import time
YEAR = 2000
with open('data.json', encoding='cp1252') as fb_list:
    fb = json.load(fb_list)
headers = {}
headers['Accept'] = \
    'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
headers['Accept-Encoding'] = 'gzip, defalte'
headers['Connection'] = 'keep-alive'
headers['User-Agent'] = \
    'Mozilla/5.0 (X11; Linux x86_64; rv:54.0) Gecko/20100101 Firefox/54.0'
temp = [];
error = ""
et = [];
count = 0;
for x in range(0, len(fb)):
    try:
        t = json.loads(fb[x]);
        if  t['facebook'] != "":
            name = t['name']
            error = name
            with urllib.request.urlopen(t['facebook']) as conn:
                rr=conn.read()
            soupp = BeautifulSoup(rr,'html.parser')
            souppp = soupp.select("._4bl9")
            data = {}
            data["name"] = name
            data["likes"] = souppp[0].text.split(" ")[0];
            data["follow"] = souppp[1].text.split(" ")[0];
            pprint(data)
            count += 1
            if count > 4 :
                time.sleep(1000)
            temp.append(json.dumps(data))
    except:
        print ('error occured')
        err = {}
        err["name"] = error;
        et.append(json.dumps(err))
with open('fb.json', 'w') as outfile:  
    json.dump(temp,outfile)
with open('fb-err.json','w') as stderr:
    json.dump(stderr)

			
