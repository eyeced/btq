class CreateProductTrendJoinTable < ActiveRecord::Migration
  def up
    create_table :products_trends, :id => false do |t|
      t.integer :product_id
      t.integer :trend_id
    end
  end

  def down
    drop_table :products_trends
  end
end
