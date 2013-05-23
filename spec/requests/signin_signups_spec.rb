require 'spec_helper'

describe "Sign in, Sign up" do
  describe "identity strategy" do
    it "sign in and sign out" do
      c = create(:client)
      visit "/auth/identity"
      fill_in "Email", :with => c.email
      fill_in "Password", :with => c.password
      click_button "Sign In"
      page.should have_content("Signed in!")
      page.should have_content("Welcome, #{c.name}!")
      
      page.should have_content("Sign Out")
      click_link "sign_out"
      page.should have_content("Signed out!")
    end
    
    it "sign up" do
      c = build(:client)
      visit "/auth/identity/register"
      fill_in "Email", :with => c.email
      fill_in "Name", :with => c.name
      fill_in "password", :with => c.password
      fill_in "password_confirmation", :with => c.password
      click_button "Register"
      page.should have_content("Welcome, #{c.name}!")
      c = Client.find_by_email(c.email)
      c.should_not be_nil
      c.name.should eql(c.name)
    end
    
  end
end
