class UserPartyFacade
  def initialize(user_id)
    @user_id = user_id
  end

  def hosting
    Party.where(host_id: @user_id)
  end

  def attending
    party_ids = UserParty.where(user_id: @user_id).pluck(:party_id)
    Party.where(id: party_ids)
  end
end
