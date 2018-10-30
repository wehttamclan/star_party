require "rails_helper"

feature 'As an guest user' do
  context 'I can visit a party show' do
    scenario 'and view party details' do
      fun_party = create(:party)

      visit "/parties/#{fun_party.id}"

      expect(page).to have_content(fun_party.title)
      expect(page).to have_content("Date: #{fun_party.date.strftime('%A, %b %d')}")
      expect(page).to have_content(fun_party.description)
      expect(page).to have_content("Please log in to view party details and to rsvp.")
      expect(page).to_not have_content("Hosted By: #{fun_party.host.name}")
      expect(page).to_not have_content("Attend")
    end
  end
end
