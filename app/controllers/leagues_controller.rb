class LeaguesController < ApplicationController
  before_action :league

  def index
  end

  def chef_leaderboard

  end

  def weekly_breakdown
    return redirect_to weekly_breakdown_path(week: "2") unless params[:week]

    @episode = Episode.find_by(season_id: league.season.id, week: week_number)
    flash[:banner_error] = "Results are not yet available for week #{week_number}." unless @episode
  end

  private

  def league
    @league ||= League.find_by(name: "Westhoochingdallas")
  end

  def week_number
    params[:week]
  end
end
