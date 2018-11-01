class DashboardController < ApplicationController
  def show
    if current_user
      @user = current_user
      @user_parties = UserPartyFacade.new(@user)
    else
      render status: 404
    end
  end
end
