class Chef < ApplicationRecord
  belongs_to :season
  has_many :episode_chefs

  validates :name, uniqueness: { scope: :season_id }

  def episode_for(number)
    episode_chefs.joins(:episode).where(episodes: { week: number }).first
  end
end
