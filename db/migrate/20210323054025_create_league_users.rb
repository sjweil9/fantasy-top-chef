class CreateLeagueUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :league_users do |t|
      t.references :league, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :is_manager
      t.string :team_name

      t.timestamps
    end
  end
end
