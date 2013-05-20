class Review < ActiveRecord::Base
  attr_accessible :body, :movie_id, :reviewer, :title
  
  belongs_to :movie
end
