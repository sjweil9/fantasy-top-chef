class LeagueUser < ApplicationRecord
  belongs_to :league
  belongs_to :user

  has_many :league_user_chefs
  has_many :chefs, through: :league_user_chefs

  has_many :episode_chefs, through: :chefs

  validates :team_name, presence: true

  def recalculate_total_points!
    update(total_points: new_point_total)
  end

  def new_point_total
    chefs.reduce(0.0) do |sum, chef|
      sum + league.scoring_system.season_points_for(chef)
    end
  end
end
