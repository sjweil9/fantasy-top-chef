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

  def last_week_diff
    @last_week_diff ||= calculate_last_week_diff || 0.0
  end

  def calculate_last_week_diff
    league.scoring_system.points_for(episode_chefs.select { |ec| ec.episode.week == most_recent_episode_week })
  end

  def most_recent_episode_week
    @most_recent_episode_week ||= Episode.last.week
  end

  def last_week_diff_icon
    return if last_week_diff.zero?

    last_week_diff.positive? ? "upvote.png" : "downvote.png"
  end

  def last_week_diff_color
    return if last_week_diff.zero?

    last_week_diff.positive? ? "green" : "red"
  end
end
