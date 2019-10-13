FactoryBot.define do
  factory :job do
    name               { 'Job'        }
    will_needed        { 30           }
    sub_skill_needed   { 50           }

    trait :maid do name { 'Maid' } end

    trait :prostitute do name { 'Prostitute' } end
  end
end
