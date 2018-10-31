require 'rails_helper'

describe 'visitor searches for parties' do
  context 'with a valid zip code' do
    it 'returns all parties' do
      create_list(:party, 5)

      visit '/'

      fill_in :q_find, with: 80203
      find(".find", visible: false).click

      expect(current_path).to eq("/party_search")
      expect(page).to have_css(".party", count: 5)

      within(first(".party")) do
        expect(page).to have_css(".title")
        expect(page).to have_css(".date")
        expect(page).to have_css(".description")
        expect(page).to have_css(".location")
      end
    end

    it 'does not return past parties' do

      today_party = create(:party, title: "Today Party", date: Date.today)

      future_party = create(:party, title: "Future Party", date: "11-11-2018")

      past_party = create(:party, title: "Past Party", date: "07-07-2017")

      visit '/'

      fill_in :q_find, with: 80203
      find(".find", visible: false).click

      expect(page).to have_css(".party", count: 2)

      expect(page).to have_content(today_party.title)
      expect(page).to have_content(future_party.title)
      expect(page).to_not have_content(past_party.title)
    end
  end

  context 'with zip code corresponding to zero parties' do
    it 'returns a message on index page' do
      create(:party, zip_code: 80203)

      visit '/'

      fill_in :q_find, with: 14624
      find(".find", visible: false).click

      expect(current_path).to eq("/")
      expect(page).to_not have_css(".party")
      expect(page).to have_content("No parties found near 14624. Try another search!")
    end
  end
end
