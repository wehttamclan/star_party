require "rails_helper"

feature 'As a authenticated user' do
  context 'I can visit a party show' do
    scenario 'and click to attend the party' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      fun_party = create(:party)

      visit "/parties/#{fun_party.id}"

      expect(page).to have_content(fun_party.title)
      expect(page).to have_content("Date: #{fun_party.date}")
      expect(page).to have_content("Description: #{fun_party.description}")
      expect(page).to have_content("Hosted By: #{fun_party.host.name}")

      click_on("Attend")

      expect(current_path).to eq("/parties/#{fun_party.id}")
      expect(page).to_not have_content("Attend"), exact_text: true
      expect(page).to have_content("You are attending this party.")
      expect(page).to have_content("Cancel Attendance")
    end
  end
end
