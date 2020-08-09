class StockItemSerializer
include FastJsonapi::ObjectSerializer
  
  attributes :store, :product, :quantity
end
