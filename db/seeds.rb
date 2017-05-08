# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Organizer.destroy_all
User.destroy_all

users = []
organizers = []

5.times do
  users << User.create!(
    email: Faker::Internet.email,
    password: "123456"
  )
end



organizers << Organizer.create!(
  organizer_name: "Operettenbühne Hombrechtikon",
  user: users.sample
)
organizers << Organizer.create!(
  organizer_name: "Theater am Hechtplatz",
  user: users.sample
)
organizers << Organizer.create!(
  organizer_name: "Zürcher Operenhaus",
  user: users.sample
)
organizers << Organizer.create!(
  organizer_name: "Laienoper Hinterpfufikon",
  user: users.sample
)



Event.create!(
  event_name: "Zigeunerbaron",
  event_category: "Opera/Operette",
  organizer: organizers.sample,
  url: "http://www.operette-hombrechtikon.ch/bilder/2017-der-zigeunerbaron.jpg",
  event_address_title: "Gemeindehaus Hombrechtikon",
  event_address_street: "Feldbachstrasse 12",
  event_address_postalcode: 8634,
  event_address_city: "Hombrechtikon"
)

Event.create!(
  event_name: "La Bohème",
  event_category: "Opera/Operette",
  organizer: organizers.sample,
  url: "https://www.metopera.org/metoperafiles/season/2016-17/operas/la_boh%C3%A8me/1380x591%20PDP%20hero/1380x591_boheme_top.jpg",
  event_address_title: "Zürcher Opernahuse",
  event_address_street: "Sechseläutenplatz",
  event_address_postalcode: 8001,
  event_address_city: "Zürich"
)

  Event.create!(
  event_name: "The Show must go Wrong",
  event_category: "Theater",
  organizer: organizers.sample,
  url: "http://www.theaterhechtplatz.ch/media/filer_public_thumbnails/filer_public/16/07/16070fb8-dd89-4e18-8e0b-ff096ccfa80c/tsmgw_szenenfotos-14.jpg__800x450_q80_crop_subsampling-2_upscale.jpg",
  event_address_title: "Theater am Hechtplatz",
  event_address_street: "Hechtplatz",
  event_address_postalcode: 8001,
  event_address_city: "Zürich"
)

