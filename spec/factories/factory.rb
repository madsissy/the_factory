FactoryBot.define do
  factory :factory do
    level  { 1 }
    upkeep { 100 }

    association :player
  end
end
