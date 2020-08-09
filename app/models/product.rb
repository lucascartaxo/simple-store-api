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
class Product < ApplicationRecord
  validates :name, :price_cents, presence: true

  has_many :stock_items, dependent: :delete_all

  def price
    Money.new(self.price_cents, self.price_currency)
  end
end
