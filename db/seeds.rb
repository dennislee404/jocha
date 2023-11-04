# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'

file = File.read(Rails.root.join('db','seeds','variant.csv'))
rows = CSV.parse(file, headers: true, encoding: 'utf-8')
rows.each do |row|
	variant = Variant.find_or_create_by(name: row['Variant'])
	variant_item = variant.variant_items.find_or_create_by(name: row['Variant Item'])
end

file = File.read(Rails.root.join('db','seeds','option.csv'))
rows = CSV.parse(file, headers: true, encoding: 'utf-8')
rows.each do |row|
	option = Option.find_or_create_by(name: row['Option'], min: row['Min'], max: row['Max'], stackable: row['Stackable'])
	option_item = option.option_items.find_or_create_by(name: row['Option Item'], price: row['Price'])
end

file = File.read(Rails.root.join('db','seeds','product.csv'))
rows = CSV.parse(file, headers: true, encoding: 'utf-8')
rows.each do |row|
	category = Category.find_or_create_by(name: row['Category'])
	product = category.products.find_or_create_by(name: row['Product'], price: row['Price'])
end

file = File.read(Rails.root.join('db','seeds','product_variant.csv'))
rows = CSV.parse(file, headers: true, encoding: 'utf-8')
rows.each do |row|
	product = Product.find_by(name: row['Product'])
	product_variant = product.product_variants.find_or_create_by(variant_item_id: VariantItem.find_by(name: row['Variant Item']).id, price: row['Price'])
end

file = File.read(Rails.root.join('db','seeds','product_option.csv'))
rows = CSV.parse(file, headers: true, encoding: 'utf-8')
rows.each do |row|
	product = Product.find_by(name: row['Product'])
	product_option = product.product_options.find_or_create_by(option_id: Option.find_by(name: row['Option']).id)
end