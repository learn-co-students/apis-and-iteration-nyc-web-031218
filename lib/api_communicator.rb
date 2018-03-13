require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  character_hash = get_JSON('http://www.swapi.co/api/people/')

  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.


  movies = get_films(character_hash, character)

  # movies = character_hash["results"].map do |person|
  #   if person["name"] == character
  #     person["films"]
  #   end
  # end.flatten.compact

  films_hash = get_films_hash(movies)

  parse_character_movies(films_hash)
end

def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  titles = get_titles(films_hash)

  print_titles(titles)
end

def print_titles(titles)
  titles.each_with_index do |val, index|
    puts "#{index+1} #{val}"
  end
end
def get_titles(films_hash)
  films_hash.map do |film|
    film["title"]
  end.compact
end


def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end


def get_JSON(url)
  JSON.parse(RestClient.get(url))
end

def get_films(character_hash, character)
  character_hash["results"].map do |person|
    if person["name"] == character
      person["films"]
    end
  end.flatten.compact
end

def get_films_hash(movies)
  movies.map do |movie|
    get_JSON(movie)
  end
end

## BONUS



# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
