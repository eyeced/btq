# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

#Category.delete_all
#categories = Category.create([{name: 'Suits'}, {name: 'Lehenga'}, {name: 'Kurti'}])

#suit_sub_category = %w{Casual Formal Lucknowi Party Office}.each {|suit_sub_cat| Category.create([{name: suit_sub_cat, parent_id: categories.first.id}])}
#lehenga_sub_category = %w{Bridal Party}.each {|lehenga_sub_cat| Category.create([{name: lehenga_sub_cat, parent_id: categories[1].id}])}
#kurti_sub_category = %w{Office Casual Lucknowi}.each {|kurti_sub_cat| Category.create([{name: kurti_sub_cat, parent_id: categories[2].id}])}

#Category.sub_categories.each do |cat|
#  for i in 1..20 do
#    product = Product.new
#    product.name = "Test product #{cat.name}-#{cat.parent.name}-#{i}"
#    product.description = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua"
#    product.category_id = cat.id
#    product.price = [1000, 1500, 2000, 2500, 3000, 3500].shuffle.first
#    product.created_at = rand(1.year).ago
#    product.save!
#
#    Product.sizes.each do |size|
#      quantity = (1..10).to_a.shuffle.first
#      ProductItem.create!(:size => size, :quantity => quantity, :product_id => product.id)
#    end
#
#    product_img1 = Image.create!(:product_id => product.id)
#    product_img1.path.store!(File.open(File.join(Rails.root, 'test1.jpg')))
#    product.images << product_img1
#    product_img2 = Image.create!(:product_id => product.id)
#    product_img2.path.store!(File.open(File.join(Rails.root, 'test2.jpg')))
#    product.images << product_img2
#    product_img3 = Image.create!(:product_id => product.id)
#    product_img3.path.store!(File.open(File.join(Rails.root, 'test3.jpg')))
#    product.images << product_img3
#    product.save!
#
#  end
#end

for i in 1..20 do
  trend = Trend.new
  trend.name = "Trend#{i}"
  trend.start = rand(2.month).ago
  trend.end = rand(2.month).since
  trend.description = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor"
  trend.save!
end

products = Product.all
trends = Trend.all
products.each do |product|
  product.trends << trends.shuffle.first
  product.trends << trends.shuffle.first
  product.save!
end

