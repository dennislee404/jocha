# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'

file = File.read(Rails.root.join('db','seeds','product.csv'))
rows = CSV.parse(file, headers: true, encoding: 'utf-8')
rows.each do |row|
	category = Category.find_or_create_by_name(name: row['Category'])
	product = category.products.find_or_create_by(name: row['Product'], price: row['Price'])
end

file = File.read(Rails.root.join('db','seeds','variant.csv'))
rows = CSV.parse(file, headers: true, encoding: 'utf-8')
rows.each do |row|
	variant = Variant.find_or_create_by_name(name: row['Variant'])
	variant_item = variant.variant_items.find_or_create_by(name: row['Variant Item'])
end
