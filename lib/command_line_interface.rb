def welcome
  # puts out a welcome message here!
  puts "Welcome!"
end

def input_choice
  puts "Enter 1 for character search; enter 2 for film search."
  gets.chomp
end

def get_character_from_user
  puts "Please enter a character."
  # use gets to capture the user's input. This method should return that input, downcased.
  gets.chomp
end

def get_title_from_user
  puts "Please enter a film title."
  gets.chomp
end
