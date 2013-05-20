class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :body, limit: 1000
      t.string :reviewer
      t.integer :movie_id

      t.timestamps
    end
  end
end
