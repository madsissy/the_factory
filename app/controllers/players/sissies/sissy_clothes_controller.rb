class Players::Sissies::SissyClothesController < Players::Sissies::BaseController

  def create
    remove_worn_item
    unless no_item
      @sissy_clothe = SissyClothe.find(item_id)

      if item_wearable?
        @sissy_clothe.update(sissy: @sissy)
      else
        flash[:notice] = "#{@sissy.firstname} won't wear this."
      end
    end

    redirect_to player_sissy_path(@player, @sissy)
  end

  private
    def remove_worn_item
      case params[:sissy_clothe][:type]
      when 'outfit'
        @sissy.outfit.update(sissy_id: nil) if @sissy.outfit
      when 'headgear'
        @sissy.headgear.update(sissy_id: nil) if @sissy.headgear
      when 'shoes'
        @sissy.shoes.update(sissy_id: nil) if @sissy.shoes
      end
    end

    def item_wearable?
      (@sissy_clothe.clothe.will_needed >= @sissy.will) && (@sissy_clothe.clothe.feminity_needed <= @sissy.feminity) && (@sissy_clothe.clothe.sub_skill_needed <= @sissy.sub_skill)
    end

    def item_id
      params[:sissy_clothe][params[:sissy_clothe][:type].to_sym].to_i
    end

    def no_item
      item_id.zero?
    end

end
