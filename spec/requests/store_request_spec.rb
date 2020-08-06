require 'spec_helper'

RSpec.describe "Stores", type: :request do
  let!(:store) { create(:store) }

  describe "GET #index" do
    it "retrieves a list of stores" do
      get api_v1_store_index_path
      expect(response.body).to match(StoreSerializer.new(Store.all).to_json)
    end
  end
end
