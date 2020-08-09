# SIMPLE-STORE-API

[![Image caption](https://miro.medium.com/max/2628/1*YZ5M_FjF8QNdtPGn4eMEgA.png)](#)

[![Coverage](https://github.com/lucascartaxo/simple-store-api/blob/master/badge.svg)](https://github.com/lucascartaxo/simple-store-api)

### INSTALLATION

Some prerequisites for this app
```
ruby 2.7.1
Docker
```

In order to have this app up and running, just
```sh
$ git clone git@github.com:lucascartaxo/simple-store-api.git
$ cd simple-store-api
```

and then

```sh
$ bundle install
$ rake db:create:all
$ rake db:migrate
```

don't forget to

```sh
$ docker-compose up -d
```
Run the specs with

```sh
$ rspec spec/
```

This app has a 100% code coverage, using Rspec, FactoryBot and ShouldaMatchers.

## API
This is the documentation regarding all the app routes
```
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
```

### CREATE STORE
```sh
$ curl --header "Content-Type: application/json" --request POST --data '{"name":"store-001","address":"123 Oz"}' https://simple-store-rails-api.herokuapp.com/api/v1/stores.json

# success
> 201 (created)

# failure
> 422 (unprocessable entity)
```

### GET STORE
```sh
$ curl --header "Content-Type: application/json" --request GET https://simple-store-rails-api.herokuapp.com/api/v1/stores/1.json

# success
> 200 (ok)

# failure
> 404 (not found)
```

### LIST STORES
```sh
$ curl --header "Content-Type: application/json" --request GET https://simple-store-rails-api.herokuapp.com/api/v1/stores.json

# success
> 200 (ok)
```

### EDIT STORES
```sh
$ curl --header "Content-Type: application/json" --request PUT --data '{"name":"new-store-001"}' https://simple-store-rails-api.herokuapp.com/api/v1/stores/1.json

# success
> 204 (no content)

# failure
> 404 (not found)
> 422 (unprocessable entity)
```

### DELETE STORE
```sh
$ curl --header "Content-Type: application/json" --request DELETE https://simple-store-rails-api.herokuapp.com/api/v1/stores/1.json

# success
> 204 (no content)

# failure
> 404 (not found)
```

<br/><hr/><br/>

### CREATE PRODUCT
```sh
$ curl --header "Content-Type: application/json" --request POST --data '{"name":"product-001","price_cents":"999"}' https://simple-store-rails-api.herokuapp.com/api/v1/products.json

# success
> 201 (created)

# failure
> 422 (unprocessable entity)
```

### GET PRODUCT
```sh
$ curl --header "Content-Type: application/json" --request GET https://simple-store-rails-api.herokuapp.com/api/v1/products/1.json

# success
> 200 (ok)

# failure
> 404 (not found)
```

### LIST PRODUCTS
```sh
$ curl --header "Content-Type: application/json" --request GET https://simple-store-rails-api.herokuapp.com/api/v1/products.json

# success
> 200 (ok)
```

### EDIT PRODUCTS
```sh
$ curl --header "Content-Type: application/json" --request PUT --data '{"name":"new-product-001"}' https://simple-store-rails-api.herokuapp.com/api/v1/products/1.json

# success
> 204 (no content)

# failure
> 404 (not found)
> 422 (unprocessable entity)
```

### DELETE PRODUCT
```sh
$ curl --header "Content-Type: application/json" --request DELETE https://simple-store-rails-api.herokuapp.com/api/v1/products/1.json

# success
> 204 (no content)

# failure
> 404 (not found)
```

<br/><hr/><br/>

### CREATE STOCK ITEM
```sh
$ curl --header "Content-Type: application/json" --request POST --data '{"store_id":"1","product_id": "1", quantity":"999"}' https://simple-store-rails-api.herokuapp.com/api/v1/stock_items.json

# success
> 201 (created)

# failure
> 422 (unprocessable entity)
```

### GET STOCK ITEM
```sh
$ curl --header "Content-Type: application/json" --request GET https://simple-store-rails-api.herokuapp.com/api/v1/stock_items/1.json

# success
> 200 (ok)

# failure
> 404 (not found)
```

### LIST STOCK ITEMS
```sh
$ curl --header "Content-Type: application/json" --request GET https://simple-store-rails-api.herokuapp.com/api/v1/stock_items.json

# success
> 200 (ok)
```

### EDIT STOCK ITEMS
```sh
$ curl --header "Content-Type: application/json" --request PUT --data '{"name":"new-product-001"}' https://simple-store-rails-api.herokuapp.com/api/v1/stock_items/1.json

# success
> 204 (no content)

# failure
> 404 (not found)
> 422 (unprocessable entity)
```

### DELETE STOCK ITEM
```sh
$ curl --header "Content-Type: application/json" --request DELETE https://simple-store-rails-api.herokuapp.com/api/v1/stock_items/1.json

# success
> 204 (no content)

# failure
> 404 (not found)
```

## PRODUCTION STATUS & SUPPORT
This project is hosted via Heroku, and it is available on this link:

http://simple-store-rails-api.herokuapp.com

<hr>