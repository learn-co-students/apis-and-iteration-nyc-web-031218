
require 'rest-client'
require 'json'
require 'pry'
$arr = []
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
  name_num = $arr[(character.to_i)-1]
  if character.to_i > 17
    name_num = $arr[(character.to_i)-2]
  end
  films_hash = get_character_movies_from_api(character)
  puts "#{name_num[name_num.index(' ')..name_num.length]}'s Movies:"
  parse_character_movies(films_hash)
end

def display_all_characters
  puts "List of characters: "
  i = 1
 while i<=9
    character = RestClient.get('http://www.swapi.co/api/people/?page=' + (i).to_s)
    character_hash = JSON.parse(character)
    character_hash["results"].each do |character|
      if character["url"][32..-2] != "17"
        $arr.push("#{character["url"][32..-2]}. #{character["name"]}")
      end
    end
    i+=1
  end
  $arr.sort!{ |y,x|

    y[0..y.index('.')-1].to_i - x[0..x.index('.')-1].to_i  }
  $arr.each{ |character|
puts character  }
end

#display_all_characters
#puts "Enter character: "
#character = gets.chomp
#show_character_movies(character)

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
