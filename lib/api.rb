require 'rest-client'
require 'json'
require 'pry'



# title = info["results"][0]["name"]
# release_date = info["results"][0]["original_release_date"]
## description = info["results"][0]["description"] ##we will need to split it up.

#DATE
# Month = info["results"][0]["expected_release_month"]
# day = info["results"][0]["expected_release_day"]
# year = info["results"][0]["expected_release_year"]

#ESRB = info["results"][0]["original_game_rating"][1]["name"] => "ESRB: M"
def url
  "https://www.giantbomb.com/api/search/?api_key=a26f1d3d0feef9d1adb3a185cc41fb7523921261&format=json&query="

end


titles_array = ["Halo", "Mario Kart", "Call of Duty","God of War", "Mortal Kombat X", "Kirby",
    "Super Smash Bros", "Team Fortress 2", "Sunset Overdrive", "Gears of War", "Bioshock",
    "Fable", "Final Fantasy", "Counter Strike", "Left 4 Dead", "Portal",
    "Banjo", "Donkey Kong", "Crash Bandicoot", "Need for speed", "Ricochet", "Half life", "Playground"]



# puts "Provide game title"
# game =gets.chomp



        # {Accept: "application/json", param: {"user-key" => a3e18d0c5333492100deecf551dbb164, "https://api-2445582011268.apicast.io/games/"}})
# info = JSON.parse(response)

titles_array.each do |title|
  game = title
  response = RestClient.get(url+ game+ "&resources=game", :headers =>{:content_type => :json, :Accept => "application/json", :'user-key' => "a3e18d0c5333492100deecf551dbb164"})
  info = JSON.parse(response)
  release_date = info["results"][0]["original_release_date"]

  if release_date == nil
    release_date ="N/A"
  end
  puts "Title: " + info["results"][0]["name"] + " Release Date " + release_date

end



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
