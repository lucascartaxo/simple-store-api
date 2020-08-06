class CreateStockItems < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_items do |t|
      t.references :store,   foreign_key: true
      t.references :product, foreign_key: true

      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
