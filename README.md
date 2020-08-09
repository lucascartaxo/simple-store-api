[![Image caption](https://miro.medium.com/max/2628/1*YZ5M_FjF8QNdtPGn4eMEgA.png.jpg)](#)

# SIMPLE-STORE-API

## GETTING STARTED
```
ruby 2.7.1
Docker
```

### INSTALLATION
```sh
$ git clone git@github.com:lucascartaxo/simple-store-api.git
```

```sh
$ cd simple-store-api
```

```sh
$ bundle install
```

```sh
$ docker-compose up -d
```

```sh
$ rake db:create:all
$ rake db:migrate
```

```sh
$ rspec spec/
```

## API
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

<br/><br/>

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

<br/><br/>

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