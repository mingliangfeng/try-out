require 'spec_helper'

describe "movies/show" do
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
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Director/)
    rendered.should match(/Cast/)
    rendered.should match(/Link/)
    rendered.should match(/Abstract/)
    rendered.should match(/Language/)
    rendered.should match(/Country/)
  end
end
