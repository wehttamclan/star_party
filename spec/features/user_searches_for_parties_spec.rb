require 'rails_helper'

describe 'visitor searches for parties' do
  context 'with a valid zip code' do
    it 'returns all parties' do
      create_list(:party, 5)

      visit '/'

      fill_in :q_find, with: 80203
      find(".find", visible: false).click

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

      today_party = Party.create(title: "Comet Party",
                date: Date.today,
                description: "View Halley's Comet",
                street_address: "100 Host Place",
                city: "Starville",
                state: "CO",
                zip_code: 80203,
                host_id: host.id)

      future_party = Party.create(title: "Nebula Party",
                date: "11-11-2018",
                description: "View Turing Nebula",
                street_address: "888 Galaxy Road",
                city: "Starville",
                state: "CO",
                zip_code: 80203,
                host_id: host.id)

      past_party = Party.create(title: "Meteor Party",
                date: "07-07-2017",
                description: "View Lovelace Meteor Shower",
                street_address: "42 Universe Way",
                city: "Douglastown",
                state: "CO",
                zip_code: 80203,
                host_id: host.id)

      visit '/'

      fill_in :q_find, with: 80203
      find(".find", visible: false).click

      expect(page).to have_css(".party-card", count: 2)

      expect(page).to have_content(today_party.title)
      expect(page).to have_content(today_party.description)

      expect(page).to have_content(future_party.title)
      expect(page).to have_content(future_party.description)

      expect(page).to_not have_content(past_party.title)
      expect(page).to_not have_content(past_party.description)
    end
  end

  context 'with zip code corresponding to zero parties' do
    it 'returns a message on index page' do
      create(:party, zip_code: 80000)

      visit '/'

      fill_in :q_find, with: 81111
      find(".find", visible: false).click

      expect(current_path).to eq("/")
      expect(page).to_not have_css(".party")
      expect(page).to have_content("No parties found in 81111. Try another search!")
    end
  end
end
