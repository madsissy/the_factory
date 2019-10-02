FactoryBot.define do
  factory :sissy do
    firstname       { "John" }
    lastname        { "Doe" }
    birthdate       { Time.now }

    association     :player
  end
end
