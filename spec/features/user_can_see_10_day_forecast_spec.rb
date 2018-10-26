require "rails_helper"

feature "As an authenticated user" do
  scenario "I can view ten day forecast with valid zip code" do
    # work in authentication once that's built in
    # visit '/'
    
    # fill_in :zip_code, with: "80203"
    # expect(current_page).to eq('/forecast')
    visit forecast_path(zip_code: "80203") #delete this line once root page and button exist

    expect(page).to have_css('.time')
    expect(page).to have_css('.day', count: 8)

    within(first('.day')) do
      expect(page).to have_css('.cloud-cover')
      expect(page).to have_css('.moon-phase')
      expect(page).to have_css('.rain-chance')
      expect(page).to have_css('.rating')
    end
    expect(page).to have_css('.select')
  end
end
