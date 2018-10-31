class TextsController < ApplicationController
  def new
    @party_id = params[:party_id]
  end

  def create
    friend_name = params[:friend_name]
    party_id = Party.find(params[:party_id]).id
    twilio = TwilioFacade.new(friend_name, current_user.name, params[:phone_number], party_id)
    twilio.text

    flash[:alert] = "Your text message to #{friend_name} was sent!"
    redirect_to '/dashboard'
  end
end
