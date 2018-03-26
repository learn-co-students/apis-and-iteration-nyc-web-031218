require 'rest-client'
require 'json'
require 'pry'



# title = info["results"][0]["name"]
#release_date = info["results"][0]["original_release_date"]
## description = info["results"][0]["description"] ##we will need to split it up.

#DATE
# Month = info["results"][0]["expected_release_month"]
# day = info["results"][0]["expected_release_day"]
# year = info["results"][0]["expected_release_year"]

#ESRB = info["results"][0]["original_game_rating"][1]["name"] => "ESRB: M"


puts "Provide game title"
game =gets.chomp

response = RestClient.get("https://www.giantbomb.com/api/search/?api_key=a26f1d3d0feef9d1adb3a185cc41fb7523921261&format=json&query=" + game+ "&resources=game",
            :headers =>{:content_type => :json, :Accept => "application/json", :'user-key' => "a3e18d0c5333492100deecf551dbb164"})
        # {Accept: "application/json", param: {"user-key" => a3e18d0c5333492100deecf551dbb164, "https://api-2445582011268.apicast.io/games/"}})
info = JSON.parse(response)
binding.pry

puts "h"
# RestClient.post(url, payload, headers={})
# gem install igdb_api
# Igdb.connect('api_key')
# Igdb.connect('a3e18d0c5333492100deecf551dbb164')

# curl -X GET --header "Accept: application/json" --header "user-key: a3e18d0c5333492100deecf551dbb164" "https://api-2445582011268.apicast.io/games/"

  #
  # data_other = RestClient.get("")
  # hash_data = JSON.parse(data)
