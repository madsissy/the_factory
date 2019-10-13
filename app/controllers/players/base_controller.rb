class Players::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :set_player

  private
    def set_player
      @player ||= current_user.players.find_by_id(params[:player_id])
    end
end
