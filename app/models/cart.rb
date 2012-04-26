class Cart < ActiveRecord::Base
  attr_accessible :user_id
  has_many :line_items
end
