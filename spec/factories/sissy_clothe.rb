FactoryBot.define do
  factory :sissy_clothe do
    association :player
    association :sissy
    association :clothe

    trait :outfit   do association :clothe, factory: [:clothe, :outfit] end
    trait :shoes    do association :clothe, factory: [:clothe, :shoes] end
    trait :headgear do association :clothe, factory: [:clothe, :headgear] end
  end
end
