class LeagueUser < ApplicationRecord
  belongs_to :league
  belongs_to :user

  has_many :league_user_chefs
  has_many :chefs, through: :league_user_chefs

  has_many :episode_chefs, through: :chefs

  validates :team_name, presence: true
end
