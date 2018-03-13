require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  #binding.pry
  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  search = character_hash["results"].select do |character_index|
    character_index["name"] == character
    # binding.pry
  end
  search = search.first
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.

  search["films"].collect do |film_urls|
    films = RestClient.get(film_urls)
    films_hash = JSON.parse(films)
  end
end

def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies titles in a nice list
  films_hash.collect do |film_data|
    binding.pry
  end
  puts "hi"
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end
 get_character_movies_from_api("Luke Skywalker")
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
