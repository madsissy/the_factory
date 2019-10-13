class Players::Sissies::BaseController < Players::BaseController
  before_action :set_sissy

  private

  def set_sissy
    @sissy = Sissy.find params[:sissy_id]
  end
end
