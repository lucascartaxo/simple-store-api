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
require 'spec_helper'

RSpec.describe StockItem, type: :model do
  context "when build model" do
    it "works" do
      expect(create(:stock_item)).to be_valid
    end
  end

  context "validations" do
    it { is_expected.to validate_presence_of :quantity }
    it { is_expected.to belong_to(:store) }
    it { is_expected.to belong_to(:product) }
  end

  describe "quantity" do
    it "is greater or equal than zero" do
      expect {
        create(:stock_item, quantity: -1)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

end
