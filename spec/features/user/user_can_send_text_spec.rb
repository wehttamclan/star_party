require "rails_helper"

feature "As an authenticated user" do
  context "when I mark to attend a party" do
    it 'can send a text to a friend to invite them' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      VCR.use_cassette("create standard party") do
        @party = create(:party)
      end

      VCR.use_cassette("party_show") do
        visit "/parties/#{@party.id}"
        click_on("Attend")
      end

      VCR.use_cassette("text") do
        click_on("Text a friend")

        expect(current_path).to eq('/text')

        friend = "Bob"

        fill_in :friend_name, with: friend
        fill_in :phone_number, with: "+17203620696"
      end

      VCR.use_cassette("dashboard") do
        click_on("Submit")
        friend = "Bob"

        expect(current_path).to eq('/dashboard')
        expect(page).to have_content("Your text message to #{friend} was sent!")
      end
    end
  end
end
