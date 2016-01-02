Fabricator(:time_entry) do
  date   { Faker::Date.forward(1) }
  project_id            (1..4)
  activity_id           (1..4)
  comment               { Faker::Lorem.sentence }
  area                  "01A"
  business_mileage      "20"
  personal_mileage      "10"
  hours_worked          "3"
end