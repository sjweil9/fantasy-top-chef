class LeaguesController < ApplicationController
  def index
    @user_leagues = current_user.leagues
    @seasons = Season.all
  end

  def show
    @league = League.find_by(guid: params[:id])
    @user_team = @league.users.detect { |user| user.id == current_user.id }

    if @league.private? && !current_user.is_member?(@league)
      flash[:banner_error] = "Sorry, this league is private."
      redirect_to home_path
    end
  end

  def edit
    @league = League.find_by(guid: params[:id])

    unless current_user.is_manager?(@league)
      flash[:banner_error] = "Only the League Manager can edit settings."
      redirect_to league_path(@league.guid)
    end
  end

  def join
    @league = League.find_by(guid: params[:id])

    if current_user.is_member?(@league)
      flash[:banner_success] = "You've already joined #{@league.name}."
      redirect_to league_path(@league.guid)
    elsif @league.at_max_players?
      flash[:banner_error] = "Sorry, that league is already full."
      redirect_to home_path
    end
  end

  def create
    league = League.new(league_params)
    if league.save
      @league_user = LeagueUser.new(league: league, user: current_user, is_manager: true, team_name: "#{current_user.name}'s Team'")
      if @league_user.save
        flash[:banner_success] = "Successfully created league"
      else
        process_errors(@league_user)
        flash[:banner_error] = "Failed to create league"
      end
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
