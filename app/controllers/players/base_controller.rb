class Players::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :set_player

  private
    def set_player
      @player ||= Player.find(params[:player_id])
    end
end
