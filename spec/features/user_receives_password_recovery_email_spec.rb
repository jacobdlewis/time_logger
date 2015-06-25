feature "User creates a time entry" do

  before do
    visit "/"
    click_on "Sign In"
    user = Fabricate(:user, name: "Smitty", email: "smitty@example.org")
    fill_in "Email", with: user.email
    fill_in "Password", with: "password1"
    click_button "Sign In"
    page.should have_content("Welcome back, Smitty")
    page.should_not have_content("Sign In")
    page.should_not have_content("Sign Up")
    page.should have_content("Sign Out")
  end

  scenario "user should receive email about password recovery" do
    click_on "Sign Out"
    page.should have_content("You have been signed out.")
    page.should have_content("Sign In")
    click_on "Sign In"
    page.should have_content("Forgot your password?")
    fill_in "email", with: "smitty@example.org"
    click_on "Send password reset email"
    open_last_email
    current_email == "smitty@example.org"
    current_email.should have_subject("Password reset email")
    current_email.should have_body_text("smitty@example.org,\n\nYou requested to reset your password. To choose a new password, just follow this link:")
    link = links_in_email(current_email).first
    visit request_uri(link)
    fill_in "Password", with: "password123"
    fill_in "Password confirmation", with: "password123"
    click_on "Update User"
    page.should have_content "Password was successfully updated"
    current_path.should == root_path
  end

end