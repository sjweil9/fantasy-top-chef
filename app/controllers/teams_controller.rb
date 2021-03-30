class TeamsController < ApplicationController
  def show
    @team = league.league_users.find_by(user_id: current_user.id)
  end

  def create
    if @league.private? && !@league.authenticate(params[:password])
      flash[:banner_error] = "Sorry, that password was invalid. Please try again."
      return redirect_to join_league_path(@league.guid)
    elsif @league.at_max_players?
      flash[:banner_error] = "Sorry, that league is already full."
      return redirect_to home_path
    end

    @league_user = LeagueUser.new(league: @league, user: current_user, is_manager: false, team_name: params[:team_name])
    unless @league_user.save
      process_errors(@league_user)
      return redirect_to join_league_path(@league.guid)
    end

    redirect_to league_path(@league.guid)
  end

  private

  def league
    @league ||= League.find_by(guid: params[:league_id])
  end
end
