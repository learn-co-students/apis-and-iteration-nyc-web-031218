def welcome
  puts "Welcome to the Star Wars Character Search!"
end

def get_character_from_user
  puts "please enter a character"
  # use gets to capture the user's input. This method should return that input, downcased.
  search = gets.chomp.downcase
end
