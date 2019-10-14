FactoryBot.define do
  factory :house do
    level  { 1 }
    upkeep { 100 }

    association :player
  end
end
