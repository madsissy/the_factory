module SissiesHelper

  def height_in_words sissy
    case
    when sissy.height.between?(150, 165) then 'small'
    when sissy.height.between?(166, 180) then 'average'
    when sissy.height.between?(181, 190) then 'tall'
    end
  end

  def weight_in_words sissy
    case
    when sissy.weight.between?(50, 75)  then 'thin'
    when sissy.weight.between?(76, 95)  then 'average'
    when sissy.weight.between?(96, 120) then 'fat'
    end
  end

  def hair_length_in_words sissy
    case
    when sissy.hair_length.zero?              then 'shaved'
    when sissy.hair_length.between?(1, 10)    then 'very short'
    when sissy.hair_length.between?(11, 30)   then 'short'
    when sissy.hair_length.between?(31, 50)   then 'shoulder length'
    when sissy.hair_length.between?(61, 90)   then 'long'
    when sissy.hair_length.between?(91, 120)  then 'very long'
    end
  end

  def penis_size_in_words sissy
    case
    when sissy.penis_size.between?(1, 4)     then 'micro'
    when sissy.penis_size.between?(5, 9)     then 'tiny'
    when sissy.penis_size.between?(10, 12)   then 'small'
    when sissy.penis_size.between?(13, 18)   then 'average'
    when sissy.penis_size.between?(19, 23)   then 'big'
    when sissy.penis_size.between?(24, 30)   then 'huge'
    end
  end

  def attractiveness_in_words sissy
    case
    when sissy.attractiveness.between?(0, 25)   then 'ugly'
    when sissy.attractiveness.between?(26, 50)  then 'quite ugly'
    when sissy.attractiveness.between?(51, 75)  then 'quite attractive'
    when sissy.attractiveness.between?(76, 100) then 'attractive'
    end
  end

  def eyes_colors_in_words eyes_color
    eyes_color.delete_suffix('_eyes')
  end

  def hair_color_in_words hair_color
    hair_color.delete_suffix('_hair')
  end
end
