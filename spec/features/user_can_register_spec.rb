require "rails_helper"

describe "As a visitor" do
  describe "I can create and account" do
    it "should let me register and redirect me to the dashboard" do
      user_info = { name: "Bob Job",
                    email: "bob@bob.com",
                    phone_number: "123-456-7890",
                    zip_code: 80202,
                    username: "bobbo"
                  }

      visit "/"

      click_on("Log In / Sign Up")
      expect(current_path).to eq("/login")

      click_on("Register Here")
      expect(current_path).to eq("/users/new")

      fill_in "Name", with: user_info[:name]
      fill_in "Email", with: user_info[:email]
      fill_in "Phone Number", with: user_info[:phone_number]
      fill_in "Zip Code", with: user_info[:zip_code]
      fill_in "Password", with: "abc123"
      fill_in "Confirm Password", with: "abc123"

      click_on("Create User")

      expect(current_path).to eq("/dashboard")

      expect(page).to have_content("Welcome, #{user_info[:name]}")

      expect(page).to have_link("My Account")
      expect(page).to_not have_link("Log In / Sign Up")
    end
  end
end
