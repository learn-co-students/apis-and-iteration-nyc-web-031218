require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  page_url = 'http://www.swapi.co/api/people/?page=1'
  all_characters = RestClient.get(page_url)
  character_hash = JSON.parse(all_characters)
  films = nil
  while character_hash['next'] != nil && films == nil
    character_hash['results'].each do |x|
      if x['name'] == character
        puts "adding films into the array"
        films = x['films']
      end
    end
    puts "Loading next page"
    page_url = character_hash['next']
    all_characters = RestClient.get(page_url)
    character_hash = JSON.parse(all_characters)
  end
  films.map do |film|
    film_response = JSON.parse(RestClient.get(film))
  end
end

###### ALTERNATIVE WAY OF USING THE SEARCH METHOD ON THE API ######
# def get_character_movies_from_api(character)
#   all_characters = RestClient.get('http://www.swapi.co/api/people/?search=' + character)
#   character_hash = JSON.parse(all_characters)
#   if character_hash['results'][0] == nil
#     puts "Sorry, that's not a character. Try again"
#     run
#   end
#   films = character_hash['results'].map do |array|
#     array['films']
#   end.flatten
#   films.map do |film|
#     film_response = JSON.parse(RestClient.get(film))
#   end
# end

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
