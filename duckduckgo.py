import requests
from lxml import html
def search(keywords ):
	url = 'https://duckduckgo.com/html/'
	params = {
		'q': keywords,
	}
	res = requests.post(url, data=params)
	return (str(res.text))
