# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

m = Movie.create(title: "The Godfather", director: "Francis Ford Coppola", cast: "Marlon Brando / Al Pacino / James Caan / Robert Duvall / Diane Keaton")

m.reviews.create(title: "For Men", body: "This is the movie every man should watch.", reviewer: "a man")
