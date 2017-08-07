import json
try:
	with open('modified_movie.json',encoding='cp1252') as d:
		data = json.load(d);
		print(data);
