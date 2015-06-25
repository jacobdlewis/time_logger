require 'spec_helper'

feature "User creates and views categories" do

  before do
    visit "/"
    click_on "Sign In"
    user = Fabricate(:user, name: "Smitty", admin?: true)
    fill_in "Email", with: user.email
    fill_in "Password", with: "password1"
    click_button "Sign In"
    page.should have_content("Welcome back, Smitty")
    page.should_not have_content("Sign In")
    page.should_not have_content("Sign Up")
    page.should have_content("Sign Out")
  end

  scenario "logged in user creates a new time entry" do
    page.should have_content("Sign Out")
    page.should have_content("Log Time")
    page.should have_content("Categories")
    click_link "Categories"
    page.should have_content("Current categories:")
    page.should have_content("Create new category")
    click_link "Create new category"
    page.should have_content("Create a new category")
    fill_in "Enter a category name", with: "Management plan"
    click_button "Save category"
    page.should have_content("Management plan was saved successfully.")
    page.should have_content("Current categories:")
    page.should have_content("Create new category")
    click_link "Create new category"
    page.should have_content("Create a new category")
    fill_in "Enter a category name", with: "Burning"
    click_button "Save category"
    page.should have_content("Burning")
    page.should have_content("Management plan")
    page.should have_content("Update")
    click_link "Update"
    page.should have_content("Update category")
    fill_in "Enter a new category name", with: "Run in place"
    click_button "Update category"
    page.should have_content("Run in place was updated successfully")
  end

end