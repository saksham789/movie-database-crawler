var fs = require('fs');
var jsdom = require('jsdom/lib/old-api.js');
var request = require('request');
var cheerio = require('cheerio');
var data = fs.readFileSync('data.json','utf8');
var jquery = fs.readFileSync("./jquery-1.6.min.js").toString();
data = JSON.parse(data);
var length = data.length;
ans = [];
for(var i in data){
	var temp = JSON.parse(data[i]).wikipedia;
	var name = JSON.parse(data[i]).name;
	if(temp != ""){
		// request url 
		request(temp,function(error,response,html){
			if(!error && response.statusCode == 200){
				//scrapping html
				console.log("scraping begins...");
				var tmp = [];
				$ = cheerio.load(html);
				try{
					var temp = $(".infobox > tbody").text();
					temp.replace("\n"," ");
					tmp.push(temp);
					tmp.push(name);
					console.log(name);
					//console.log(temp);
					ans.push(tmp);
					console.log(i);
					if(i == length-1){
						console.log(ans.length);
						sexy();
					}
				} catch(err){
					console.log("error");
				}
			}
		});
	}
}

function sexy(){
console.log(ans.length);
fs.writeFile('./wiki.json',JSON.stringify(ans),function(err){
							if(err){
								console.log("write error");
								}
							}
						);
}
