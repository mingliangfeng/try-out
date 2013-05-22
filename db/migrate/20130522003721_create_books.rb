class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :abstract, limit: 2000
      t.date :publish_date

      t.timestamps
    end
  end
end
