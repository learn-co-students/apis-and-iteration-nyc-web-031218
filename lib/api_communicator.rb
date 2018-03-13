require 'rest-client'
require 'json'
require 'pry'

def get_api
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  hash = character_hash

  until hash["next"] == nil
    all_characters = RestClient.get(hash["next"])
    hash = JSON.parse(all_characters)
    character_hash["results"] += hash["results"]
  end
  return character_hash
end

def name_hash
  character_hash = get_api
  character_hash["results"].map do |hash|
    hash["name"]
  end
end

def find_winner(character_hash, character)
  return character_hash["results"].find do |hash|
    hash["name"] == character
  end
end

def get_character_movies_from_api(character)
  #make the web request
  character_hash = get_api
  winner = find_winner(character_hash, character)
  winner["films"].map do |film_url|
    film = RestClient.get(film_url)
    JSON.parse(film)
  end


  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end



def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.each do |movie_hash|
    puts movie_hash["title"]
  end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
