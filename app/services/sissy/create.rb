module Sissy::Create

  def create location=nil
    sissy = player.sissies.create!(
      firstname:        FIRST_NAMES.sample,
      lastname:         LAST_NAMES.sample,
      birthdate:        set_birthdate,
      height:           rand(150..190),
      weight:           rand(50..120),
      hair_length:      rand(0..120),
      penis_size:       rand(1..30),
      feminity:         values_from_location(location)[:feminity],
      will:             values_from_location(location)[:will],
      oral_skill:       values_from_location(location)[:oral_skill],
      anal_skill:       values_from_location(location)[:anal_skill],
      sub_skill:        values_from_location(location)[:sub_skill],
      hair_color:       Sissy.hair_colors.values.sample,
      eyes_color:       Sissy.eyes_colors.values.sample,
      skin_color:       Sissy.skin_colors.values.sample,
      testicles_size:   Sissy.testicles_sizes.values.sample,
      breasts_size:     values_from_location(location)[:breasts_size],
      ass_size:         Sissy.ass_sizes.values.sample,
      lips_size:        Sissy.lips_sizes.values.sample,
    )
  end

  private

  def set_birthdate
    end_date  = player.current_date - 18.years
    init_date = Time.new((player.current_date - 35.years).year, 1, 1)
    Time.at(init_date + rand * (end_date.to_f - init_date.to_f))
  end

  def values_from_location location
    if location == 'streets'
      @values_from_location ||= {
        feminity:         rand(0..20),
        will:             rand(50..100),
        oral_skill:       rand(0..10),
        anal_skill:       rand(0..10),
        sub_skill:        rand(0..10),
        breasts_size:     Sissy.breasts_sizes[:no_breasts]
      }
    else
      @values_from_location ||= {
        feminity:         rand(0..100),
        will:             rand(0..100),
        oral_skill:       rand(0..100),
        anal_skill:       rand(0..100),
        sub_skill:        rand(0..100),
        breasts_size:     Sissy.breasts_sizes.values.sample
      }
    end
  end
end
