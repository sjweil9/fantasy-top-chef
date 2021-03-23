class LeagueScoringSystem < ApplicationRecord
  belongs_to :league
  belongs_to :scoring_system
end
