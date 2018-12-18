require 'rest-client'
require 'json'
require 'pry'




def get_character_movies_from_api(character)

 loop do
    character_hash["results"].each do |info|
      # binding.pry
      if info["name"] == character
        return info["films"]
      end
    end
    next_page = RestClient.get(character_hash["next"])
    character_hash = JSON.parse(next_page)
    break if character_hash["next"] == "null" ||  character_hash["next"] == nil
    end
end

def parse_character_movies(films_hash)
 # binding.pry
 films_hash.each_with_index do |movie_url, index|
   calling = RestClient.get(movie_url)
   parsed_film = JSON.parse(calling)
   title = parsed_film["title"]
   puts "#{index+1}. #{title}"

 end

end


def show_character_movies(character)
 films_hash = get_character_movies_from_api(character)
 parse_character_movies(films_hash)
end
