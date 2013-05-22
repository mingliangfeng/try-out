class Book < ActiveRecord::Base
  attr_accessible :abstract, :author, :publish_date, :title
  
  has_many :reviews, as: :reviewable
end
