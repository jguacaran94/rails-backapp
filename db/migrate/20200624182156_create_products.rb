class CreateProducts < ActiveRecord::Migration[6.0]
  def up
    create_table :products do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.integer :brand_id, null: false
      t.integer :quantity, null: false, default: 1
      t.float :price

      t.timestamps
    end
  end
  def down
    drop_table :products
  end
end
