# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "creating categories"
Category.destroy_all

books = Category.create(title: "book", description: "Books, Magazines etc.")[0]
electronics = Category.create(title: "electronics", description: "Computer, Cellphone, etc")[1]
clothing = Category.create(title: "clothing", description: "Shoes, Jackets, Belts, etc")[2]
jewelry = Category.create(title: "jewelry", description: "Rings, watches, necklaces, etc")[3]

owners = ["Jonathan Chu", "Pito Salas", "Yo Mama"]
colors = ["red", "brown", "green", "white", "tiny"]
clothingnames = ["shoes", "shirt", "pants", "hat"]
electronicsnames = ["computer", "phone", "tv", "other"]
jewelrynames = ["neckalce", "bracelet", "ring", "other"]
booksnames = ["Mobie Dick", "catcher in the rye", "other"]

adjective = ["Amazing", "The perfect", "A great"]


puts "creating sample items"
i = 0
15.times do 
	if i % 4 == 0
		title = colors.sample + " " + clothingnames.sample
		category = clothing
	elsif i % 4 == 1
		title = electronicsnames.sample
		category = electronics
	elsif i % 4 == 2
		title = jewelrynames.sample
		category = jewelry
	else
		title = booksnames.sample
		category = books
	end	
	i += 1
  	description = adjective.sample + " " + title
  	Item.create(title: title, description: description, owner: owners.sample, category: category)
end
