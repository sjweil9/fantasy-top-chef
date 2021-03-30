class CreateEpisodeChefs < ActiveRecord::Migration[6.0]
  def change
    create_table :episode_chefs do |t|
      t.references :episode, null: false, foreign_key: true
      t.references :chef, null: false, foreign_key: true
      t.boolean :qf_win
      t.boolean :qf_fav
      t.boolean :elim_win
      t.boolean :elim_top
      t.boolean :elim_bottom
      t.boolean :lck_win
      t.boolean :lck_champ
      t.boolean :champ
      t.boolean :finale

      t.timestamps
    end
  end
end
