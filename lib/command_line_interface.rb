def welcome
  # puts out a welcome message here!
  puts "Welcome!"
end

def get_character_from_user
  puts "Please enter a character"
  name = gets.chomp.downcase
  name = name.split(" ").map {|word| word.capitalize}.join(" ")
  if name_hash.include?(name)
    name
  else
    get_character_from_user
  end
  # until(name_hash.include?(name))
  #   get_character_from_user
  # end
  # use gets to capture the user's input. This method should return that input, downcased.
end
