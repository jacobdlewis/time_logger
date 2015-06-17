require 'spec_helper'
feature "User creates a time entry", js: true do

  before do
    visit "/"
    click_on "Sign In"
    user = Fabricate(:user, name: "Smitty")
    fill_in "Email", with: user.email
    fill_in "Password", with: "password1"
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
    # within('.time_entry_date') do
    #   find('#time_entry_date_1i').click
    #   find('option', :text => 2015).click
    #   find('#time_entry_date_2i').click
    #   find('option', :text => "June").click
    #   find('#time_entry_date_3i').click
    #   find('option', :text => 15).click
    # end
    page.execute_script("$('#time_entry_date').datepicker('setDate', '#{Date.today.strftime("%Y-%m-%d")}')")
    fill_in "Client/tract name", with: 1
    fill_in "Select a work category", with: 2
    fill_in "Comment", with: "n/a"
    fill_in "Area", with: "02B"
    fill_in "Business mileage", with: 12
    fill_in "Personal mileage", with: 17
    fill_in "Hours worked", with: 5
    click_on "Save Time Entry"
    page.should have_content("Your time for #{Date.today.strftime("%A, %B %d, %Y")} was saved successfully")
  end

end