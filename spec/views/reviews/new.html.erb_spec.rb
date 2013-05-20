require 'spec_helper'

describe "reviews/new" do
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
    
    assign(:review, stub_model(Review,
      :title => "MyString",
      :body => "MyString",
      :reviewer => "MyString",
      :movie_id => 1
    ).as_new_record)
  end

  it "renders new review form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", movie_reviews_path(@movie), "post" do
      assert_select "input#review_title[name=?]", "review[title]"
      assert_select "textarea#review_body[name=?]", "review[body]"
      assert_select "input#review_reviewer[name=?]", "review[reviewer]"
    end
  end
end
