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
class StockItem < ApplicationRecord
  belongs_to :store
  belongs_to :product

  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
end
