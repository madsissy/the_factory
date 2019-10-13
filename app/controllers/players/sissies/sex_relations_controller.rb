class Players::Sissies::SexRelationsController < Players::Sissies::BaseController
  before_action :redirect_if_will_to_high

  def oral
  end

  def anal
  end

  def bdsm
  end

  private

  def redirect_if_will_to_high
    if @sissy.will >= Sissy::WILL_THRESHOLD
      redirect_to edit_player_sissy_path(@player, @sissy), flash: { notice: "#{@sissy.firstname} won't have sex with you. You need to break her will first." }
    end
  end
end
