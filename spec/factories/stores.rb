FactoryBot.define do
  factory :store do
    name    { Faker::Name.name }
    address { Faker::Name.name }
  end
end
