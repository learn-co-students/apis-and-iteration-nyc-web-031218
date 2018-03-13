require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)

  results = []
  still_searching = true

  while still_searching
    results << character_hash["results"]
    if character_hash["next"]
      next_page = RestClient.get(character_hash["next"])
      character_hash = JSON.parse(next_page)
    else
      still_searching = false
    end
  end

  results = results.flatten
  results = results.select {|chara| chara["name"].downcase == character}

  if results.length > 0
    film_hash = results[0]["films"].map do |film_url|
      film_query(film_url)
    end
  end
end

def film_query(film_url)
  film = RestClient.get(film_url)
  film = JSON.parse(film)
end

def parse_character_movies(films_hash)
  films_hash.each do |film|
    puts # blank line
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
    puts "Cannot find character"
  end
end

def get_movies_by_film(title)
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
