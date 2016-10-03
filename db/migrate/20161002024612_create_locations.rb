class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.text :name
      t.text :introduction
      t.float :rating
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
