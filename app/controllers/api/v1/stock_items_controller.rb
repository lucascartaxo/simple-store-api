class Api::V1::StockItemsController < ApplicationController

  before_action :set_stock_item, only: [:show, :update, :destroy]

  # GET /api/v1/stock_items
  def index
    @stock_items = StockItem.all
    render json: json_response(@stock_items), status: :ok
  end

  # POST /api/v1/stock_items
  def create
    @stock_item = StockItem.create!(stock_item_params)
    render json: json_response(@stock_item), status: :created
  end

  # GET /api/v1/stock_items/:id
  def show
    render json: json_response(@stock_item), status: :ok
  end

  # PUT /api/v1/stock_items/:id
  def update
    @stock_item.update(stock_item_params)
    head :no_content
  end

  # DELETE /api/v1/stock_items/:id
  def destroy
    @stock_item.destroy
    head :no_content
  end

  private

  def stock_item_params
    params.permit(:quantity, :store_id, :product_id)
  end

  def set_stock_item
    @stock_item = StockItem.find(params[:id])
  end

  def json_response(object)
    StockItemSerializer.new(object)
  end

end
