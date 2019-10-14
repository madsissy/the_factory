FactoryBot.define do
  factory :day_recap do
    recap_day { Time.now }
    earnings  { 100 }
    losses    { 100 }
    total     { 0 }

    association     :player
  end
end
