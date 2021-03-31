class CreateDrafts < ActiveRecord::Migration[6.0]
  def change
    create_table :drafts do |t|
      t.references :league, null: false, foreign_key: true
      t.datetime :ended_at
      t.json :pick_order
      t.integer :current_pick_user_id

      t.timestamps
    end
  end
end
