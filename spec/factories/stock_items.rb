FactoryBot.define do
  factory :stock_item do
    store
    product
    quantity { Faker::Number.number(digits: 4) }
  end
end
