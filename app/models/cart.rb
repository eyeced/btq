class Cart < ActiveRecord::Base
  attr_accessible :user_id
  has_many :line_items

  def size
    size = 0
    line_items.each do |item|
      size = size + item.quantity
    end
    size
  end
end
