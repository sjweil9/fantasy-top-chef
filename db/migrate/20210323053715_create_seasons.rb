class CreateSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :seasons do |t|
      t.date :start_date
      t.date :end_date
      t.string :name
      t.integer :season_year

      t.timestamps
    end
  end
end
