#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

input = welcome

if input == "character"
 character = get_character_from_user
 show_character_movies(character)
elsif input == "movie"
  get_movie_from_user
end
