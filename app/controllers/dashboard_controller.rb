class DashboardController < ApplicationController
  def show
    if current_user
      @user = current_user
      @user_parties = UserPartyFacade.new(current_user.id)
    else
      render status: 404
    end
  end
end
