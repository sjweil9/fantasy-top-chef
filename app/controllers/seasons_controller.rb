class SeasonsController < ApplicationController
  before_action :check_admin!

  def show
    @season = Season.find_by(season_number: params[:id])
  end
end
