class LeaguesController < ApplicationController
  before_action :league

  def index
  end

  def chef_leaderboard

  end

  def weekly_breakdown

  end

  private

  def league
    @league ||= League.find_by(name: "Westhoochingdallas")
  end
end
