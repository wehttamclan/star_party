require "rails_helper"

feature "As an authenticated user" do
  context "when on my user dashboard" do
    scenario "I can see my parties" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      party_1 = create(:party)
      party_2 = create(:party)
      party_3 = create(:party)
      party_4 = create(:party)

      require "pry"; binding.pry
    end
  end
end
