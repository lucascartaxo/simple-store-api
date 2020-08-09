puts "populating database with random data......\n"

100.times do
  name = Faker::Company.name
  address = Faker::Address.full_address

  Store.create!(
    name: name,
    address: address
  )

  puts "created company #{name}\n"
end

100.times do
  name = Faker::Commerce.product_name
  price_cents = Faker::Number.number(digits: 8)

  Product.create!(
    name: name,
    price_cents: price_cents
  )

  puts "created product #{name}\n"
end

Product.all.each do |product|
  store = Store.all.sample

  StockItem.create!(
    product: product,
    store: store,
    quantity: Faker::Number.number(digits: 4)
  )

  puts "created item for store #{store.name}\n"
end

puts "yay"