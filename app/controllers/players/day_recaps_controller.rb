class Players::DayRecapsController < Players::BaseController

  def update
    DayRecapService.new(@player.day_recap, player: @player).update
    redirect_to player_day_recap_path(@player, @player.day_recap)
  end

  def show
    @day_recap = @player.day_recap
  end

end
