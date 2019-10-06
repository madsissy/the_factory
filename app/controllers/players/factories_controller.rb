class Players::FactoriesController < Players::BaseController
  def show
    @sissies = @player.sissies.in_factory
  end
end
