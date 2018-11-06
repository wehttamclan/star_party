require "rails_helper"

feature "As an authenticated user" do
  scenario "I can view ten day forecast with valid zip code" do
    VCR.use_cassette("visit forecast path as user") do
      visit forecast_path(zip_code: "80203")
    end

    expect(page).to have_css('.time')
    expect(page).to have_css('.weather-card', count: 8)

    within(first('.weather-card')) do
      expect(page).to have_css('.cloud-cover')
      expect(page).to have_css('.moon-phase')
      expect(page).to have_css('.rain-chance')
      expect(page).to have_css('.moon-name')
    end
    expect(page).to have_css('.select')
  end

  scenario "invalid zip prompts me to try again" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    VCR.use_cassette("home page") do
      visit '/'
    end

    invalid_zip = 87822
    fill_in :zip_code, with: invalid_zip
    VCR.use_cassette("click plan") do
      find(".plan-party", visible: false).click
    end

    expect(current_path).to eq('/')
    expect(page).to have_content("Sorry, no data for that zip code.")
  end
end
