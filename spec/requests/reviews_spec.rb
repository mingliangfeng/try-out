require 'spec_helper'

describe "Reviews" do
  describe "movie reviews" do
    
    let(:reviewables) { [create(:movie), create(:book)] }
    
    it "List" do
      reviewables.each do |reviewable|
        visit reviewable_reviews_path(reviewable)
        reviewable.reviews.each do |review|
          page.should have_content(review.title)
        end
        #save_and_open_page
      end         
    end
    
    it "CRUD", :js => true do
      reviewables.each do |reviewable|
        visit reviewable_reviews_path(reviewable)
        click_link "New Review"
        
        fill_in "review_title", :with => "IMO"
        fill_in "review_body", :with => "IMO"
        fill_in "review_reviewer", :with => "some guy"
        click_button "Submit"
        page.should have_content("IMO")

        click_link "Edit"
        
        fill_in "review_title", :with => "IMO changed"
        fill_in "review_body", :with => "IMO"
        fill_in "review_reviewer", :with => "some guy"
        click_button "Submit"
        page.should have_content("IMO changed")

        click_link "Back"
        
        reviews_num = page.all("table#reviews tbody tr").count
        reviews_num.should be > 1
        
        click_link "Show"
        click_link "Back"        
        
        click_link "Destroy"
        page.driver.browser.switch_to.alert.dismiss
        page.all('table#reviews tr').count.should eql(reviews_num)

        click_link "Destroy"
        page.driver.browser.switch_to.alert.accept
        page.all('table#reviews tr').count.should eql(reviews_num - 1)
      end
    end
  end
  
  describe "book reviews" do
  end
end
