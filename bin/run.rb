#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

def run
  loop do
    choice = input_choice
    if choice == '1'
      character = get_character_from_user
      show_character_movies(character)
    elsif choice == '2'
      title = get_title_from_user
      show_opening_crawl(title)
    elsif choice == '3'
      break
    else
      puts "Invalid response."
    end
  end
end

welcome
run
