require 'rest-client'
require 'json'
require 'pry'

# Directions:
# iterate over the character hash to find the collection of `films` for the given
#   `character`
# collect those film API urls, make a web request to each URL to get the info
#  for that film
# return value of this method should be collection of info about each film.
#  i.e. an array of hashes in which each hash reps a given film
# this collection will be the argument given to `parse_character_movies`
#  and that method will do some nice presentation stuff: puts out a list
#  of movies by title. play around with puts out other info about a given film.

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  find_films(character_hash, character)
end

def find_films(character_hash, character_name)
  character_info = character_hash["results"].find { |char| character_name == char["name"]}
  urls = character_info["films"]

  titles = urls.map do |url|
    title = RestClient.get(url)
    JSON.parse(title)
  end

  titles
end

# films is an array of hashes for each movie
def parse_character_movies(films)
  # some iteration magic and puts out the movies in a nice list
  # sorted_array_of_hashes_by_episode_number below

  sorted_films = films.sort_by{|movie_hash| movie_hash["episode_id"]}

  sorted_films.each do |sorted_movie_hash|
    puts sorted_movie_hash["episode_id"].to_s + " " + sorted_movie_hash["title"]
  end
end


def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  parse_character_movies(films_array)
end

# BONUS
#
# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
