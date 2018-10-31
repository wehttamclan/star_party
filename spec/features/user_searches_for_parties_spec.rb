require 'rails_helper'

describe 'visitor searches for parties' do
  context 'with a valid zip code' do
    it 'returns all parties' do
      create_list(:party, 5)

      VCR.use_cassette("visit root") do
        visit '/'
      end

      fill_in :q_find, with: 80203
      VCR.use_cassette("click find to find") do
        find(".find", visible: false).click
      end

      expect(current_path).to eq("/party_search")
      expect(page).to have_css(".party-card", count: 5)

      within(first(".party-card")) do
        expect(page).to have_css(".title")
        expect(page).to have_css(".date")
        expect(page).to have_css(".description")
        expect(page).to have_css(".location")
      end
    end

    it 'does not return past parties' do
      host = create(:user)

      today_party = create(:party, title: "Today Party", date: Date.today)

      future_party = create(:party, title: "Future Party", date: "11-11-2018")

      past_party = create(:party, title: "Past Party", date: "07-07-2017")

      VCR.use_cassette("visit root") do
        visit '/'
      end

      fill_in :q_find, with: 80203
      VCR.use_cassette("find to not show past parties") do
        find(".find", visible: false).click
      end

      expect(page).to have_css(".party-card", count: 2)

      expect(page).to have_content(today_party.title)
      expect(page).to have_content(future_party.title)
      expect(page).to_not have_content(past_party.title)
    end
  end

  context 'with zip code corresponding to zero parties' do
    it 'returns a message on index page' do
      create(:party, zip_code: 80203)

      VCR.use_cassette("visit root") do
        visit '/'
      end

<<<<<<< HEAD
      fill_in :q_find, with: 14624
      find(".find", visible: false).click
=======
      fill_in :q_find, with: 81111
      VCR.use_cassette("click another other find") do
        find(".find", visible: false).click
      end
>>>>>>> 6fc3a4d83b3bacacd5d15ebb8e85ced550d7612a

      expect(current_path).to eq("/")
      expect(page).to_not have_css(".party")
      expect(page).to have_content("No parties found near 14624. Try another search!")
    end
  end
end
