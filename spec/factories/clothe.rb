FactoryBot.define do
  factory :clothe do
    name               { 'Sneakers' }
    kind               { 'shoes'}
    modifier           { 30 }
    price              { 100 }

    trait :outfit   do kind { 'outfit'   } end
    trait :shoes    do kind { 'shoes'    } end
    trait :headgear do kind { 'headgear' } end
  end
end
