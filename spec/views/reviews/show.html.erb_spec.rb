require 'spec_helper'

describe "reviews/show" do
  before(:each) do
    @movie = assign(:movie, stub_model(Movie,
      :title => "Title",
      :director => "Director",
      :cast => "Cast",
      :link => "Link",
      :abstract => "Abstract",
      :language => "Language",
      :country => "Country"
    ))
    
    @review = assign(:review, stub_model(Review,
      :title => "Title",
      :body => "Body",
      :reviewer => "Reviewer"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Body/)
    rendered.should match(/Reviewer/)
  end
end
