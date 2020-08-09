class Product < ApplicationRecord
  validates :name, :price_cents, presence: true

  has_many :stock_items, dependent: :delete_all

  def price
    Money.new(self.price_cents, self.price_currency)
  end
end
