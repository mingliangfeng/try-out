class BookSweeper < ActionController::Caching::Sweeper
  observe Book
 
  def after_create(book)
    expire_fragment_cache
  end
 
  def after_update(book)    
    expire_fragment_cache
  end
 
  def after_destroy(book)
    expire_fragment_cache
  end
 
private
  def expire_fragment_cache
    #expire_fragment('book_list') not working when the callback is not from controller
    Rails.cache.delete(fragment_cache_key("book_list"))
  end
  
  def fragment_cache_key(key)
    ActiveSupport::Cache.expand_cache_key(key, :views)
  end

end