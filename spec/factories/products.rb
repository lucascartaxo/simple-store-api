# == Schema Information
#
# Table name: products
#
#  id             :bigint           not null, primary key
#  name           :string           not null
#  price_cents    :bigint           default(0), not null
#  price_currency :string           default("BRL"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
FactoryBot.define do
  factory :product do
    name { Faker::Name.name }
    price_cents { Faker::Number.number(digits: 10) }
  end
end
