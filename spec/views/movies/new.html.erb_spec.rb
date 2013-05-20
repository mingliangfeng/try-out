require 'spec_helper'

describe "movies/new" do
  before(:each) do
    assign(:movie, stub_model(Movie,
      :title => "MyString",
      :director => "MyString",
      :cast => "MyString",
      :link => "MyString",
      :abstract => "MyString",
      :language => "MyString",
      :country => "MyString"
    ).as_new_record)
  end

  it "renders new movie form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", movies_path, "post" do
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
