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
temp = []
t_data = ['facebook','youtube','wikipedia']
for x in range(0, len(movie)):
    try:
        if int(movie[x]['releasedate'][0]) >= YEAR:
            name = movie[x]['name'][0]
            print(name)
            rr = search(name)
            soupp = BeautifulSoup(rr,'html.parser')
            souppp = soupp.select(".result__url")
            data = {}
            data[t_data[0]] = ""
            data[t_data[1]] = ""
            data[t_data[2]] = ""
            for y in t_data:
                for x in souppp:
                    result = str(x).find(y)
                    if(result != -1):
                        data[y] = x['href']
                        break
            data['name'] = name
            pprint(data)
            temp.append(json.dumps(data))
    except:
        print ('error occured')
with open('data.txt', 'w') as outfile:  
    json.dump(temp,"duck_data.json")


			