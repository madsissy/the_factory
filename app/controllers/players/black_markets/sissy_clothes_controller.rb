class Players::BlackMarkets::SissyClothesController < Players::BaseController

  def index
    @clothes      = Clothe.all
    @sissy_clothe = SissyClothe.new
  end

  def create
    @sissy_clothe = @player.sissy_clothes.new(sissy_clothe_params)
    clothe        = Clothe.find params[:sissy_clothe][:clothe_id]

    unless @player.enough_fund?(clothe.price)
      return redirect_to player_black_markets_sissy_clothes_path(@player), flash: { notice: "Not enough fund !"}
    end

    if @sissy_clothe.save!
      PlayerService.new(@player).handle_money(- clothe.price)
      redirect_to player_black_markets_sissy_clothes_path(@player), flash: { notice: "#{clothe.name} buyed"}
    else
      redirect_to player_black_markets_sissy_clothes_path(@player), flash: { notice: "An error has occured :O"}
    end
  end

  private

  def sissy_clothe_params
    params.require(:sissy_clothe).permit(:clothe_id)
  end
end
