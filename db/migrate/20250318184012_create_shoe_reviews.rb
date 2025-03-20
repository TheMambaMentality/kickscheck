class CreateShoeReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :shoe_reviews do |t|
      t.string :title
      t.text :content
      t.integer :rating
      t.references :manufacturer, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
