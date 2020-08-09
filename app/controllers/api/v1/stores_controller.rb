class  Api::V1::StoresController < Api::V1::BaseController
  before_action :set_store, only: [:show, :update, :destroy]

  # GET /api/v1/stores.json
  def index
    @stores = Store.all
    render json: json_response(@stores), status: :ok
  end

  # POST /api/v1/stores.json
  def create
    @store = Store.create!(store_params)
    render json: json_response(@store), status: :created
  end

  # GET /api/v1/stores.json/:id
  def show
    render json: json_response(@store), status: :ok
  end

  # PUT /api/v1/stores.json/:id
  def update
    @store.update(store_params)
    head :no_content
  end

  # DELETE /api/v1/stores.json/:id
  def destroy
    @store.destroy
    head :no_content
  end

  private
  def store_params
    params.permit(:name, :address)
  end

  def set_store
    @store = Store.find(params[:id])
  end
end
