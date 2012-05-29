class Trend < ActiveRecord::Base
  attr_accessible :end, :name, :start, :description
  has_and_belongs_to_many :products
  accepts_nested_attributes_for :products
end
