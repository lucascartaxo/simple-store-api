class Store < ApplicationRecord
  validates :name, :address, presence: true

  has_many :stock_items, dependent: :delete_all
end
