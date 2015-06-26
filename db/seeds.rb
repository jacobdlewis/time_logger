# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#Users

Fabricate(:user, name: 'Jacob Lewis', email: "jacobdlewis@gmail.com", admin?: true)
5.times do
  name = Faker::Name.name
  user = Fabricate(:user, name: name, username: name)
end

#Categories
Fabricate(:category, name: "Appraisal")
Fabricate(:category, name: "Burning")
Fabricate(:category, name: "Timber sale")
Fabricate(:category, name: "Office")
Fabricate(:category, name: "Misc")
Fabricate(:category, name: "Cruising")

#Client
10.times do
  client = Fabricate(:client)
end


def time_rand from = (Time.now - 9000000), to = Time.now
  Time.at(from + rand * (to.to_f - from.to_f)).strftime('%Y/%m/%d')
end

#Time entries
500.times do
  Fabricate(:time_entry, date: time_rand(), user_id: rand(2..6), client_id: rand(1..10), category_id: rand(1..6))
end

