require 'rest-client'
require 'json'
require 'pry'


def get_character_movies_url_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)

  character_object = character_hash["results"].find{|object|
    object["name"].downcase == character
  }

  character_object["films"]
 # RETURNS:
 #  ["https://www.swapi.co/api/films/2/",
 # "https://www.swapi.co/api/films/6/",
 # "https://www.swapi.co/api/films/3/",
 # "https://www.swapi.co/api/films/1/",
 # "https://www.swapi.co/api/films/7/"]
end







def get_character_movies_from_api(character)

  character_film_urls = get_character_movies_url_from_api(character)


  #send API requests to character's films' urls and return film information
  character_film_urls.map do |url|
    film_data = RestClient.get("#{url}")
    film_parsed = JSON.parse(film_data)

    film_parsed.select do |key, value|
      ["title", "episode_id", "director", "producer", "release_date"].include?(key)
    end
  end

 #  RETURNS:
 #  [{"title"=>"The Empire Strikes Back",
 #  "episode_id"=>5,
 #  "director"=>"Irvin Kershner",
 #  "producer"=>"Gary Kurtz, Rick McCallum",
 #  "release_date"=>"1980-05-17"},
 # {"title"=>"Attack of the Clones",
 #  "episode_id"=>2,
 #  "director"=>"George Lucas",
 #  "producer"=>"Rick McCallum",
 #  "release_date"=>"2002-05-16"}
 #  ..]


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







def parse_character_movies(films_arr)
  # some iteration magic and puts out the movies in a nice list

  parsed_result = "\n"

  films_arr.each do |film|
    film.keys.each do |key|

      parsed_result += "#{key}: #{film[key]} \n"
    end

    parsed_result += "\n"
  end

  puts parsed_result
  parsed_result

  # RETURNS:
  # title: The Empire Strikes Back
  # episode_id: 5
  # director: Irvin Kershner
  # producer: Gary Kurtz, Rick McCallum
  # release_date: 1980-05-17
  #
  # title: Attack of the Clones
  # episode_id: 2
  # director: George Lucas
  # ..

end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
