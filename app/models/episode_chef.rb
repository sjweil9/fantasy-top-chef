class EpisodeChef < ApplicationRecord
  belongs_to :episode
  belongs_to :chef

  before_create :set_defaults!

  def survival?
    !eliminated && not_previously_eliminated?
  end

  def survival
    !eliminated && not_previously_eliminated?
  end

  def not_previously_eliminated?
    chef.episode_chefs.where(episode: ec.episode.season.episodes.where("week < ?", ec.episode.week)).none?(&:eliminated?)
  end

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
    return "split-color-bg" if eliminated? && qf_winner?
    return "light-red-bg" if eliminated?
    return "light-yellow-bg" if sweep
    return "light-blue-bg" if qf_winner?

    "light-green-bg" if elim_winner?
  end

  CATEGORY_MAPPING = {
    qf_win: "QF Win",
    qf_fav: "QF Fav",
    elim_win: "Elim Win",
    elim_top: "Elim Top",
    elim_bottom: "Elim Bottom",
    lck_win: "LCK Win",
    sweep: "Sweep",
    lck_champ: "LCK Champion",
    finale: "Finale",
    champ: "Top Chef Champion",
    survival: "Survived"
  }

  def weekly_breakdown_text(league)
    %i[qf_win qf_fav elim_win elim_top elim_bottom lck_win sweep lck_champ finale champ survival].map do |category|
      points = send(category) ? league.scoring_system.send("#{category}_pts") : next
      sign = points.positive? ? "+" : ""
      category ? "#{CATEGORY_MAPPING[category]}: #{sign}#{points}" : nil
    end.compact
  end

  private

  def set_defaults!
    %i[qf_win qf_fav elim_win elim_top elim_bottom lck_win lck_champ champ finale].each do |property|
      self.send("#{property}=", 0)
    end
  end
end
