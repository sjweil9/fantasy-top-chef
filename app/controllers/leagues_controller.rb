class LeaguesController < ApplicationController
  before_action :league

  def team_leaderboard
  end

  def chef_leaderboard
  end

  def weekly_breakdown
    @episode = Episode.find_by(season_id: league.season.id, week: week_num)
    @episode = nil unless @episode&.completed?
    flash[:banner_error] = "Results are not yet available for week #{week_num}." unless @episode
  end

  private

  def league
    @league ||= League.find_by(name: "Westhoochingdallas", season_id: Season.find_by(season_year: 2022).select(:id))
  end

  def week_num
    @week_num ||= params[:week] || current_week
  end

  def current_week
    league.season.episodes.includes(:episode_chefs).order(week: :desc).select(&:completed?).first.week.to_s
  end
end
