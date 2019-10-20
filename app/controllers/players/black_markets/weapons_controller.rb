class Players::BlackMarkets::WeaponsController < Players::BaseController

  def index
    @weapons = build_weapons
    @weapon  = Item.new
  end

  def create
    @weapon = @player.items.build(weapon_params)

    unless @player.enough_fund?(@weapon.price)
      return redirect_to player_black_markets_weapons_path(@player), flash: { notice: "Not enough fund !"}
    end

    if @weapon.save
      PlayerService.new(@player).handle_money(- @weapon.price)
      redirect_to player_black_markets_weapons_path(@player), flash: { notice: "#{@weapon.name} buyed"}
    else
      redirect_to player_black_markets_weapons_path(@player), flash: { notice: "An error has occured :O"}
    end
  end

  private

  def build_weapons
    [
      Item.new(kind: 'weapon', quantity: 1, name: 'Knife', modifier: 10, modified_attribute: 'intimidation', price: 100),
      Item.new(kind: 'weapon', quantity: 1, name: 'Taser', modifier: 30, modified_attribute: 'intimidation', price: 300),
      Item.new(kind: 'weapon', quantity: 1, name: 'Small gun', modifier: 50, modified_attribute: 'intimidation', price: 1000)
    ]
  end

  def weapon_params
    params.require(:item).permit(:kind, :name, :quantity, :price, :modifier, :modified_attribute)
  end
end
