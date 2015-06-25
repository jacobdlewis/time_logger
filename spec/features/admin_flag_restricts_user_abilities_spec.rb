feature "non-admin user is restricted from viewing clients & categories" do

  before do
    visit "/"
    click_on "Sign In"
    Fabricate(:category).save
    Fabricate(:client).save
    user = Fabricate(:user, name: "Smitty")
    fill_in "Email", with: user.email
    fill_in "Password", with: "password1"
    click_button "Sign In"
    page.should have_content("Welcome back, Smitty")
    page.should_not have_content("Sign In")
    page.should_not have_content("Sign Up")
    page.should have_content("Sign Out")
  end

  scenario "non-admin" do
    page.should have_content "Welcome to Time Logger"
    click_link "Log Time"
    page.should have_content "Enter time"
    click_link "Cancel"
    page.should have_content "Welcome to Time Logger"
    visit "/categories"
    page.should have_content "You are not authorized to access this page."
    visit '/clients'
    page.should have_content "You are not authorized to access this page."
  end

end