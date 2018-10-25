require 'rails_helper'

describe 'visitor searches for parties' do
  scenario 'with a valid zip code' do
    create_list(:party, 5)

    visit '/'

    fill_in :q_find, with: 80203
    find(".find", visible: false).click

    expect(current_path).to eq("/party_search")
    expect(page).to have_css(".party")

    within(first(".party")) do
      expect(page).to have_css(".title")
      expect(page).to have_css(".date")
      expect(page).to have_css(".description")
      expect(page).to have_css(".street_address")
      expect(page).to have_css(".city")
      expect(page).to have_css(".state")
      expect(page).to have_css(".zip_code")
    end
  end
end
