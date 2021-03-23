class CreateScoringSystems < ActiveRecord::Migration[6.0]
  def change
    create_table :scoring_systems do |t|
      t.numeric :qf_win_pts
      t.numeric :qf_fav_pts
      t.numeric :elim_win_pts
      t.numeric :elim_top_pts
      t.numeric :elim_bottom_pts
      t.numeric :lck_win_pts
      t.numeric :lck_champ_pts
      t.numeric :champ_pts
      t.numeric :finale_pts

      t.timestamps
    end
  end
end
