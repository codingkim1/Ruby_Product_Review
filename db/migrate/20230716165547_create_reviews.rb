class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :product, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.integer :star_rating
      t.string :comment
 
      t.timestamps
    end
  end
end
