require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(number)
  #make the web request
  film_info_array = []
  character = RestClient.get('http://www.swapi.co/api/people/'+number.to_s)
  character_hash = JSON.parse(character)
character_hash["films"].each do |film|
film_info = RestClient.get(film)
film_info_array.push(JSON.parse(film_info))
end
return film_info_array
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
#puts get_character_movies_from_api("Luke Skywalker")

def parse_character_movies(films_hash)
  films_hash.each do |film|
    puts "Title: #{film["title"]}"
    puts "Director: #{film["director"]}"
    puts
  end
end
#parse_character_movies(get_character_movies_from_api('Luke Skywalker'))

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  puts "#{character}'s Movies:"
  parse_character_movies(films_hash)
end

def display_all_characters
  puts "List of characters: "
  i = 1
 while i<=87
   if i != 17
    character = RestClient.get('http://www.swapi.co/api/people/' + (i).to_s)
    character_hash = JSON.parse(character)
    puts "#{i}. #{character_hash["name"]}"
  end
    i+=1
  end
end

#display_all_characters
#puts "Enter character: "
#character = gets.chomp
#show_character_movies(character)

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
