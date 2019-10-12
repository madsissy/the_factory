class Players::Factories::DungeonsController < Players::BaseController
  include GuardPlayerSissy
  before_action :consume_player_energy, only: [:bondage]

  def show
  end

  def bondage
    handle_sissy_will
  end

  private

    def consume_player_energy
      # Needs not to be called on page refresh
      unless PlayerService.new(@player).handle_energy(-1)
        redirect_back(fallback_location: player_factories_path(@player), flash: { alert: 'You are too tired!' })
      end
    end

    def handle_sissy_will
      SissyService.new(@sissy).handle_will(-10)
    end
end
