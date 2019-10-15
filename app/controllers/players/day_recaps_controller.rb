class Players::DayRecapsController < Players::BaseController
  before_action :update_day_recap

  def show
    # TODO: Handle negative wallet amount
    @day_recap = @player.day_recap
  end

  private

  def update_day_recap
    result = DayRecapService.new(@player.day_recap, player: @player).update

    unless result
      redirect_to player_houses_path(@player), flash: { alert: 'An error has occured :0'}
    end
  end

end
