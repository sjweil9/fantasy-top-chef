class CreateLeagueUserChefs < ActiveRecord::Migration[6.0]
  def change
    create_table :league_user_chefs do |t|
      t.references :league_user, null: false, foreign_key: true
      t.references :chef, null: false, foreign_key: true
      t.integer :pick_number

      t.timestamps
    end
  end
end
