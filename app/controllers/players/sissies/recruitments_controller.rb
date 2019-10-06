class Players::Sissies::RecruitmentsController < Players::BaseController

  def new
    @sissy = Sissy.find(params[:sissy_id])

    @result = SissyService.new(@sissy, player: @player).recruit
  end
end
