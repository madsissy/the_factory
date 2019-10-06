class PlayersController < ApplicationController
  before_action :authenticate_user!

  def index
    @players = current_user.players
  end

  def new
    @player = current_user.players.new
  end

  def create
    @player = current_user.players.new(players_params)
    set_start_values

    if @player.save
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

    def set_start_values
      @player.wallet_amount = 5000
      @player.current_date  = Date.new(2031, 6, 21)
      @player.energy        = 10
      @player.seduction     = 30
      @player.intimidation  = 30
    end
end
