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
  end
end
