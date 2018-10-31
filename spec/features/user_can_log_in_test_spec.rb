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
  describe "When I log in with google" do
    it "should take me to my dashboard" do
      def stub_omniauth
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
          info: { email: "hand@hand.com", name: "Ben"},
          :uid => "11"
        })
      end
      
      stub_omniauth

      VCR.use_cassette("visit login page") do
        visit("/login")
      end

      VCR.use_cassette("click login with google") do
        click_on("Login with Google")
      end

      expect(current_path).to eq("/dashboard")
    end
  end
end
