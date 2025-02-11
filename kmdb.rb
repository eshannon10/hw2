# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:

# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)

# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)

# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2

# - Do the assignment, committing and syncing often

# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle




# ASSIGNMENT BEGINS





# PART 1)
# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.

Role.destroy_all   # Delete Roles first because they depend on Movies and Actors
Movie.destroy_all  # Now it's safe to delete Movies
Actor.destroy_all  # Now it's safe to delete Actors
Studio.destroy_all # Finally, delete Studios




# PART 2)
#Generate models and tables, according to the domain model.

# run in terminal: 
#rails generate model Studio
#rails generate model Movie
#rails generate model Actor
#rails generate model Role

#manually edited the db/migrate/... files by adding new columns according to my schema


# PART 3)
# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.

# Create the studio
warner_bros = Studio.new
warner_bros["studio_name"] = "Warner Bros."  # Use "studio_name" instead of "name"
warner_bros.save

# Create movies
batman_begins = Movie.new
batman_begins["title"] = "Batman Begins"
batman_begins["year"] = 2005
batman_begins["rating"] = "PG-13"
batman_begins["studio_id"] = warner_bros.id
batman_begins.save

dark_knight = Movie.new
dark_knight["title"] = "The Dark Knight"
dark_knight["year"] = 2008
dark_knight["rating"] = "PG-13"
dark_knight["studio_id"] = warner_bros.id
dark_knight.save

dark_knight_rises = Movie.new
dark_knight_rises["title"] = "The Dark Knight Rises"
dark_knight_rises["year"] = 2012
dark_knight_rises["rating"] = "PG-13"
dark_knight_rises["studio_id"] = warner_bros.id
dark_knight_rises.save


# Create actors
christian_bale = Actor.new
christian_bale["actor_name"] = "Christian Bale"  # Use "actor_name" instead of "name"
christian_bale.save

michael_caine = Actor.new
michael_caine["actor_name"] = "Michael Caine"
michael_caine.save

liam_neeson = Actor.new
liam_neeson["actor_name"] = "Liam Neeson"
liam_neeson.save

katie_holmes = Actor.new
katie_holmes["actor_name"] = "Katie Holmes"
katie_holmes.save

gary_oldman = Actor.new
gary_oldman["actor_name"] = "Gary Oldman"
gary_oldman.save

heath_ledger = Actor.new
heath_ledger["actor_name"] = "Heath Ledger"
heath_ledger.save

aaron_eckhart = Actor.new
aaron_eckhart["actor_name"] = "Aaron Eckhart"
aaron_eckhart.save

maggie_gyllenhaal = Actor.new
maggie_gyllenhaal["actor_name"] = "Maggie Gyllenhaal"
maggie_gyllenhaal.save

tom_hardy = Actor.new
tom_hardy["actor_name"] = "Tom Hardy"
tom_hardy.save

joseph_gordon_levitt = Actor.new
joseph_gordon_levitt["actor_name"] = "Joseph Gordon-Levitt"
joseph_gordon_levitt.save

anne_hathaway = Actor.new
anne_hathaway["actor_name"] = "Anne Hathaway"
anne_hathaway.save

# Create roles
bruce_wayne = Role.new
bruce_wayne["movie_id"] = batman_begins.id
bruce_wayne["actor_id"] = christian_bale.id
bruce_wayne["character"] = "Bruce Wayne"
bruce_wayne.save

alfred = Role.new
alfred["movie_id"] = batman_begins.id
alfred["actor_id"] = michael_caine.id
alfred["character"] = "Alfred"
alfred.save

ras_al_ghul = Role.new
ras_al_ghul["movie_id"] = batman_begins.id
ras_al_ghul["actor_id"] = liam_neeson.id
ras_al_ghul["character"] = "Ra's Al Ghul"
ras_al_ghul.save

rachel_dawes = Role.new
rachel_dawes["movie_id"] = batman_begins.id
rachel_dawes["actor_id"] = katie_holmes.id
rachel_dawes["character"] = "Rachel Dawes"
rachel_dawes.save

commissioner_gordon = Role.new
commissioner_gordon["movie_id"] = batman_begins.id
commissioner_gordon["actor_id"] = gary_oldman.id
commissioner_gordon["character"] = "Commissioner Gordon"
commissioner_gordon.save




# PART 4)
# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.

for movie in Movie.all
    studio = Studio.find(movie.studio_id)
    puts movie["title"] + " " + movie["year"].to_s + " " + movie["rating"] + " " + studio["studio_name"]
  end  


# PART 5)
#Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.

for role in Role.all
    movie = Movie.find(role["movie_id"])  # Get movie title
    actor = Actor.find(role["actor_id"])  # Get actor name
    puts movie["title"] + " " + actor["actor_name"] + " " + role["character"]
  end
  
