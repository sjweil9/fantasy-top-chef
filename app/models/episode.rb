class Episode < ApplicationRecord
  belongs_to :season
  has_many :episode_chefs

  def quickfire_winners
    episode_chefs.select(&:qf_winner?).map(&:chef)
  end

  def quickfire_runners_up
    episode_chefs.select(&:qf_runner_up?).map(&:chef)
  end

  def elim_winners
    episode_chefs.select(&:elim_winner?).map(&:chef)
  end

  def elim_runners_up
    episode_chefs.select(&:elim_runner_up?).map(&:chef)
  end

  def eliminated_chefs
    episode_chefs.select(&:eliminated?).map(&:chef)
  end

  def elim_bottom_chefs
    episode_chefs.select(&:elim_bottom?).map(&:chef)
  end

  def lck_winner
    # TODO: check for usage and remove (deprecated)
    episode_chefs.detect(&:lck_winner?)&.chef
  end

  def lck_winners
    episode_chefs.select(&:lck_winner?)&.map(&:chef)
  end

  def sweep?
    elim_winners == quickfire_winners
  end

  def completed?
    episode_chefs.present?
  end
end
