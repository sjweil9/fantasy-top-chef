class CreateLeagueScoringSystems < ActiveRecord::Migration[6.0]
  def change
    create_table :league_scoring_systems do |t|
      t.references :league, null: false, foreign_key: true
      t.references :scoring_system, null: false, foreign_key: true

      t.timestamps
    end
  end
end
