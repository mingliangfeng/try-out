require "spec_helper"

describe ReviewsController do
  describe "routing" do

    it "routes to #index" do
      get("/movies/1/reviews").should route_to("reviews#index", movie_id: "1")
    end

    it "routes to #new" do
      get("/movies/1/reviews/new").should route_to("reviews#new", movie_id: "1")
    end

    it "routes to #show" do
      get("/movies/1/reviews/1").should route_to("reviews#show", :id => "1", movie_id: "1")
    end

    it "routes to #edit" do
      get("/movies/1/reviews/1/edit").should route_to("reviews#edit", :id => "1", movie_id: "1")
    end

    it "routes to #create" do
      post("/movies/1/reviews").should route_to("reviews#create", movie_id: "1")
    end

    it "routes to #update" do
      put("/movies/1/reviews/1").should route_to("reviews#update", :id => "1", movie_id: "1")
    end

    it "routes to #destroy" do
      delete("/movies/1/reviews/1").should route_to("reviews#destroy", :id => "1", movie_id: "1")
    end

  end
end
