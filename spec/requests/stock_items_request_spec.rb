require "spec_helper"

RSpec.describe "Stock Items", type: :request do
  let!(:stock_items) { create_list(:stock_item, 10) }
  let(:stock_item_id) { stock_items.first.id }

  describe "GET /api/v1/stock_items" do
    before { get "/api/v1/stock_items.json" }

    it "returns stock_items" do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
      expect(json["data"].size).to eq(10)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/v1/stock_items/:id" do
    before { get "/api/v1/stock_items/#{stock_item_id}.json" }

    context "when the record exists" do
      it "returns the stock_item" do
        expect(json).not_to be_empty
        expect(json["data"]["id"]).to eq(stock_item_id.to_s)
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the record does not exist" do
      let(:stock_item_id) { 100 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find StockItem/)
      end
    end
  end
  
  describe "POST /api/v1/stock_items" do
    let(:store)   { create(:store) }
    let(:product) { create(:product) }
    let(:valid_attributes) { { store_id: store.id, product_id: product.id, quantity: 10 } }

    context "when the request is valid" do
      before { post "/api/v1/stock_items.json", params: valid_attributes }

      it "creates a stock_item" do
        expect(json["data"]["attributes"]["quantity"]).to eq(10)
        expect(json["data"]["attributes"]["store"]).to eq(store.as_json)
        expect(json["data"]["attributes"]["product"]).to eq(product.as_json)
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when the request is invalid" do
      before { post "/api/v1/stock_items.json", params: { foo: "bar" } }

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end

      it "returns a validation failure message" do
        expect(response.body)
          .to match(/Validation failed: Store must exist, Product must exist, Quantity can't be blank/)
      end
    end
  end

  describe "PUT /api/v1/stock_items/:id" do
    let(:valid_attributes) { { name: "hat" } }

    context "when the record exists" do
      before { put "/api/v1/stock_items/#{stock_item_id}.json", params: valid_attributes }

      it "updates the record" do
        expect(response.body).to be_empty
      end

      it "returns status code 204" do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe "DELETE /api/v1/stock_items/:id" do
    before { delete "/api/v1/stock_items/#{stock_item_id}.json" }

    it "returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end

  private

  def json
    JSON.parse(response.body)
  end
end
