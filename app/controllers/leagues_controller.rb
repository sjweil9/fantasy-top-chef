class LeaguesController < ApplicationController
  def index
    @user_leagues = current_user.leagues
    @seasons = Season.all
  end

  def show
    @league = League.find_by(guid: params[:id])
  end

  def edit
    @league = League.find_by(guid: params[:id])
  end

  def create
    league = League.new(league_params)
    if league.save
      flash[:banner_success] = "Successfully created league"
      LeagueUser.create(league: league, user: current_user, is_manager: true)
    else
      process_errors(league)
      flash[:banner_error] = "Failed to create league"
    end

    redirect_to home_path
  end

  private

  def league_params
    params.require(:league).permit(:name, :season_id, :password, :password_confirmation, :max_players)
  end
end
