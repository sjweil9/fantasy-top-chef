class LeaguesController < ApplicationController

  before_action :check_manager!, only: %i[edit update randomize_draft_order]

  def index
    @user_leagues = current_user.leagues
    @seasons = Season.all
  end

  def show
    @user_team = league.users.detect { |user| user.id == current_user.id }

    if league.private? && !current_user.is_member?(league)
      flash[:banner_error] = "Sorry, this league is private."
      redirect_to home_path
    end
  end

  def edit
    @draft_order = league.players_in_draft_order
  end

  def update
    if league.update(update_params)
      flash[:banner_success] = "Successfully updated league settings."
    else
      flash[:banner_error] = "Failed to update league settings."
      process_errors(league)
    end

    redirect_to edit_league_path(league.guid)
  end

  def join
    if current_user.is_member?(league)
      flash[:banner_success] = "You've already joined #{league.name}."
      redirect_to league_path(league.guid)
    elsif league.at_max_players?
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

  def draft
    @draft = league.draft
  end

  def randomize_draft_order
    random_order = league.league_users.shuffle.map(&:user_id)
    league.draft ||= Draft.create!(league: league)
    league.draft.update(pick_order: random_order, current_pick_user_id: random_order.first)

    redirect_to edit_league_path(league.guid)
  end

  private

  def league_params
    params.require(:league).permit(:name, :season_id, :password, :password_confirmation, :max_players)
  end

  def update_params
    params.require(:league).permit(:name, :password, :password_confirmation, :max_players)
  end

  def league
    @league ||= League.find_by(guid: params[:id])
  end

  def check_manager!
    unless current_user.is_manager?(league)
      flash[:banner_error] = "Only the League Manager can edit settings."
      redirect_to league_path(league.guid)
    end
  end
end
