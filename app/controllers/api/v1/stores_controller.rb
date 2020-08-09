class  Api::V1::StoresController < Api::V1::BaseController
  before_action :load_stores
  
  def index
    render json: StoreSerializer.new(@stores), status: :ok
  end

  private
  def load_stores
    @stores = Store.all
  end
end
