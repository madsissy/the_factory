FactoryBot.define do
  factory :player do
    firstname       { "John" }
    lastname        { "Doe" }
    energy          { 10 }
    current_date    { Date.new(2031, 6, 21) }
    wallet_amount   { 5000 }
    gender          { 'male' }
    seduction       { 30 }
    intimidation    { 30 }

    association     :user

    factory :initialized_player, traits: [:with_day_recap, :with_house, :with_factory]

    trait :with_day_recap do association :day_recap end
    trait :with_house do association :house end
    trait :with_factory do association :factory end
  end
end
