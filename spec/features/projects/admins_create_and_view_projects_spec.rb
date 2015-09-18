feature "Admin creates and views projects" do

  before do
    visit "/"
    click_on "Sign In"
    admin = Fabricate(:user, name: "Boss", admin?: true)
    client = Fabricate(:client, first_name: "Sally", last_name: "Clienthammerstein")
    fill_in "Email", with: admin.email
    fill_in "Password", with: "password"
    click_button "Sign In"
    page.should have_content("Welcome back, Boss")
  end

  scenario "logged in admin creates and views a project" do
    page.should have_content("Sign Out")
    page.should have_content("Projects")
    click_link "Projects"
    page.should have_content("Active Projects")
    click_on "Create Project"
    page.should have_content("Create a project")
    fill_in "Enter the project's name", with: "Prescribed Burning - winter 2015"
    select("Clienthammerstein", :from => "Client")
    click_on "Create Project"
    page.should have_content("Prescribed Burning - winter 2015 was created successfully!")
    click_link "Clienthammerstein"
    page.should have_content("Projects for Sally")
  end

end