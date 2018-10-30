require 'rails_helper'

feature 'As a user' do
  scenario 'fills out new party form' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    VCR.use_cassette("visit forecast path as user") do
      visit forecast_path(zip_code: '80203')
    end

    within(first('.weather-card')) do
      VCR.use_cassette("click select this day") do
        click_on 'Select this Day'
      end
    end

    expect(current_path).to eq '/parties/new'

    expect(find_field('party_zip_code').value).to eq('80203')
    # expect(page).to have_content(date)

    fill_in :party_title, with: 'This is my party.'
    fill_in :party_description, with: 'Party under the stars.'
    fill_in :party_street_address, with: '123 street, apartment 400'
    fill_in :party_city, with: 'Denver'
    select 'Colorado', from: :state

    VCR.use_cassette("click create a star party", :allow_unused_http_interactions => false) do
      click_on 'Create a Star Party'
    end

    expect(current_path).to eq '/parties/1'
  end
end
