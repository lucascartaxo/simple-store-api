# == Schema Information
#
# Table name: stock_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint
#  store_id   :bigint
#
# Indexes
#
#  index_stock_items_on_product_id  (product_id)
#  index_stock_items_on_store_id    (store_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (store_id => stores.id)
#
FactoryBot.define do
  factory :stock_item do
    store
    product
    quantity { Faker::Number.number(digits: 4) }
  end
end
