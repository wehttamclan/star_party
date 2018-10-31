require 'rails_helper'

describe "As a guest user" do
  describe "When I go to log in" do
    it "should take me to my dashboard" do
      user = create(:user)

      VCR.use_cassette("visit login page") do
        visit("/login")
      end

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password

      VCR.use_cassette("click login") do
        click_on("Login")
      end

      expect(current_path).to eq("/dashboard")
    end
  end
end
