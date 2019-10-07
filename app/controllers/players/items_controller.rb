class Players::ItemsController < Players::BaseController

  def index
    @weapons = @player.items.weapon
    @drugs   = @player.items.drug
  end
end
