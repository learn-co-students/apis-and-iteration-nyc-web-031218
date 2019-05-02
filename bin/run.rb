#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

# first run welcome method from command_line_interface.rb
# return value should be 'movie' or 'character', which we then downcase
input = welcome.downcase

# if searching for a character, we get the character name from the user
# then display the character's information
# if movie, we get the movie title from the user
# then display the movie's information
if input == "character"
 character = get_character_from_user
 show_character_movies(character)
elsif input == "movie"
  title = get_movie_from_user
  get_movies_by_film(title)
end
