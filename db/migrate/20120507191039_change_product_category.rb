class ChangeProductCategory < ActiveRecord::Migration
  def up
    remove_column :products, :category
    add_column :products, :category_id, :integer
  end

  def down
  end
end
