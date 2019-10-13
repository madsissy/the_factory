class PlayersController < ApplicationController
  before_action :authenticate_user!

  def index
    @players = current_user.players
  end

  def new
    @player = current_user.players.new
  end

  def create
    @player = PlayerService.new(nil, user: current_user).init(players_params)

    if @player.persisted?
      redirect_to player_intro_path(@player)
    else
      render :new
    end
  end

  def destroy
    @player = Player.find params[:id]
    @player.destroy

    redirect_to players_path
  end

  private

    def players_params
      params.require(:player).permit(:firstname, :lastname, :title, :gender)
    end
end
