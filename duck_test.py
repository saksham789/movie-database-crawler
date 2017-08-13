#!/usr/bin/python
# -*- coding: utf-8 -*-
from bs4 import BeautifulSoup
import urllib.request
import urllib.parse
import json
from pprint import pprint
import string
import requests
# f = open('movie_data.txt','w')

YEAR = 2000
with open('movie.json', encoding='cp1252') as movie_list:
    movie = json.load(movie_list)
headers = {}
headers['Accept'] = \
    'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
headers['Accept-Encoding'] = 'gzip, defalte'
headers['Connection'] = 'keep-alive'
headers['User-Agent'] = \
    'Mozilla/5.0 (X11; Linux x86_64; rv:54.0) Gecko/20100101 Firefox/54.0'
url = 'https://duckduckgo.com/html/'
for x in range(0, len(movie)):
    try:
        if int(movie[x]['releasedate'][0]) >= YEAR:
            name = movie[x]['name'][0]
            for link in duckduckgo.search(name, max_results=10):
                print (link)
    except:

# ................f.write(resp)

        print ('error occured')

# f.close()

			
