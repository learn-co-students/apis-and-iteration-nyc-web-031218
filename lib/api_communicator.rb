require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)

  all_characters = RestClient.get('http://www.swapi.co/api/people/?search=' + character)
  character_hash = JSON.parse(all_characters)
  #inding.pry
  if character_hash['results'][0] == nil
    puts "Sorry, that's not a character. Try again"
    run
  end
  films = character_hash['results'].map do |array|
    array['films']
  end.flatten
  films.map do |film|
    film_response = JSON.parse(RestClient.get(film))
    film_response
    # binding.pry
  end
  # character_hash['results'][0]['films']
  # iterate over the character hash to  find the collection of `films` for the given
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
  films_hash.each_with_index do |film, i|
    puts "#{i+1}. #{film["title"]}"
  end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
