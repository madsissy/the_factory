module GuardPlayerSissy
  extend ActiveSupport::Concern

  included do
    before_action :set_sissy_or_redirect
  end

  private

    def set_sissy_or_redirect
      unless params[:sissy_id] && set_sissy
        redirect_to player_factories_path(@player), flash: { alert: 'Oops ! Can\'t find this sissy..' }
      end
    end

    def set_sissy
      @sissy = @player.sissies.find_by_id(params[:sissy_id])
    end
end
