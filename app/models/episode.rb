class Episode < ApplicationRecord
  belongs_to :season
  has_many :episode_chefs

  def quickfire_winner
    episode_chefs.detect(&:qf_winner?)&.chef
  end

  def quickfire_runners_up
    episode_chefs.select(&:qf_runner_up?).map(&:chef)
  end

  def elim_winner
    episode_chefs.detect(&:elim_winner?)&.chef
  end

  def elim_runners_up
    episode_chefs.select(&:elim_runner_up?).map(&:chef)
  end

  def eliminated_chef
    episode_chefs.detect(&:eliminated?)&.chef
  end

  def elim_bottom_chefs
    episode_chefs.select(&:elim_bottom?).map(&:chef)
  end

  def lck_winner
    episode_chefs.detect(&:lck_winner?)&.chef
  end

  def sweep?
    elim_winner == quickfire_winner
  end

  def completed?
    episode_chefs.present?
  end
end
