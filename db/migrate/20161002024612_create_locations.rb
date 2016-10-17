class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.text :name
      t.text :introduction
      t.float :rating, default: 0
      t.references :category, index: true, foreign_key: true
      t.string :picture
      t.timestamps null: false
    end
  end
end
