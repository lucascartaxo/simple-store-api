require "spec_helper"

RSpec.describe "Products", type: :request do
  let!(:products) { create_list(:product, 10) }
  let(:product_id) { products.first.id }

  describe "GET /api/v1/products" do
    before { get "/api/v1/products.json" }

    it "returns products" do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
      expect(json["data"].size).to eq(10)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/v1/products/:id" do
    before { get "/api/v1/products/#{product_id}.json" }

    context "when the record exists" do
      it "returns the product" do
        expect(json).not_to be_empty
        expect(json["data"]["id"]).to eq(product_id.to_s)
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the record does not exist" do
      let(:product_id) { 100 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Product/)
      end
    end
  end
  
  describe "POST /api/v1/products" do
    let(:valid_attributes) { { name: "cap", price_cents: "999" } }

    context "when the request is valid" do
      before { post "/api/v1/products.json", params: valid_attributes }

      it "creates a product" do
        expect(json["data"]["attributes"]["name"]).to eq("cap")
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when the request is invalid" do
      before { post "/api/v1/products.json", params: { foo: "bar" } }

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end

      it "returns a validation failure message" do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe "PUT /api/v1/products/:id" do
    let(:valid_attributes) { { name: "hat" } }

    context "when the record exists" do
      before { put "/api/v1/products/#{product_id}.json", params: valid_attributes }

      it "updates the record" do
        expect(response.body).to be_empty
      end

      it "returns status code 204" do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe "DELETE /api/v1/products/:id" do
    before { delete "/api/v1/products/#{product_id}.json" }

    it "returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end

  private

  def json
    JSON.parse(response.body)
  end
end
