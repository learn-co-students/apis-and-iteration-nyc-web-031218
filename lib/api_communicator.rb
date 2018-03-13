require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)

while character_hash
    film_urls = character_hash["results"].find do |hash|
      hash["name"].downcase == character
    end
    if film_urls
      return film_urls["films"].map do |film|
        JSON.parse(RestClient.get(film))
      end
    end
    character_hash = character_hash["next"] ? JSON.parse(RestClient.get(character_hash["next"])) : nil
  end
end





def parse_character_movies(films_hash)
  films_hash.each do |movie|
    puts "Title: #{movie["title"]}"
    puts "Opening Crawl: #{movie["opening_crawl"][0..140]}..."
    puts "Episode No: #{movie["episode_id"]}"
    puts "--" * 20
end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
