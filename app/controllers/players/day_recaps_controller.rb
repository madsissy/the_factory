class Players::DayRecapsController < Players::BaseController
  before_action :update_day_recap

  def show
    @day_recap = @player.day_recap
  end

  private

  def update_day_recap
    DayRecapService.new(@player.day_recap, player: @player).update
  end

end
