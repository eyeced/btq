class CreateProductItems < ActiveRecord::Migration
  def change
    create_table :product_items do |t|
      t.integer :product_id
      t.string :size
      t.integer :quantity, :default => 1

      t.timestamps
    end
  end
end
