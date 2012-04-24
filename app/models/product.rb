class Product < ActiveRecord::Base
  attr_accessible :name, :price, :quantity, :type, :path, :description, :images_attributes, :trend_ids
  has_and_belongs_to_many :trends
  has_many :images
  accepts_nested_attributes_for :images, :trends
  accepts_nested_attributes_for :trends

  validates :name, :description, :price, :quantity, presence: true
end
