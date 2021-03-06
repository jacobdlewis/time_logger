require 'spec_helper'
feature "User views their time entries", js: true do

  before do
    visit "/"
    click_on "Sign In"
    Fabricate(:category).save
    Fabricate(:client, first_name: "Ronald", last_name: "Duck").save
    user = Fabricate(:user, name: "Smitty")
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Sign In"
    page.should have_content("Welcome back, Smitty")
    page.should_not have_content("Sign In")
    page.should_not have_content("Sign Up")
    page.should have_content("Sign Out")
  end

  scenario "logged in user creates a new time entry" do
    click_on "Log Time"
    page.should have_content("Sign Out")
    page.should have_content("Enter time")
    page.execute_script("$('#time_entry_date').datepicker('setDate', '#{Date.today.strftime("%Y-%m-%d")}')")
    select('Duck, Ronald', :from => 'time_entry_client_id')
    select('Business stuff', :from => 'time_entry_category_id')
    fill_in "Comment", with: "n/a"
    fill_in "Area", with: "02B"
    select("10", :from => "Business mileage")
    select("30", :from => "Personal mileage")
    select("8", :from => "Hours worked")
    click_on "Save Time Entry"
    page.should have_content("Your time for #{Date.today.strftime("%A, %B %d, %Y")} was saved successfully")
    click_on "Show Time"
    page.should have_content("Time Entries for Smitty")
    page.should have_content("#{Date.today.strftime("%A, %B %d, %Y")} - 8 hours")
    click_on "#{Date.today.strftime("%A, %B %d, %Y")} - 8 hours"
    page.should have_content("Time Entry for Smitty")
    page.should have_content("Category")
    page.should have_content("Bus. Mileage")
    page.should have_content("Back")
  end

end