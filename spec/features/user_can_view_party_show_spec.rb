require "rails_helper"

feature 'As an authenticated user' do
  context 'I can visit a party show' do
    scenario 'and click to attend the party' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      fun_party = create(:party)

      VCR.use_cassette("visit ANOTHER party") do
        visit "/parties/#{fun_party.id}"
      end

      expect(page).to have_content(fun_party.title)
      expect(page).to have_content("Date: #{fun_party.date.strftime('%A, %b %d')}")
      expect(page).to have_content(fun_party.description)
      expect(page).to have_content("Hosted By: #{fun_party.host.name}")

      VCR.use_cassette("click attend") do
        click_on("Attend")
      end 

      expect(current_path).to eq("/parties/#{fun_party.id}")
      expect(page).to have_content("You are attending this party.")
      expect(page).to have_content("Cancel Attendance")
    end
  end
end
