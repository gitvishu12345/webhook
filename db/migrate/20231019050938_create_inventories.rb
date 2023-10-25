class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.string :sku
      t.integer :quntity
      t.float :price

      t.timestamps
    end
  end
end
