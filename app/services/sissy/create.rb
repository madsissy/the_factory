module Sissy::Create

  def create
    sissy = player.sissies.create(
      firstname: Faker::Name.first_name,
      lastname: Faker::Name.last_name,
      birthdate: Faker::Date.birthday(min_age: 18, max_age: 35)
    )

    sissy
  end
end
