class Players::SissiesController < Players::BaseController
  def new
    @sissy = create_new_sissy params[:location]
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def create_new_sissy location
      SissyService.new(nil, player: @player).create(location)
    end
end
