module ReviewsHelper
  
  def method_missing(name, *args, &block)
    if name =~ /^(new_|edit_)?reviewable_review(s)?(_path|_url)?/
      true_name = name.to_s.sub("reviewable", args.first.class.to_s.downcase)
      send(true_name, *args, &block)
    else
      super
    end
  end
  
=begin
  def reviewable_reviews_url(reviewable)
    send("#{reviewable.class.to_s.downcase}_reviews_url", reviewable)
  end
  
  def reviewable_review_url(reviewable, review)
    send("#{reviewable.class.to_s.downcase}_review_url", reviewable, review)
  end
  
  def reviewable_review_path(reviewable, review)
    send("#{reviewable.class.to_s.downcase}_review_path", reviewable, review)
  end
  
  def reviewable_reviews_path(reviewable)
    send("#{reviewable.class.to_s.downcase}_reviews_path", reviewable)
  end
  
  def edit_reviewable_review_path(reviewable, review)
    send("edit_#{reviewable.class.to_s.downcase}_review_path", reviewable, review)
  end
  
  def new_reviewable_review_path(reviewable)
    send("new_#{reviewable.class.to_s.downcase}_review_path", reviewable)
  end
=end

end
