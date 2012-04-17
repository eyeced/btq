class Product < ActiveRecord::Base
  attr_accessible :name, :price, :quantity, :type, :image
  mount_uploader :image, ImageUploader
end
