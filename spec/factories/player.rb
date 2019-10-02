FactoryBot.define do
  factory :player do
    firstname       { "John" }
    lastname        { "Doe" }
    energy          { 10 }
    current_date    { Time.now }
    wallet_amount   { 5000 }
    gender          { 'male' }

    association     :user
  end
end
