require 'rest-client'
require 'json'
require 'pry'


  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
  def url(count)

  end

def get_character_movies_from_api(character)
  films_hash={}

count =1
until count==10 do
  all_characters = RestClient.get("https://swapi.co/api/people/?page=#{count}")
  character_hash = JSON.parse(all_characters)
  results=character_hash["results"]
  # next_page=character_hash["next"]
  # binding.pry
    results.each do |element|
      # binding.pry
      if element["name"] == character
        # puts "We got this far"
          list_of_films = character_hash["results"][0]["films"]
          list_of_films.each do |film|
            film= RestClient.get("#{film}")
            parsed_film= JSON.parse(film)
            title= parsed_film["title"]
            films_hash[title]= parsed_film
          end
      end
    end
  count+=1
end# # binding.pry
films_hash
# binding.pry
end


def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.keys.each_with_index do |movie, index|
    puts "#{index+1}. #{movie}."
  end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
