class EpisodesController < ApplicationController
  before_action :check_season!
  before_action :check_episode!, only: %i[edit update]

  def new; end

  def create
    @episode = Episode.new(episode_params)
    if @episode.save
      redirect_to home_path
    else
      flash[:banner_error] = "Failed to create episode: #{@episode.errors.full_messages}"
      redirect_to home_path
    end
  end

  def edit
  end

  def update
    update_episode_scoring!

    redirect_to edit_season_episode_path(season.season_number, episode.week)
  end

  private

  def season
    @season ||= Season.find_by(season_number: params[:season_id])
  end

  def episode
    @episode ||= Episode.find_by(season_id: season.id, week: params[:id])
  end

  def check_season!
    return if season

    flash[:banner_error] = "Season #{params[:season_id]} could not be found."
    redirect_to home_path
  end

  def check_episode!
    return if episode

    flash[:banner_error] = "Could not find Episode #{params[:id]} for Season #{params[:season_id]}."
    redirect_to home_path
  end

  def update_episode_scoring!
    episode.episode_chefs.present? ? reset_episode_chefs! : create_episode_chefs!
    %i[qf_winner qf_fav elim_winner elim_fav elim_bottom lck_winner champ lck_champ eliminated finale survival].each do |key|
      params[key] = (params[key].is_a?(Array) ? params[key].map(&:to_i) : params[key].to_i)
    end
    episode.reload
    episode.episode_chefs.select { |ec| params[:qf_winner].include?(ec.chef_id) }&.each { |ec| ec.update_attributes(qf_win: true) } if params[:qf_winner].is_a?(Array)
    episode.episode_chefs.select { |ec| params[:qf_fav].include?(ec.chef_id) }&.each { |ec| ec.update_attributes(qf_fav: true) } if params[:qf_fav].is_a?(Array)
    episode.episode_chefs.select { |ec| params[:elim_winner].include?(ec.chef_id) }&.each { |ec| ec.update_attributes(elim_win: true) } if params[:elim_winner].is_a?(Array)
    episode.episode_chefs.select { |ec| params[:elim_fav].include?(ec.chef_id) }&.each { |ec| ec.update_attributes(elim_top: true) } if params[:elim_fav].is_a?(Array)
    episode.episode_chefs.select { |ec| params[:elim_bottom].include?(ec.chef_id) }&.each { |ec| ec.update_attributes(elim_bottom: true) } if params[:elim_bottom].is_a?(Array)
    episode.episode_chefs.select { |ec| params[:lck_winner].include?(ec.chef_id) }&.each { |ec| ec.update_attributes(lck_win: true) } if params[:lck_winner].is_a?(Array)
    episode.episode_chefs.select { |ec| params[:finale]&.include?(ec.chef_id) }&.each { |ec| ec.update_attributes(finale: true) } if params[:finale].is_a?(Array)
    episode.episode_chefs.detect { |ec| ec.chef_id == params[:champ] }&.update_attributes(champ: true)
    episode.episode_chefs.detect { |ec| ec.chef_id == params[:lck_champ] }&.update_attributes(lck_champ: true)
    episode.episode_chefs.select { |ec| params[:eliminated].include?(ec.chef_id) }&.each { |ec| ec.update_attributes(eliminated: true) } if params[:eliminated].is_a?(Array)

    update_total_points!
    send_notification_email!
  end

  def reset_episode_chefs!
    EpisodeChef
      .where(id: episode.episode_chefs.map(&:id))
      .update_all(
        qf_win: false, qf_fav: false, elim_win: false, elim_top: false, elim_bottom: false, lck_win: false,
        finale: false, champ: false, lck_champ: false, eliminated: false
      )
  end

  def create_episode_chefs!
    episode.season.chefs.each do |chef|
      EpisodeChef.create!(chef: chef, episode: episode)
    end
  end

  def update_total_points!
    League.all.each do |league|
      league.league_users.each(&:recalculate_total_points!)
    end
  end

  def send_notification_email!
    # TODO: implement
  end

  def episode_params
    params.permit(:name, :air_date, :week).merge(season_id: season.id)
  end
end
