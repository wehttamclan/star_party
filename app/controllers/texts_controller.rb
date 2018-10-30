class TextsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
    @party_id = params[:party_id]
  end

  def create
    client = Twilio::REST::Client.new(ENV["twilio_account_sid"], ENV["twilio_auth_token"])
    friend_name = params[:friend_name]
    friend_phone = params[:phone_number]
    party = Party.find(params[:party_id])
    link = "https://star-party.herokuapp.com/parties/#{party.id}"

    client.messages.create(
      from: ENV["twilio_phone_number"],
      to: friend_phone,
      body: "Hi #{friend_name}! #{current_user.name} is attending a
      Star Party and wants you to join! You can see more info at #{link}.")


    flash[:alert] = "Your text message to #{friend_name} was sent!"
    redirect_to '/dashboard'
  end
end
