require "rails_helper"

feature "As an authenticated user" do
  context "when on my user dashboard" do
    scenario "I can see my parties" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      VCR.use_cassette("create_6_parties") do
        party_1 = create(:party, host_id: user.id)
        party_2 = create(:party)
        party_3 = create(:party)
        party_4 = create(:party)
        party_5 = create(:party, host_id: user.id)
        party_6 = create(:party)

        party_2.users << user
        party_4.users << user
        party_6.users << user

        visit '/dashboard'

        within('.hosted') do
          expect(page).to have_content(party_1.name)
          expect(page).to have_content(party_1.date)
          
        end
      end
    end
  end
end
