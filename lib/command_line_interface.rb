def welcome
  puts "Welcome to the Star Wars Character Search!"
  puts "Are you searching for a movie or a character?"

  input = gets.chomp

  if input.downcase == "movie" || input.downcase == "character"
    input
  else
    puts "Sorry, please try again"
  end
end

def get_character_from_user
  puts "please enter a character"
  # use gets to capture the user's input. This method should return that input, downcased.
  search = gets.chomp.downcase
end
