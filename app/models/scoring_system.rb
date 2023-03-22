class ScoringSystem < ApplicationRecord
  has_many :league_scoring_systems
  has_many :leagues, through: :league_scoring_system

  ALL_CATEGORIES = %i[
    qf_win qf_fav elim_win elim_top elim_bottom lck_win lck_champ champ finale sweep survival
  ]

  def points_for(episode_chefs)
    ALL_CATEGORIES.reduce(0.0) do |sum, category|
      sum + episode_chefs.reduce(0.0) { |sub_sum, chef| sub_sum + (chef.send(category) ? send("#{category}_pts") : 0.0) }
    end
  end

  def season_points_for(chef, season: Season.last)
    @memoized_results ||= {}
    @memoized_results[chef.id.to_s] ||= points_for(chef.episode_chefs.for_season(season.id))
  end

  def episode_points_for(chef, episode)
    @memoized_results ||= {}
    @memoized_results[chef.id.to_s] ||= {}
    @memoized_results[chef.id.to_s][episode.to_s] = episode_points(chef, episode)
  end

  def episode_points(chef, episode)
    ec = Episode.find_by(season_id: Season.last.id, week: episode)&.episode_chefs&.select { |ec| ec.chef_id == chef.id  }
    return "-" unless ec.present?

    points_for(ec)
  end
end
