# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

m = Movie.create(title: "The Godfather", director: "Francis Ford Coppola", cast: "Marlon Brando / Al Pacino / James Caan / Robert Duvall / Diane Keaton")
m.reviews.create(title: "For Men", body: "This is the movie every man should watch.", reviewer: "a man")

b = Book.create(title: "Cloudstreet", author: "Tim Winton", abstract: 'Precipitated by separate personal tragedies, two families flee their rural livings to share a "great continent of a house", Cloudstreet, in the Perth suburb of West Leederville.')
b.reviews.create(title: "Dysfunctional Families Australian Style. ", body: "Tim Winton is a most spiritual writer. It's shameful in a world of bloated, overachieving prose that screams to the top of best-selling lists that someone as connected to the forces of nature and the foibles of man should be so little known. ", reviewer: "minstrel")
