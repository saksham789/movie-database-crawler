from bs4 import BeautifulSoup
import urllib.request
import urllib.parse
import json
from pprint import pprint
import string
f = open('movie_data.txt','w')
YEAR = 2000
with open("movie.json",encoding='cp1252') as movie_list:
	movie = json.load(movie_list)
headers = {}
headers['Accept']="text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
headers['Accept-Encoding']="gzip, defalte"
headers['Connection']="keep-alive"
#headers['Host']="api.cinemalytics.in"
headers['User-Agent'] = "Mozilla/5.0 (X11; Linux x86_64; rv:54.0) Gecko/20100101 Firefox/54.0"
for x in range(0,len(movie)):
	try:
		if(int(movie[x]['releasedate'][0]) >= YEAR):
			name=movie[x]['name'][0]
			name = name.replace(' ','%20')
			name = name.replace('\u2013','-')
			name = name.replace('\u2026','-')
			name = name.replace('\u2019','-')
			url = 'http://api.cinemalytics.in/v2/movie/title/?value='+name+'&auth_token=B8B0E93A2E911C893387530C0CBDDBBC'
			print(url)
			req=urllib.request.Request(url,headers=headers)
			resp = str(urllib.request.urlopen(req).read())+'\n'
			if(len(resp)>10):
				f.write(resp)
	except:
		print('error occured')
f.close()
