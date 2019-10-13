class Players::Sissies::RecruitmentsController < Players::Sissies::BaseController
  before_action :consume_player_energy

  def new
    @result = SissyService.new(@sissy, player: @player).recruit
  end

  private

  def consume_player_energy
    # Needs not to be called on page refresh
    unless PlayerService.new(@player).handle_energy(-2)
      redirect_back(fallback_location: player_houses_path(@player), flash: { alert: 'You are too tired!' })
    end
  end
end
