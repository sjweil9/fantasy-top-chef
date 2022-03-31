class AddSurvivalPtsToScoringSystem < ActiveRecord::Migration[6.0]
  def change
    add_column :scoring_systems, :survival_pts, :numeric
  end
end
