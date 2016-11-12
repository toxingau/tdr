class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :location, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :content
      t.integer :rating
      
      t.timestamps null: false
    end
    add_index :reviews, [:user_id, :created_at]
  end
end
