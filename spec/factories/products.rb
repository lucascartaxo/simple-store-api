FactoryBot.define do
  factory :product do
    name { Faker::Name.name }
    price_cents { Faker::Number.number(digits: 10) }
  end
end
