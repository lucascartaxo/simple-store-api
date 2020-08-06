class StoreSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :name, :address, :created_at
end
