# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "creating categories"
Category.destroy_all
Item.destroy_all

songs = Category.create(title: "song", description: "Music purchased somewhere. High quality")
electronics = Category.create(title: "electronics", description: "Computer, Cellphone, etc")
clothing = Category.create(title: "clothing", description: "Shoes, Jackets, Belts, etc")
jewelry = Category.create(title: "jewelry", description: "Rings, watches, necklaces, etc")

owners = ["Jonathan Chu", "Pito Salas", "Yo Mama"]
colors = ["red", "brown", "green", "white", "tiny"]
clothingnames = ["shoes", "shirt", "pants", "hat"]
electronicsnames = ["computer", "phone", "tv", "other"]
jewelrynames = ["neckalce", "bracelet", "ring", "other"]
songsnames = ["lost & found", "shining bright", "wrong platform", "sunday school", "samso"]

adjective = ["Amazing", "The perfect", "A great"]

puts "creating sample items"
i = 0
20.times do 
	puts i
	if i % 4 == 0
		title = colors.sample + " " + clothingnames.sample
		description = adjective.sample + " " + title
  	Item.create(title: title, description: description, owner: owners.sample, category_id: clothing.id)
	elsif i % 4 == 1
		title = electronicsnames.sample
		description = adjective.sample + " " + title
  	Item.create(title: title, description: description, owner: owners.sample, category_id: electronics.id)
	elsif i % 4 == 2
		title = jewelrynames.sample
		description = adjective.sample + " " + "Shiny " + title
  	Item.create(title: title, description: description, owner: owners.sample, category_id: jewelry.id)
	else
		title = songsnames.sample
		description =  adjective.sample + " " + title + " by  Pretty lights"
  	Item.create(title: title, description: description, owner: owners.sample, category_id: songs.id)
	end	
	i += 1
  	
end
