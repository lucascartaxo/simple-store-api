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
  
end
