class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.string :cast
      t.string :link
      t.string :abstract, limit: 2000
      t.string :language
      t.string :country

      t.timestamps
    end
  end
end
