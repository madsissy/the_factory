module Sissy::Create

  def create
    sissy = player.sissies.create(
      firstname:        Faker::Name.first_name,
      lastname:         Faker::Name.last_name,
      birthdate:        Faker::Date.birthday(min_age: 18, max_age: 35),
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
      lips_size:        Sissy.ass_sizes.values.sample,
    )
  end
end
