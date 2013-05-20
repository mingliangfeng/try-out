class ReviewsController < ApplicationController
  before_filter :get_movie
  
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = @movie.reviews

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviews }
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = @movie.reviews.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/new
  # GET /reviews/new.json
  def new
    @review = @movie.reviews.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/1/edit
  def edit
    @review = @movie.reviews.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = @movie.reviews.build(params[:review])

    respond_to do |format|
      if @review.save
        format.html { redirect_to movie_review_path(@movie, @review), notice: 'Review was successfully created.' }
        format.json { render json: @review, status: :created, location: @review }
      else
        format.html { render action: "new" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reviews/1
  # PUT /reviews/1.json
  def update
    @review = @movie.reviews.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to movie_review_url(@movie, @review), notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review = @movie.reviews.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to movie_reviews_url(@movie) }
      format.json { head :no_content }
    end
  end
  
private
  def get_movie
    @movie = Movie.find(params[:movie_id])
  end
end
