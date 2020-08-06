require 'spec_helper'

RSpec.describe Product, type: :model do
  it "works" do
    expect(create(:product)).to be_valid
  end

  context "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :price_cents }
  end
end