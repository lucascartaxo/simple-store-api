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
  
end
