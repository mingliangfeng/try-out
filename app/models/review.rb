class Review < ActiveRecord::Base
  attr_accessible :body, :reviewable_id, :reviewable_type, :reviewer, :title
  
  belongs_to :reviewable, :polymorphic => true
  
  #TODO: movie's reviews & book's reviews, and n + 1 problem
  scope :of_type_and_or_id, lambda {|type, id| where("reviewable_type = '#{type}' #{id and "and reviewable_id = #{id}"}") }
  scope :of_movie, lambda {|id = nil| of_type_and_or_id('Movie', id) }
  scope :of_book, lambda {|id = nil| of_type_and_or_id('Book', id) }
    
  def movie
    return reviewable if Movie === reviewable
  end
  
  def movie=(m)
    self.reviewable = m
  end
  
  def book
    return reviewable if Book === reviewable
  end
  
  def book=(b)
    self.reviewable = b
  end
  
end
