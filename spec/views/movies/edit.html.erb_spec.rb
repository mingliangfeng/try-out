require 'spec_helper'

describe "movies/edit" do
  before(:each) do
    @movie = assign(:movie, stub_model(Movie,
      :title => "MyString",
      :director => "MyString",
      :cast => "MyString",
      :link => "MyString",
      :abstract => "MyString",
      :language => "MyString",
      :country => "MyString"
    ))
  end

  it "renders the edit movie form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", movie_path(@movie), "post" do
      assert_select "input#movie_title[name=?]", "movie[title]"
      assert_select "input#movie_director[name=?]", "movie[director]"
      assert_select "input#movie_cast[name=?]", "movie[cast]"
      assert_select "input#movie_link[name=?]", "movie[link]"
      assert_select "textarea#movie_abstract[name=?]", "movie[abstract]"
      assert_select "input#movie_language[name=?]", "movie[language]"
      assert_select "input#movie_country[name=?]", "movie[country]"
    end
  end
end
