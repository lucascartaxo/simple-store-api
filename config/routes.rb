Rails.application.routes.draw do
  namespace :api, constraints: lambda { |request| request.format == :json }do
    namespace :v1 do
      resources :stores
      resources :products
      resources :stock_items
    end
  end
end
