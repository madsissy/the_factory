module Sissy::Create

  def create
    puts FIRST_NAMES.sample
    sissy = player.sissies.create(
      firstname:        FIRST_NAMES.sample,
      lastname:         LAST_NAMES.sample,
      birthdate:        set_birthdate,
      height:           rand(150..190),
      weight:           rand(50..120),
      hair_length:      rand(0..120),
      penis_size:       rand(0..30),
      feminity:         rand(0..100),
      will:             rand(0..100),
      oral_skill:       rand(0..100),
      anal_skill:       rand(0..100),
      sub_skill:        rand(0..100),
      hair_color:       Sissy.hair_colors.values.sample,
      eyes_color:       Sissy.eyes_colors.values.sample,
      skin_color:       Sissy.skin_colors.values.sample,
      testicles_size:   Sissy.testicles_sizes.values.sample,
      breasts_size:     Sissy.breasts_sizes.values.sample,
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
end
