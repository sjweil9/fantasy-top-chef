class AddSurvivalToScoringSystem < ActiveRecord::Migration[6.0]
  def change
    add_column :scoring_systems, :survival, :numeric
  end
end
