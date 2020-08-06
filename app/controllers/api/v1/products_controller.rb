class Api::V1::ProductsController < ApplicationController

  before_action :set_product, only: [:show, :update, :destroy]

  # GET /api/v1/products
  def index
    @products = Product.all
    render json: json_response(@products), status: :ok
  end

  # POST /api/v1/products
  def create
    @product = Product.create!(product_params)
    render json: json_response(@product), status: :created
  end

  # GET /api/v1/products/:id
  def show
    render json: json_response(@product), status: :ok
  end

  # PUT /api/v1/products/:id
  def update
    @product.update(product_params)
    head :no_content
  end

  # DELETE /api/v1/products/:id
  def destroy
    @product.destroy
    head :no_content
  end

  private

  def product_params
    params.permit(:name, :price_cents)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def json_response(object)
    ProductSerializer.new(object)
  end

end
