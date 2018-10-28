require 'rails_helper'

feature 'As a user' do
  scenario 'fills out new party form' do
    visit forecast_path(zip_code: '80203')

    within(first('.weather-card')) do
      click_on 'Select this Day'
    end

    expect(current_path).to eq '/parties/new'

    expect(find_field('party_zip_code').value).to eq('80203')
    # expect(page).to have_content(date)

    fill_in :party_title, with: 'This is my party.'
    fill_in :party_description, with: 'Party under the stars.'
    fill_in :party_street_address, with: '123 street, apartment 400'
    fill_in :party_city, with: 'Denver'
    select 'Colorado', from: :state

    click_on 'Create a Star Party'

    expect(current_path).to eq '/parties/1'
  end
end
