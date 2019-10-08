class Players::Factories::DungeonsController < Players::BaseController

  def show
    @sissy = @player.sissies.find params[:sissy]
  end
end
