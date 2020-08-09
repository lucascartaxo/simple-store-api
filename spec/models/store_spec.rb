require 'spec_helper'

RSpec.describe Store, type: :model do
  context "when build model" do
    it "works" do
      expect(create(:store)).to be_valid
    end
  end

  context "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :address }
  end

  describe "stock_items" do
    it "delete all" do
      store = create(:store)
      create_list(:stock_item, 10, store: store)

      expect {
        store.destroy!
      }.to change {
        StockItem.all.count
      }.from(10).to(0)
    end
  end

end
