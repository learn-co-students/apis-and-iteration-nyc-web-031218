#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

def run
  welcome
  choice = input_choice
  if choice == '1'
    character = get_character_from_user
    show_character_movies(character)
  elsif choice == '2'
    title = get_title_from_user
    show_opening_crawl(title)
  else
    puts "Invalid response."
    run
  end
end

run
