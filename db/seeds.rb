
#Fabricate(:user, username: 'admin', name: 'Administrator', email: "admin@gmail.com", admin?: true )
#Fabricate(:user, username: 'johndoe', name: 'John Doe', email: "johndoe@gmail.com", admin?: false )
#Fabricate(:user, username: 'janedoe', name: 'Jane Doe', email: "janedoe@gmail.com", admin?: false )

#Categories
Fabricate(:category, name: "Appraisal")
Fabricate(:category, name: "Burning")
Fabricate(:category, name: "Timber sale")
Fabricate(:category, name: "Office")
Fabricate(:category, name: "Misc")
Fabricate(:category, name: "Cruising")

Fabricate(:activity, name: "Cruising")
Fabricate(:activity, name: "Marking")
Fabricate(:activity, name: "Spraying")
Fabricate(:activity, name: "Recon")
Fabricate(:activity, name: "Misc")

# Fabricate(:client, first_name: "John", last_name: "Brown")
# Fabricate(:client, first_name: "William", last_name: "Morrison")
# Fabricate(:client, first_name: "Amy", last_name: "Gladstone")

# Fabricate(:project, handle: "Winter 2015", client_id: 3, category_id: 2)
# Fabricate(:project, handle: "Winter 2015", client_id: 1, category_id: 5)
# Fabricate(:project, handle: "Winter 2016", client_id: 2, category_id: 3)
# Fabricate(:project, handle: "Summer 2015", client_id: 1, category_id: 2)
# Fabricate(:project, handle: "Summer 2016", client_id: 3, category_id: 6)
# Fabricate(:project, handle: "Summer 2015", client_id: 1, category_id: 1)
# Fabricate(:project, handle: "Fall 2015", client_id: 1, category_id: 4)
# Fabricate(:project, handle: "Fall 2015", client_id: 3, category_id: 1)

# #now through one month ago
# def time_rand from = (Time.now - 2700000), to = Time.now
#   Time.at(from + rand * (to.to_f - from.to_f)).strftime('%Y/%m/%d')
# end

# #Time entries
# 800.times do
#   Fabricate(:time_entry, date: time_rand(), user_id: rand(1..3), project_id: rand(1..8), activity_id: rand(1..5))
# end

