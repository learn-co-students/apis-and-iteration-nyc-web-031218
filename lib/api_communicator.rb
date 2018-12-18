require 'rest-client'
require 'json'
require 'pry'


  def url(count)
    all_characters = RestClient.get("https://swapi.co/api/people/?page=#{count}")
    character_hash = JSON.parse(all_characters)
  end

  def film_lists(film_urls)

  end

def get_character_movies_from_api(character)
  films_hash={}

count =1
until count==10 do
  character_hash=url(count)
  results=character_hash["results"]
    results.each do |element|
      # binding.pry
      if element["name"] == character
          film_urls = character_hash["results"][0]["films"] #returns array of film urls that the char has been in
          # binding.pry
          film_urls.each do |film|
            film= RestClient.get("#{film}")
            parsed_film= JSON.parse(film)
            title= parsed_film["title"]
            films_hash[title]= parsed_film
          end
      end
    end
  count+=1
end
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
