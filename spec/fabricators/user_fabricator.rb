Fabricator(:user) do
  name                { Faker::Name.name }
  email          { Faker::Internet.email }
  username              {Faker::Name.name}
  password              "password"
  password_confirmation "password"
end