# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 User.create(name: 'Emanuel', email: "admin@gmail.com",password: "qazplm123",user_id: "admin")
 [ {title: "Hello world", description: "I am first item to sell", price: 12321}, {title: "Laptop", description: "I am second item", price: 6767},{ title: "Samsung", description: "Third item", price: 32}].each do |prod|
 	Product.create(prod)
 end