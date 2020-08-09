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

## FUNCIONALIDADES
* Cadastrar, alterar, excluir e pesquisar produto (apenas por ID)
* Cadastrar, alterar, excluir e pesquisar loja (apenas por ID)
* Criar estoque de um produto em uma loja (relacionar loja e produto e inserir uma quantidade  inicial de itens)
* Adicionar itens de um produto ao estoque
* Retirar itens de um produto do estoque

| ACAO           | CURL                                                                                                                                                                           |
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