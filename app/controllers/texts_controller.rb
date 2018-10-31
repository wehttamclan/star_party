class TextsController < ApplicationController
  def new
    @party_id = params[:party_id]
  end

  def create
    friend_name = params[:friend_name]
    party_id = Party.find(params[:party_id]).id
    twilio = TwilioFacade.new(friend_name, current_user.name, params[:phone_number], party_id)
    twilio.text

    # client = Twilio::REST::Client.new(ENV["twilio_account_sid"], ENV["twilio_auth_token"])
    # client.messages.create(
    #   from: ENV["twilio_phone_number"],
    #   to: friend_phone,
    #   body: "Hi #{friend_name}! #{current_user.name} is attending a
    #   Star Party and wants you to join! You can see more info at #{link}.")

    flash[:alert] = "Your text message to #{friend_name} was sent!"
    redirect_to '/dashboard'
  end
end
