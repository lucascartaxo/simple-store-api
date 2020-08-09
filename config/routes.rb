# == Route Map
#
#             Prefix Verb   URI Pattern                       Controller#Action
#      api_v1_stores GET    /api/v1/stores(.:format)          api/v1/stores#index
#                    POST   /api/v1/stores(.:format)          api/v1/stores#create
#       api_v1_store GET    /api/v1/stores/:id(.:format)      api/v1/stores#show
#                    PATCH  /api/v1/stores/:id(.:format)      api/v1/stores#update
#                    PUT    /api/v1/stores/:id(.:format)      api/v1/stores#update
#                    DELETE /api/v1/stores/:id(.:format)      api/v1/stores#destroy
#    api_v1_products GET    /api/v1/products(.:format)        api/v1/products#index
#                    POST   /api/v1/products(.:format)        api/v1/products#create
#     api_v1_product GET    /api/v1/products/:id(.:format)    api/v1/products#show
#                    PATCH  /api/v1/products/:id(.:format)    api/v1/products#update
#                    PUT    /api/v1/products/:id(.:format)    api/v1/products#update
#                    DELETE /api/v1/products/:id(.:format)    api/v1/products#destroy
# api_v1_stock_items GET    /api/v1/stock_items(.:format)     api/v1/stock_items#index
#                    POST   /api/v1/stock_items(.:format)     api/v1/stock_items#create
#  api_v1_stock_item GET    /api/v1/stock_items/:id(.:format) api/v1/stock_items#show
#                    PATCH  /api/v1/stock_items/:id(.:format) api/v1/stock_items#update
#                    PUT    /api/v1/stock_items/:id(.:format) api/v1/stock_items#update
#                    DELETE /api/v1/stock_items/:id(.:format) api/v1/stock_items#destroy

Rails.application.routes.draw do
  namespace :api, constraints: lambda { |request| request.format == :json }do
    namespace :v1 do
      resources :stores
      resources :products
      resources :stock_items
    end
  end
end
