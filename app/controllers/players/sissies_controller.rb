class Players::SissiesController < Players::BaseController
  def new
    destroy_last_sissy if params[:new_search]

    if player_has_no_sissies || player_last_sissy_is_owned?
      @sissy = create_new_sissy params[:location]
    else
      @sissy = @player.sissies.last
    end
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

    def player_has_no_sissies
      @player.sissies.empty?
    end

    def player_last_sissy_is_owned?
      @player.sissies.last.owned
    end

    def destroy_last_sissy
      @player.sissies.last.destroy
    end
end
