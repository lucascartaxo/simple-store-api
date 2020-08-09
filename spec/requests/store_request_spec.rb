require 'spec_helper'

RSpec.describe "Stores", type: :request do
  let!(:stores) { create_list(:store, 10) }
  let(:store_id) { stores.first.id }

  describe "invalid format" do
    it "is not acceptable" do
      expect {
        get "/api/v1/stores"
      }.to raise_error(ActionController::RoutingError)

      expect {
        get "/api/v1/stores.html"
      }.to raise_error(ActionController::RoutingError)

      expect {
        get "/api/v1/stores.js"
      }.to raise_error(ActionController::RoutingError)

      expect {
        get "/api/v1/stores.json"
      }.not_to raise_error(ActionController::RoutingError)
    end
  end

  describe "GET /api/v1/stores" do
    before { get "/api/v1/stores.json" }

    it "returns stores" do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
      expect(json["data"].size).to eq(10)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/v1/stores/:id" do
    before { get "/api/v1/stores/#{store_id}.json" }

    context "when the record exists" do
      it "returns the store" do
        expect(json).not_to be_empty
        expect(json["data"]["id"]).to eq(store_id.to_s)
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the record does not exist" do
      let(:store_id) { 100 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Store/)
      end
    end
  end

  describe "POST /api/v1/stores" do
    let(:valid_attributes) { { name: "Illuminati Inc.", address: "Oz" } }

    context "when the request is valid" do
      before { post "/api/v1/stores.json", params: valid_attributes }

      it "creates a store" do
        expect(json["data"]["attributes"]["name"]).to eq("Illuminati Inc.")
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when the request is invalid" do
      before { post "/api/v1/stores.json", params: { foo: "bar" } }

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end

      it "returns a validation failure message" do
        expect(response.body)
        .to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe "PUT /api/v1/stores/:id" do
    let(:valid_attributes) { { name: "hat" } }

    context "when the record exists" do
      before { put "/api/v1/stores/#{store_id}.json", params: valid_attributes }

      it "updates the record" do
        expect(response.body).to be_empty
      end

      it "returns status code 204" do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe "DELETE /api/v1/stores/:id" do
    before { delete "/api/v1/stores/#{store_id}.json" }

    it "returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end

  private

  def json
    JSON.parse(response.body)
  end
end