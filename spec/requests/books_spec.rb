require 'spec_helper'

describe "Books" do
  it "List and CRUD", js: true do
    books = FactoryGirl.create_list(:book, 3)
    
    visit books_path
    page.all('table#books tr').count.should eql(books.count + 1)
    
    click_link "New Book"
    
    fill_in "book_title", :with => "Book A"
    fill_in "book_author", :with => "Auth B"
    click_button "Submit"
    page.should have_content("Book A")

    click_link "Edit"
    
    fill_in "book_title", :with => "Book A changed"
    click_button "Submit"
    page.should have_content("Book A changed")

    click_link "Back"
    
    click_link "d#{books.first.id}"
    page.driver.browser.switch_to.alert.dismiss
    page.all('table#books tr').count.should eql(books.count + 2)

    click_link "d#{books.first.id}"
    page.driver.browser.switch_to.alert.accept
    page.all('table#books tr').count.should eql(books.count + 1)
  end
  
  context "test caching" do
    before do
      ActionController::Base.perform_caching = true
      ActionController::Base.cache_store = :file_store, "tmp/cache"
      FileUtils.rm_rf(Dir['tmp/cache'])
    end
    
    after do
      ActionController::Base.perform_caching = false
      FileUtils.rm_rf(Dir['tmp/cache'])
    end
    
    it "book_list" do
      books = FactoryGirl.create_list(:book, 3)
      visit app_path(:caching)
      page.all('ul#books li').count.should eql(books.count)
      
      FactoryGirl.create(:book)
      #visit new_book_path
      #fill_in "book_title", :with => "Book A"
      #fill_in "book_author", :with => "Auth B"
      #click_button "Submit"
      
      visit app_path(:caching)
      page.all('ul#books li').count.should eql(books.count + 1)
    end
  end
end
