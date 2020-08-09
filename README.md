
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



=================================================================================


<!-- [![Image caption](/https://miro.medium.com/max/2628/1*YZ5M_FjF8QNdtPGn4eMEgA.png.jpg)](#) -->

[![Image caption](/https://miro.medium.com/max/2628/1*YZ5M_FjF8QNdtPGn4eMEgA.png.jpg)](#)

# PROJECT
[d]: #project
**[INSTALL][i] | [USAGE][u] | [API][a] | [AUTHOR][auth] | [CONTRIBUTE][cpl] | [LICENSE][cpl] | [SUPPORT][ps]**

```
```

```
```

## GETTING STARTED
[gt]: #getting-started 'Getting started guide'

```
ruby 2.7.1
Docker
```

### INSTALLATION
[i]: #installation 'Installation guide'

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
[a]: #api 'Module\'s API description'

* Cadastrar, alterar, excluir e pesquisar produto (apenas por ID)
* Cadastrar, alterar, excluir e pesquisar loja (apenas por ID)
* Criar estoque de um produto em uma loja (relacionar loja e produto e inserir uma quantidade  inicial de itens)
* Adicionar itens de um produto ao estoque
* Retirar itens de um produto do estoque

|FUNCIONALIDADE|cURL (exemplo) |
|----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| CADASTRAR LOJA | curl --header "Content-Type: application/json" --request POST --data '{"name":"store-001","address":"123 Oz"}' https://simple-store-rails-api.herokuapp.com/api/v1/stores.json |
| LISTAR LOJAS   | curl --header "Content-Type: application/json" --request GET https://simple-store-rails-api.herokuapp.com/api/v1/stores.json |
| EDITAR LOJA    | curl --header "Content-Type: application/json" --request PUT --data '{"name":"new-store-001"}' https://simple-store-rails-api.herokuapp.com/api/v1/stores/1.json |
| EXCLUIR LOJA   | curl --header "Content-Type: application/json" --request DELETE https://simple-store-rails-api.herokuapp.com/api/v1/stores/1.json |
|<br/>|<br/>|
| CADASTRAR PRODUTO | curl --header "Content-Type: application/json" --request POST --data '{"name":"product-001","price_cents":"999"}' https://simple-store-rails-api.herokuapp.com/api/v1/products.json |
| LISTAR PRODUTOS   | curl --header "Content-Type: application/json" --request GET https://simple-store-rails-api.herokuapp.com/api/v1/products.json |
| EDITAR PRODUTO    | curl --header "Content-Type: application/json" --request PUT --data '{"name":"new-store-001"}' https://simple-store-rails-api.herokuapp.com/api/v1/products/1.json |
| EXCLUIR PRODUTO   | curl --header "Content-Type: application/json" --request DELETE https://simple-store-rails-api.herokuapp.com/api/v1/products/1.json |
|<br/>|<br/>|
| CADASTRAR ITEM | curl --header "Content-Type: application/json" --request POST --data '{"store_id":"1","product_id": "1", quantity":"999"}' https://simple-store-rails-api.herokuapp.com/api/v1/stock_items.json |
| LISTAR ITEM   | curl --header "Content-Type: application/json" --request GET https://simple-store-rails-api.herokuapp.com/api/v1/stock_items.json |
| EDITAR ITEM    | curl --header "Content-Type: application/json" --request PUT --data '{"quantity":"1"}' https://simple-store-rails-api.herokuapp.com/api/v1/stock_items/1.json |
| EXCLUIR ITEM   | curl --header "Content-Type: application/json" --request DELETE https://simple-store-rails-api.herokuapp.com/api/v1/stock_items/1.json |
|<br/>|<br/>|

## PRODUCTION STATUS & SUPPORT
[ps]: #production-status--support 'Production use disclaimer & support info'

This project is hosted via Heroku, and it is available on this link:

http://simple-store-rails-api.herokuapp.com

<hr>

Go back to the **[project description][d]**