def welcome
  puts "Welcome to the Star Wars Search program!"
  puts "May the force be with you. Always."
end

def get_character_from_user
  puts "Please enter a character."
  gets.chomp.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end

def get_title_from_user
  puts "Please enter a title."
  gets.chomp.downcase
end
