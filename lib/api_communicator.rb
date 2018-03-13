require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)

  results = character_hash["results"].select {|chara| chara["name"].downcase == character}

  if results.length > 0
    film_hash = results[0]["films"].map do |film_url|
      film_query(film_url)
    end
  else
    puts "Character not found"
  end
end

def get_movie_from_user
  puts "Enter title of movie"
  title = gets.chomp

  get_movies_by_film(title)
end

def get_movies_by_film(title)
  title = title.downcase
  all_movies = RestClient.get('http://www.swapi.co/api/films/')
  movies_hash = JSON.parse(all_movies)

  results = movies_hash["results"].select {|movie| movie["title"].downcase == title}

  if results[0].length > 0
    puts "Title: #{results[0]["title"]}"
    puts "Director: #{results[0]["director"]}"
    puts "Release Date: #{results[0]["release_date"]}"
  else
    puts "Movie not found"
  end
end

def film_query(film_url)
  film = RestClient.get(film_url)
  film = JSON.parse(film)
end

def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.each do |film|
    puts
    puts "Your character appears in:"
    puts "Star Wars Episode #{film["episode_id"]}"
    puts film["title"]
    puts film["opening_crawl"]
  end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)

  if films_hash
    parse_character_movies(films_hash)
  else
    puts "Still cannot find character"
  end
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
