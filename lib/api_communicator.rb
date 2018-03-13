require 'rest-client'
require 'json'
require 'pry'
require 'colorize'

def import_movie_data
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
end

def get_character_data_from_hash(character, character_hash)
  #make the web request
  #binding.pry
  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  search = character_hash["results"].select do |character_index|
    character_index["name"] == character
    # binding.pry
  end
  search = search.first

end
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
def get_character_films(character_data)
  character_data["films"].collect do |film_urls|
    films = RestClient.get(film_urls)
    films_hash = JSON.parse(films)
  end
end

def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies titles in a nice list
  films_hash.each do |film_data|
    puts film_data["title"]
    #binding.pry
  end
end

def show_character_movies(character)
  character_hash = import_movie_data
  character_data = get_character_data_from_hash(character, character_hash)
  films_hash = get_character_films(character_data)
  parse_character_movies(films_hash)
end
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
def import_film_data
  all_films = RestClient.get('http://www.swapi.co/api/films/')
  films_hash = JSON.parse(all_films)
end

def get_film_data_from_hash(title, films_hash)
  #make the web request
  #binding.pry
  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  search = films_hash["results"].select do |film_index|
    film_index["title"]
    # binding.pry
  end
  search = search.first
end

def print_crawl(film_data)
  #binding.pry
  puts film_data["opening_crawl"].yellow
end

def show_opening_crawl(title)
  films_hash = import_film_data
  film_data = get_film_data_from_hash(title, films_hash)
  print_crawl(film_data)
end
