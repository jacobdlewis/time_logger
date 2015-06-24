feature "User Signs Up" do

  background do
    visit root_path
    click_on "Sign Up"
  end

  scenario "Happy Path" do
    page.should_not have_link("Sign Up")
    fill_in "Name", with: "Joe"
    fill_in "Username", with: "example_user"
    fill_in "Email", with: "joe@example.com"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"
    fill_in "Username", with: "example_user"
    click_button "Sign Up"
    page.should have_content("Welcome, Joe")
    click_on "Sign Out"
    click_on "Sign In"
    fill_in "Email", with: "joe@example.com"
    fill_in "Password", with: "password1"
    click_button "Sign In"
    page.should have_content("Welcome back, Joe")
  end

  scenario "Error Path" do
    fill_in "Name", with: ""
    fill_in "Username", with: "example_user"
    fill_in "Email", with: "joeexample.com"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "food"
    click_on "Sign Up"
    page.should have_css(".flash-alert", text: "Please fix the errors below to continue.")
    page.should have_css(".user_name .error", text: "can't be blank")
    page.should have_css(".user_email .error", text: "must be an email address")
    page.should have_css(".user_password_confirmation .error", text: "doesn't match Password")

    fill_in "Name", with: "Sally"
    fill_in "Email", with: "joe@example.com"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"
    click_on "Sign Up"
    page.should have_content("Welcome, Sally")
  end
end