require 'rails_helper'

feature 'As a user' do
  scenario 'fills out new party form' do
    visit forecast_path(zip_code: "80203")

    within(first('.day')) do
      click_on 'Choose this Day!'
    end

    expect(current_path).to eq '/parties/new'
  end
end
