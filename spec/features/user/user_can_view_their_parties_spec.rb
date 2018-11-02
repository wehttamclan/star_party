require "rails_helper"

feature "As an authenticated user" do
  context "when on my user dashboard" do
    scenario "I can see my parties" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      VCR.use_cassette("create_6_parties") do
        @party_1 = create(:party, host_id: user.id)
        @party_2 = create(:party)
        @party_3 = create(:party)
        @party_4 = create(:party)
        @party_5 = create(:party, host_id: user.id)
        @party_6 = create(:party)

        @party_2.users << user
        @party_6.users << user
      end

      VCR.use_cassette('new-dashboard') do
        visit '/dashboard'
      end

        within('.hosted') do
          expect(page).to have_content(@party_1.title)
          expect(page).to have_content(@party_1.view_date)
          expect(page).to have_content(@party_5.title)
          expect(page).to have_content(@party_5.view_date)
        end

        within('.attending') do
          expect(page).to have_content(@party_2.title)
          expect(page).to have_content(@party_2.view_date)
          expect(page).to have_content(@party_6.title)
          expect(page).to have_content(@party_6.view_date)
          expect(page).to_not have_content(@party_1.title)
          expect(page).to_not have_content(@party_5.title)
        end

        expect(page).to_not have_content(@party_3.title)
        expect(page).to_not have_content(@party_4.title)
    end
  end
end
