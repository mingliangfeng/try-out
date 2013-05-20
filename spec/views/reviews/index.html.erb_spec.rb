require 'spec_helper'

describe "reviews/index" do
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
    assign(:reviews, [
      stub_model(Review,
        :title => "Title",
        :body => "Body",
        :reviewer => "Reviewer",
        :movie_id => 1
      ),
      stub_model(Review,
        :title => "Title",
        :body => "Body",
        :reviewer => "Reviewer",
        :movie_id => 1
      )
    ])
  end

  it "renders a list of reviews" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
    assert_select "tr>td", :text => "Reviewer".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
