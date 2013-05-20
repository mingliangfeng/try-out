require 'spec_helper'

describe "Reviews" do
  describe "GET /reviews" do
    before(:each) do
      @movie = create(:movie)
    end
    
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers      
      get movie_reviews_path(@movie)
      response.status.should be(200)
    end
  end
end
