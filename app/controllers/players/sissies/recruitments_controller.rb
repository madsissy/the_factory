class Players::Sissies::RecruitmentsController < Players::BaseController
  before_action :consume_player_energy

  def new
    @sissy = Sissy.find params[:sissy_id]

    @result = SissyService.new(@sissy, player: @player).recruit
  end

  private

  def consume_player_energy
    # Needs not to be called on page refresh
    unless @player.enough_energy? 2
      redirect_back(fallback_location: player_houses_path(@player), flash: { alert: 'You are too tired!' })
    end

    PlayerService.new(@player).handle_energy(-2)
  end
end
