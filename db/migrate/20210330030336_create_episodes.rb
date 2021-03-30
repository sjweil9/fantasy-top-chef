class CreateEpisodes < ActiveRecord::Migration[6.0]
  def change
    create_table :episodes do |t|
      t.references :season, null: false, foreign_key: true
      t.integer :week
      t.date :air_date
      t.string :name

      t.timestamps
    end
  end
end
