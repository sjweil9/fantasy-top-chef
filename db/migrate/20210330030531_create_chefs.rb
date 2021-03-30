class CreateChefs < ActiveRecord::Migration[6.0]
  def change
    create_table :chefs do |t|
      t.string :name
      t.string :bio_link
      t.string :job_title
      t.references :season, null: false, foreign_key: true
      t.string :city

      t.timestamps
    end
  end
end
