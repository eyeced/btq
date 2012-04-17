class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :type
      t.integer :quantity

      t.timestamps
    end
  end
end
