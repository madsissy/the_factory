class Players::SissiesController < Players::BaseController
  before_action :set_sissy, only: [:edit, :update]

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

  def edit
    @form = build_form
  end

  def update
    @form = build_form
    @form.assign_attributes(sissy_params)

    if result = @form.save
      redirect_to edit_player_sissy_path(@player, @sissy), flash: { notice: result }
    else
      render :edit
    end
  end

  private

    def set_sissy
      @sissy = Sissy.find(params[:id])
    end

    def build_form
      EditSissyForm.build_from(@sissy)
    end

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

    def sissy_params
      params.require(:edit_sissy_form).permit(:firstname, :lastname, :surname, :job_name)
    end
end
