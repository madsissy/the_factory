FactoryBot.define do
  factory :item do
    name               { 'Taser' }
    kind               { 'weapon'}
    quantity           { 1 }
    modifier           { 10 }
    modified_attribute { 'intimidation' }
    price              { 100 }

    association     :player
  end
end
