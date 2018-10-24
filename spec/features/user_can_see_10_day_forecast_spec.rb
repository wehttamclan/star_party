require "rails_helper"

feature "As an authenticated user" do
  xscenario "I can view ten day forecast with valid zip code" do
    # work in authentication once that's built in
    # visit '/'
    #
    # fill_in :zip_code, with: "80203"
    # expect(current_page).to eq('/forecast')
    visit forecast_path(zip_code: "80203") #delete this line once root page and button exist

    expect(page).to have_css('.day', count: 10)

    within(first('.day')) do
      expect(page).to have_css('.date')
      expect(page).to have_css('.cloud_coverage')
      expect(page).to have_css('.moon_phase')
      expect(page).to have_css('.rain_chance')
      expect(page).to have_css('.rating')
    end
  end
end
