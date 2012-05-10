class Category < ActiveRecord::Base
  has_many :children, :class_name => "Category"
  belongs_to :parent, :class_name => "Category"
  attr_accessible :description, :name, :parent_id

  def self.parent_categories
    Category.where('parent_id is null')
  end

  def self.sub_categories
    Category.where("parent_id is not null")
  end

end
