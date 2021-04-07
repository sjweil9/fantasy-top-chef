class Episode < ApplicationRecord
  belongs_to :season
  has_many :episode_chefs

  def quickfire_winner
    episode_chefs.detect(&:quickfire_winner?)
  end

  def quickfire_runners_up
    episode_chefs.select(&:quickfire_runner_up?)
  end
end
