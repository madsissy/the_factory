class Players::SissiesController < Players::BaseController
  def new
    @sissy = create_new_sissy
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

    def create_new_sissy
      SissyService.new(nil, player: @player).create
    end
end
