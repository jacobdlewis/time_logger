Fabricator(:time_entry) do
  date   { Faker::Date.forward(1) }
  client_id             "12"
  category_id           "8"
  comment               { Faker::Lorem.sentence }
  area                  "01A"
  business_mileage      "20"
  personal_mileage      "10"
  hours_worked          "3"
end