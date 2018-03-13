require 'rest-client'
require 'json'
require 'pry'

def get_characters_from_api
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  #films_collection = []

  character_hash["results"]#.each do |star_wars_characters|
  #   if character == star_wars_characters["name"].downcase
  #     star_wars_characters["films"].each do |url|
  #       film_info = RestClient.get(url)
  #       film_hash = JSON.parse(film_info)
  #       films_collection << film_hash
  #     end
  #   end
  # end
  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
  # films_collection
end

def get_character_movies(character)
  films_collection = []

  get_characters_from_api.each do |star_wars_characters|
    if character == star_wars_characters["name"].downcase
      star_wars_characters["films"].each do |url|
        film_info = RestClient.get(url)
        film_hash = JSON.parse(film_info)
        films_collection << film_hash
      end
    end
  end

  films_collection
end

def get_movie_title(movie)
  character_collection = []

  get_characters_from_api.each do |star_wars_characters|
    star_wars_characters["films"].each do |url|
      film_info = RestClient.get(url)
      film_hash = JSON.parse(film_info)
      if film_hash["title"].downcase == movie.downcase
        film_hash["characters"].each do |characters_url|
          character_info = RestClient.get(characters_url)
          character_profile_hash = JSON.parse(character_info)
          character_collection << character_profile_hash
        end
      end
    end
  end

  character_collection
end

def parse_character_profiles(character_profile_hash)
  nice_characters_list = []

  character_profile_hash.each do |character|
    nice_characters_list << character["name"]
  end

  nice_characters_list.each_with_index do |character, index|
    puts "#{index + 1}. #{character}"
  end
end

def parse_character_movies(films_hash)
  nice_list = []
  films_hash.map do |movie|
    nice_list << movie["title"]
  end

  nice_list.each_with_index do |movie, index|
    puts "#{index + 1}. #{movie}"
  end
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  get_characters_from_api
  films_hash = get_character_movies(character)
  parse_character_movies(films_hash)
end

def show_movie_characters(movie)
  get_characters_from_api
  characters_profile_hash = get_movie_title(movie)
  parse_character_profiles(characters_profile_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
