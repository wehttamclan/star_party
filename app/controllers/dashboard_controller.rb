class DashboardController < ApplicationController
  def show
    if current_user
      @user = current_user
    else
      render status: 404
    end 
  end
end
