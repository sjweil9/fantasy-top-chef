class HomepageController < ApplicationController
  def index
    redirect_to team_leaderboard_path
  end
end