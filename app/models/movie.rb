class Movie < ActiveRecord::Base
  attr_accessible :abstract, :cast, :country, :director, :language, :link, :title
  
  has_many :reviews, as: :reviewable
end
