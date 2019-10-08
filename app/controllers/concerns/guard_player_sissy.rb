module GuardPlayerSissy
  extend ActiveSupport::Concern

  included do
    before_action :set_sissy_or_redirect
  end

  private

    def set_sissy_or_redirect
      unless params[:sissy] && set_sissy
        return redirect_to player_factories_path(@player), flash: { alert: 'Oops ! Can\'t find this sissy..' }
      end
    end

    def set_sissy
      @sissy = @player.sissies.where(id: params[:sissy])&.first
    end
end
