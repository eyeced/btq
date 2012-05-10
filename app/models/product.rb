class Product < ActiveRecord::Base
  attr_accessible :name, :price, :type, :path, :description, :images_attributes, :trend_ids, :category_id, :product_items_attributes
# many to many relation with trends
  has_and_belongs_to_many :trends
# one to many mapping to images
  has_many :images
# one to many mapping for product items which have the size and quantity
  has_many :product_items
# one to many mapping to line items
  has_many :line_items

  belongs_to :category
# property added to control insert for the related models
  accepts_nested_attributes_for :images, :allow_destroy => true
  accepts_nested_attributes_for :trends
  accepts_nested_attributes_for :product_items, :allow_destroy => true

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :name, :description, :price, :category_id, presence: true

  include PgSearch
  pg_search_scope :search, against: [:name, :description],
    using: {tsearch: {dictionary: "english"}},
    associated_against: {category: :name}

  def self.sizes
    ["small", "medium", "large"]
  end

# search on product
  def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end

  def quantity
    quantity = 0
    product_items.each do |item|
      quantity = quantity + item.quantity
    end
    quantity
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
