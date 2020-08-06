class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string "name", null: false
      t.integer "price_cents", limit: 8, default: 0,     null: false
      t.string  "price_currency", default: "BRL", null: false
      
      t.timestamps
    end
  end
end
