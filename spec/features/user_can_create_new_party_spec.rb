require 'rails_helper'

feature 'As a user' do
  scenario 'fills out new party form' do
    visit forecast_path(zip_code: '80203')

    within(first('.day')) do
      click_on 'Choose this Day!'
    end

    expect(current_path).to eq '/parties/new'

    expect(page).to have_content('80203')
    expect(page).to have_content('2018')

    # fill_in :title, with: 'This is my party.'
    # fill_in :description, with: 'Party under the stars.'
    # fill_in :street_address, with: 'This is my party.'
    # fill_in :city, with: 'This is my party.'
    # fill_in :state, with: 'This is my party.'

  end
end
