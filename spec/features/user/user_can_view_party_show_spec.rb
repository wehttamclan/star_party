require "rails_helper"

feature 'As an authenticated user' do
  context 'I can visit a party show' do
    scenario 'and click to attend the party' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      VCR.use_cassette("create standard party") do
        @fun_party = create(:party)
      end

      VCR.use_cassette("visit ANOTHER party") do
        visit "/parties/#{@fun_party.id}"
      end

      expect(page).to have_content(@fun_party.title)
      expect(page).to have_content("Date: #{@fun_party.view_date}")
      expect(page).to have_content("Time: #{@fun_party.view_time}")
      expect(page).to have_content(@fun_party.description)
      expect(page).to have_content("Hosted By: #{@fun_party.host.name}")

      VCR.use_cassette("click attend") do
        click_on("Attend")
      end

      expect(current_path).to eq("/parties/#{@fun_party.id}")
      expect(page).to have_content("You are attending this party.")
      expect(page).to have_content("Cancel Attendance")
    end
  end

  context 'as the host of a party' do
    it 'should give me different options on party show' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      VCR.use_cassette("create standard party") do
        @fun_party = create(:party, host_id: user.id)
      end

      VCR.use_cassette("visit ANOTHER party") do
        visit "/parties/#{@fun_party.id}"
      end

      expect(page).to_not have_content("Attend")
      expect(page).to_not have_content("Cancel Attendance")

      click_on "Cancel Party"

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content("Your party was successfully cancelled.")
    end
  end
end
