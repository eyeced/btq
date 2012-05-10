class ProductItem < ActiveRecord::Base
  attr_accessible :product_id, :quantity, :size
  belongs_to :product
end
