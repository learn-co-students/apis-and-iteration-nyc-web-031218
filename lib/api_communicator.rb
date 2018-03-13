require 'rest-client'
require 'json'
require 'pry'

# RestClient.get("http://example.com/some-website/info")

def welcome
  puts "Hi! Welcome to Star Wars API. Please enter a character:"
end

def get_character_from_user
  gets.chomp
end

def find_character_info(character_hash)
  character_hash[:results].each do |hash|
  end
end



def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  character_hash
end


def find_films(character_hash, character_name)
  character_info = character_hash[:results].select {|info_hash| character_name == character_info[:name]}
  character_info[:films]
  binding.pry
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
def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

# BONUS
#
# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
