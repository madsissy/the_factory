class Players::Houses::SleepsController < Players::BaseController

  def create
    handle_player_sleep
    redirect_to player_day_recap_path(@player, @player.day_recap)
  end

  private

  def handle_player_sleep
    PlayerService.new(@player).handle_sleep
  end
end
