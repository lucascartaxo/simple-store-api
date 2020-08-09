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
class ProductSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :name

  attributes :price do |object|
    Money.new(object.price_cents, object.price_currency)
  end
end
