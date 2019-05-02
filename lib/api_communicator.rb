require 'rest-client'
require 'json'
require 'pry'

# the below method is called on run.db
# the film_hash variable contains the hash with info on all
# the films the character has appeared in
# if the character exists, we pass the films_hash info to parse_character_movies
# otherwise throws an error message

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)

  if films_hash
    parse_character_movies(films_hash)
  else
    puts "Cannot find character"
  end
end

# first, assigns formatted character API data to character_hash
# initialize still_searching & (soon-to-be giant) results array
# use still_searching as a trigger for the while loop
# the while loop compiles all the character data that is stored
# across multiple pages/URLs in the API
# while character_hash still has a next page, "get" & store the next page
# flatten the results array, which otherwise contains multiple arrays
# select the character with the matching name and assign their data to results
# if the character is valid, the method will return a film_hash containing data
# on all the films the character appeared in

def get_character_movies_from_api(character)
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)

  results = []
  still_searching = true

  while still_searching
    results << character_hash["results"] # results pushed into results array on every loop iteration
    if character_hash["next"]
      next_page = RestClient.get(character_hash["next"])
      character_hash = JSON.parse(next_page)
    else
      still_searching = false
    end
  end

  results = results.flatten
  results = results.select {|chara| chara["name"].downcase == character}
  # results is an array containing a hash

  if results.length > 0
    film_hash = results[0]["films"].map do |film_url|
      film = RestClient.get(film_url)
      film = JSON.parse(film)
    end
  end
end

# the below method dictates what info is displayed for each movie
# that the character appears in

def parse_character_movies(films_hash)
  films_hash.each do |film|
    puts # blank line
    puts "Your character appears in:"
    puts "Star Wars Episode #{film["episode_id"]}"
    puts film["title"]
    puts film["opening_crawl"]
  end
end

# if the user searches by title, run.db calls the below method
# NOTE: the API url changes for films vs characters
# first assign the formatted movies hash to movies_hash
# use .select method to select the correct film from movies_hash
# if the title of the movie exists, display movie info
# otherwise throws an error message

def get_movies_by_film(title)
  all_movies = RestClient.get('http://www.swapi.co/api/films/')
  movies_hash = JSON.parse(all_movies)

  results = movies_hash["results"].select {|movie| movie["title"].downcase == title}
  # results is an array containing a hash

  if results[0].length > 0
    puts "Title: #{results[0]["title"]}"
    puts "Director: #{results[0]["director"]}"
    puts "Release Date: #{results[0]["release_date"]}"
  else
    puts "Movie not found"
  end
end
