class ProductSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :name

  attributes :price do |object|
    Money.new(object.price_cents, object.price_currency)
  end
end
