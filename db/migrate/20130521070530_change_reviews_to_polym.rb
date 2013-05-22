class ChangeReviewsToPolym < ActiveRecord::Migration
  def change
    rename_column :reviews, :movie_id, :reviewable_id
    add_column :reviews, :reviewable_type, :string
  end

end
