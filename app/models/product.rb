class Product < ApplicationRecord
  validates :name, :price_cents, presence: true

  def price
    Money.new(self.price_cents, self.price_currency)
  end
end
