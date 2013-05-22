require 'spec_helper'

describe "Movies" do
  it "List and CRUD", js: true do
    movies = FactoryGirl.create_list(:movie, 3)
    
    visit movies_path
    page.all('table#movies tr').count.should eql(movies.count + 1)
    
    click_link "New Movie"
    
    fill_in "movie_title", :with => "Movie A"
    fill_in "movie_director", :with => "Dir B"
    click_button "Submit"
    page.should have_content("Movie A")

    click_link "Edit"
    
    fill_in "movie_title", :with => "Movie A changed"
    click_button "Submit"
    page.should have_content("Movie A changed")

    click_link "Back"
    
    click_link "d#{movies.first.id}"
    page.driver.browser.switch_to.alert.dismiss
    page.all('table#movies tr').count.should eql(movies.count + 2)

    click_link "d#{movies.first.id}"
    page.driver.browser.switch_to.alert.accept
    page.all('table#movies tr').count.should eql(movies.count + 1)
  end
end
