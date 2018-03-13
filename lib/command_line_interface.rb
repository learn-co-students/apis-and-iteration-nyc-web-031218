def welcome
  puts "Welcome to the Star Wars Wiki App"
  puts "You can use this to get info about a SW Character"
  display_all_characters
end

def get_character_from_user
  puts "please enter a character"
  gets.chomp
end
