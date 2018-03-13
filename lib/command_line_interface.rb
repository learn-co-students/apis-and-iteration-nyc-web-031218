# the welcome method asks whether the user wants to search a movie or character
# if input is invalid, displays error message
# otherwise returns the input, which will be used in run.db
def welcome
  puts "Welcome to the Star Wars Character Search!"
  puts "Are you searching for a movie or a character?"

  input = gets.chomp.downcase

  if input == "movie" || input == "character"
    input
  else
    puts "Sorry, please try again"
  end
end

# the below methods are called from run.db
def get_character_from_user
  puts "Please enter a character"
  character = gets.chomp.downcase
end

def get_movie_from_user
  puts "Enter title of movie"
  title = gets.chomp.downcase
end
