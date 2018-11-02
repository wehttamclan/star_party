require 'rails_helper'

feature 'As a user' do
  scenario 'fills out new party form' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    VCR.use_cassette("visit forecast path as user to create") do
      visit forecast_path(zip_code: '80033')
    end

    within(first('.weather-card')) do
      VCR.use_cassette("click select this day") do
        click_on 'Select this Day'
      end
    end

    expect(current_path).to eq '/parties/new'

    expect(find_field('party_zip_code').value).to eq('80033')
    # expect(page).to have_content(date)

    fill_in :party_title, with: 'This is my party.'
    fill_in :party_description, with: 'Party under the stars.'
    fill_in :party_street_address, with: '9357 W 26th Ave'
    fill_in :party_city, with: 'Wheat Ridge'
    select 11, from: :time_date_4i
    select 15, from: :time_date_5i
    select 'Colorado', from: 'party[state]'

    VCR.use_cassette("click create a star party", :allow_unused_http_interactions => false) do
      click_on 'Create a Star Party'
    end

    expect(current_path).to eq '/parties/1'
    expect(page).to have_content "11:15 AM"
    expect(Party.last.latitude).to_not be(nil)
    expect(Party.last.longitude).to_not be(nil)
  end
end
