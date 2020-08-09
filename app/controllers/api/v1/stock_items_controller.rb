class Api::V1::StockItemsController < Api::V1::BaseController

  before_action :set_stock_item, only: [:show, :update, :destroy]

  # GET /api/v1/stock_items.json
  def index
    @stock_items = StockItem.all
    render json: json_response(@stock_items), status: :ok
  end

  # POST /api/v1/stock_items.json
  def create
    @stock_item = StockItem.create!(stock_item_params)
    render json: json_response(@stock_item), status: :created
  end

  # GET /api/v1/stock_items.json/:id
  def show
    render json: json_response(@stock_item), status: :ok
  end

  # PUT /api/v1/stock_items.json/:id
  def update
    StockItem.transaction do
      @stock_item.update!(stock_item_params)
    end
    head :no_content
  end

  # DELETE /api/v1/stock_items.json/:id
  def destroy
    @stock_item.destroy!
    head :no_content
  end

  private

  def stock_item_params
    params.permit(:quantity, :store_id, :product_id)
  end

  def set_stock_item
    @stock_item = StockItem.find(params[:id])
  end
end
