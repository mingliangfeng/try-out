require 'spec_helper'

describe "movies/index" do
  before(:each) do
    assign(:movies, [
      stub_model(Movie,
        :title => "Title",
        :director => "Director",
        :cast => "Cast",
        :link => "Link",
        :abstract => "Abstract",
        :language => "Language",
        :country => "Country"
      ),
      stub_model(Movie,
        :title => "Title",
        :director => "Director",
        :cast => "Cast",
        :link => "Link",
        :abstract => "Abstract",
        :language => "Language",
        :country => "Country"
      )
    ])
  end

  it "renders a list of movies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Director".to_s, :count => 2
    assert_select "tr>td", :text => "Cast".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    assert_select "tr>td", :text => "Abstract".to_s, :count => 2
    assert_select "tr>td", :text => "Language".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
  end
end
