FactoryBot.define do
  factory :sissy do
    firstname       { "John" }
    lastname        { "Doe" }
    birthdate       { Time.now }
    height          { rand(150..190) }
    weight          { rand(55..120) }
    hair_length     { rand(0..120) }
    hair_color      { Sissy.hair_colors[:blond_hair] }
    eyes_color      { Sissy.eyes_colors[:brown_eyes] }
    skin_color      { Sissy.skin_colors[:pale_skin] }
    penis_size      { rand(1..30) }
    testicles_size  { Sissy.testicles_sizes[:small_testicles] }
    breasts_size    { Sissy.breasts_sizes[:no_breasts] }
    ass_size        { Sissy.ass_sizes[:huge_ass] }
    lips_size       { Sissy.lips_sizes[:plump_lips] }
    attractiveness  { rand(0..100) }
    feminity        { rand(0..100) }
    will            { rand(0..100) }
    oral_skill      { rand(0..100) }
    anal_skill      { rand(0..100) }
    sub_skill       { rand(0..100) }

    association     :player

    trait :with_jobs do
      transient do jobs { [] } end
      after(:create) do |sissy, evaluator| sissy.jobs << evaluator.jobs end
    end
  end
end
