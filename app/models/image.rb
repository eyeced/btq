class Image < ActiveRecord::Base
  belongs_to :product
  attr_accessible :path, :product_id
  mount_uploader :path, ImageUploader
end
