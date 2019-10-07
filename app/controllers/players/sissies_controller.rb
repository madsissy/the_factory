class Players::SissiesController < Players::BaseController

  def new
    if params[:new_search]
      destroy_last_sissy
      PlayerService.new(@player).handle_energy(-1)
    end

    if player_has_no_sissies || player_last_sissy_is_owned?
      @sissy = create_new_sissy params[:location]
    else
      @sissy = @player.sissies.last
    end
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
