class Product < ActiveRecord::Base
  attr_accessible :name, :price, :quantity, :type, :path, :description, :images_attributes, :trend_ids, :category
# many to many relation with trends
  has_and_belongs_to_many :trends
# one to many mapping to images
  has_many :images
# one to many mapping to line items
  has_many :line_items
# property added to control insert for the related models
  accepts_nested_attributes_for :images, :trends

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :name, :description, :price, :quantity, :category, presence: true

  validates :category, :inclusion => { :in => %w{suit saree kurti}, :message => "%{value} is not a valid category" }

  def self.categories
    ["suit", "saree", "kurti"]
  end

  private
    # ensure here that if destroy is called on the product then we should ensure that the product
    # is not been references in any line item
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end
