FactoryBot.define do
  factory :item do
    factory :weapon do      
      name               { 'Taser' }
      kind               { 'weapon'}
      quantity           { 1 }
      modifier           { 30 }
      modified_attribute { 'intimidation' }
      price              { 100 }

      association     :player
    end
  end
end
