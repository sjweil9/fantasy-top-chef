class EpisodeChef < ApplicationRecord
  belongs_to :episode
  belongs_to :chef

  def qf_winner?
    qf_win
  end

  def qf_runner_up?
    qf_fav && !qf_win
  end

  def elim_winner?
    elim_win
  end

  def elim_runner_up?
    elim_top && !elim_win
  end

  def elim_bottom?
    elim_bottom
  end

  def lck_winner?
    lck_win
  end
end
