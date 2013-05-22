class ReviewsController < ApplicationController
  include ReviewsHelper
  
  expose(:reviewable) do
    m = /^\/(?<reviewable_type>\w+)\/(?<reviewable_id>\d+)\/reviews/.match(request.fullpath)
    return nil unless m
    reviewable_type = m[:reviewable_type].singularize.capitalize
    reviewable_class = reviewable_type.classify.constantize
    reviewable_id = m[:reviewable_id]
    reviewable_class.find(reviewable_id) #TODO: hanlde exception when class does not exist
  end
  
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = reviewable.reviews

    respond_to do |format|
      format.html
      format.json { render json: @reviews }
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = reviewable.reviews.find(params[:id])

    respond_to do |format|
      format.html do
        if request.xhr?
          render "show-xhr", :layout => nil
        else
          render
        end
      end
      format.json { render json: @review }
    end
  end

  # GET /reviews/new
  # GET /reviews/new.json
  def new
    @review = reviewable.reviews.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/1/edit
  def edit
    @review = reviewable.reviews.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = reviewable.reviews.build(params[:review])

    respond_to do |format|
      if @review.save
        format.html { redirect_to reviewable_review_url(reviewable, @review), notice: 'Review was successfully created.' }
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
    @review = reviewable.reviews.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to reviewable_review_url(reviewable, @review), notice: 'Review was successfully updated.' }
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
    @review = reviewable.reviews.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviewable_reviews_url(reviewable) }
      format.json { head :no_content }
    end
  end

end
