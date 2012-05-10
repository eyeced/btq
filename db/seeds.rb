# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

categories = Category.create([{name: 'Suits'}, {name: 'Lehenga'}, {name: 'Kurti'}])

suit_sub_category = %w{Casual Formal Lucknowi Party Office}.each {|suit_sub_cat| Category.create([{name: suit_sub_cat, parent_id: categories.first.id}])}
lehenga_sub_category = %w{Bridal Party}.each {|lehenga_sub_cat| Category.create([{name: lehenga_sub_cat, parent_id: categories[1].id}])}
kurti_sub_category = %w{Office Casual Lucknowi}.each {|kurti_sub_cat| Category.create([{name: kurti_sub_cat, parent_id: categories[2].id}])}
