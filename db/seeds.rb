# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Order.destroy_all
Ticket.destroy_all
Event.destroy_all
Organizer.destroy_all
# User.destroy_all

users = []
organizers = []

# 5.times do
#   users << User.create!(
#     email: Faker::Internet.email,
#     password: "123456"
#   )
# end



organizers << Organizer.create!(
  organizer_name: "Operettenbühne Hombrechtikon",
  user: User.first
)
organizers << Organizer.create!(
  organizer_name: "Theater am Hechtplatz",
  user: User.first
)
organizers << Organizer.create!(
  organizer_name: "Zürcher Operenhaus",
  user: User.first
)
organizers << Organizer.create!(
  organizer_name: "Laienoper Hinterpfufikon",
  user: User.first
)



Event.create!(
  event_name: "Zigeunerbaron",
  event_category: "Opera/Operette",
  organizer: Organizer.first,
  photo: "image/upload/v1501697552/zigeunerbaron_nfluqu.jpg",
  event_address_title: "Gemeindehaus Hombrechtikon",
  event_address_street: "Feldbachstrasse 12",
  event_address_postalcode: 8634,
  event_address_city: "Hombrechtikon",
  event_description: "This is a very cool Opera. You have to see it. Oh yeah",
  event_time: DateTime.now,
  date: DateTime.now
)

Event.create!(
  event_name: "RoRock",
  event_category: "Concert",
  organizer: Organizer.first,
  photo: "",
  event_address_title: "Gemeindehaus Rothenburg",
  event_address_street: "Stationsstrasse 4",
  event_address_postalcode: 6023,
  event_address_city: "Rothenburg",
  event_description: "This is a french traditionl Opera. Dont miss it",
  event_time: DateTime.now ,
  date: DateTime.now + 10.days
)

Event.create!(
  event_name: "The Show must go Wrong",
  event_category: "Theater",
  organizer: Organizer.first,
  photo: "http://www.theaterhechtplatz.ch/media/filer_public_thumbnails/filer_public/16/07/16070fb8-dd89-4e18-8e0b-ff096ccfa80c/tsmgw_szenenfotos-14.jpg__800x450_q80_crop_subsampling-2_upscale.jpg",
  event_address_title: "Theater am Hechtplatz",
  event_address_street: "Hechtplatz",
  event_address_postalcode: 8001,
  event_address_city: "Zürich",
  event_description: "Very funny play - ha ha ha",
  event_time: DateTime.now ,
  date: DateTime.now + 2.days
)

Event.create!(
  event_name: "The visit",
  event_category: "Theater",
  organizer: Organizer.first,
  event_address_title: "Theater am Hechtplatz",
  event_address_street: "Hechtplatz",
  event_address_postalcode: 8001,
  event_address_city: "Zürich",
  event_description: "VSwiss classic play by Friedrich Dürrenmatt: Ill is an old man in his seventies who owns a shop in the town of Guellen. Like everyone else, he is very poor. Of all the people in Guellen, he was the closest to Claire Zachanassian, who was his lover when they were young. He got her pregnant and then bribed two men, Koby and Loby, to lie to a judge and say that they had slept with her and thereby avoided any responsibility for the child. Heartbroken, Claire left Guellen and became a prostitute. When she returns decades later, she still holds a bitter grudge against Ill and offers the impoverished town a million dollars if they kill him.",
  event_time: DateTime.now,
  date: DateTime.now
)

Ticket.create!(
  amount_tickets_to_sell: 30,
  amount_tickets_sold: 0,
  amount_tickets_spare: 30,
  price: 50,
  event: Event.all.sample,
  sku: "eis"
)


Ticket.create!(
  amount_tickets_to_sell: 20,
  amount_tickets_sold: 0,
  amount_tickets_spare: 20,
  price: 70,
  event: Event.all.sample,
  sku: "zwei"
)

Ticket.create!(
  amount_tickets_to_sell: 10,
  amount_tickets_sold: 0,
  amount_tickets_spare: 10,
  price: 15,
  event: Event.all.sample,
  sku: "drei"
)












