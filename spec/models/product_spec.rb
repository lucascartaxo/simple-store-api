require 'spec_helper'

RSpec.describe Product, type: :model do
  let(:product){ create(:product, price_cents: 999123) }

  it "works" do
    expect(create(:product)).to be_valid
  end

  context "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :price_cents }
  end

  describe ".price" do
    it "proper user Money price" do
      expect(product.price).to eq(Money.new(999123, :BRL))
    end
  end

  describe "stock_items" do
    it "delete all" do
      product = create(:product)
      create_list(:stock_item, 10, product: product)

      expect {
        product.destroy!
      }.to change {
        StockItem.all.count
      }.from(10).to(0)
    end
  end
end