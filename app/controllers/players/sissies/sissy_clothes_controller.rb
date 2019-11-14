class Players::Sissies::SissyClothesController < Players::Sissies::BaseController

  def update
    @sissy_clothe = SissyClothe.find_by(params[:sissy_clothe_id])

    if (sissy_clothe.clothe.will_needed >= @sissy.will) && (sissy_clothe.clothe.feminity_needed <= @sissy.feminity) && (sissy_clothe.clothe.sub_skill_needed <= @sissy.sub_skill)
      sissy_clothe.update(sissy: @sissy)
    else
      flash[:notice] = 'Sissy won\'t wear this'
      redirect_to player_sissy_path(@player, @sissy)
    end
  end

  private

end
