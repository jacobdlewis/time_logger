feature "User creates and views categories" do

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

  scenario "logged in user creates, edits, and deletes a client" do
    page.should have_content("Sign Out")
    page.should have_content("Log Time")
    page.should have_content("Categories")
    page.should have_content("Clients")
    click_link "Clients"
    page.should have_content("Current client list:")
    page.should have_content("Add a client")
    click_link "Add a client"
    page.should have_content("Create a new client")
    fill_in "Enter the client's first name", with: "Suzie"
    fill_in "Enter the client's last name", with: "Brown"
    click_button "Save client"
    page.should have_content("Suzie Brown was added to your list of clients successfully!")
    page.should have_content("Current client list:")
    click_link "Update"
    page.should have_content("Update client")
    fill_in "Enter the client's last name", with: "Robinson"
    click_button "Save client"
    page.should have_content("Suzie Robinson was updated successfully!")
    click_link "Delete"
    page.should have_content("Suzie Robinson was removed from your client list successfully!")
  end

end