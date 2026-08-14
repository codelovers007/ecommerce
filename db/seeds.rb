# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
categories_arr = ['Electronics', 'Fashion', 'Mobile', 'Kids', 'Furniture']

categories_arr.each do |data|
  Category.find_or_create_by!(name: data, description: "Sample #{data}")
end

category = Category.find_by(name: 'Electronics')

Product.find_or_create_by!(name: "Laptop", description: "Sample Laptop", sku_nu: 1, price: 50000, stock: 10, category: category)

Product.find_or_create_by!(name: "Speakers", description: "Sample Speakers", sku_nu: 2, price: 50000, stock: 10, category: category)

Product.find_or_create_by!(name: "Camera", description: "Sample Camera", sku_nu: 3, price: 50000, stock: 10, category: category)

category_mobile = Category.find_by(name: 'Mobile')

Product.find_or_create_by!(name: "Iphone 16 plus", description: "Sample iphone 16 plus", sku_nu: 4, price: 60000, stock: 5, category: category_mobile)

Product.find_or_create_by!(name: "Galaxy A37", description: "Sample Galaxy A37", sku_nu: 5, price: 35000, stock: 5, category: category_mobile)