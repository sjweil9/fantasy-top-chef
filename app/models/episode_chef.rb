class EpisodeChef < ApplicationRecord
  belongs_to :episode
  belongs_to :chef

  before_create :set_defaults!

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
    elim_bottom && !eliminated
  end

  def eliminated?
    eliminated
  end

  def lck_winner?
    lck_win
  end

  def sweep
    elim_winner? && qf_winner?
  end

  def weekly_breakdown_color
    return "light-red-bg" if eliminated?
    return "light-yellow-bg" if sweep
    return "light-blue-bg" if qf_winner?

    "light-green-bg" if elim_winner?
  end

  private

  def set_defaults!
    %i[qf_win qf_fav elim_win elim_top elim_bottom lck_win lck_champ champ finale].each do |property|
      self.send("#{property}=", 0)
    end
  end
end
