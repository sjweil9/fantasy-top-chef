class CreateLeagues < ActiveRecord::Migration[6.0]
  def change
    create_table :leagues do |t|
      t.references :season, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
