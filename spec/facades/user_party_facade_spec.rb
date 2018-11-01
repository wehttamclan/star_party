require "rails_helper"

describe UserPartyFacade do
  user = create(:user)
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

  subject { UserPartyFacade.new(user.id) }

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

  it 'exists' do
    expect(subject).to be_a(UserPartyFacade)
  end


end
