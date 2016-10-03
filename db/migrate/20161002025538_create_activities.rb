class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.integer :action_type
      t.integer :target_id
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
