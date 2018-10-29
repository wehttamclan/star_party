require 'twilio-ruby'

class TwilioController < ApplicationController
  # include Webhookable
  #
  # after_filter :set_header

  skip_before_action :verify_authenticity_token

  def create
    client = Twilio::REST::Client.new(ENV["twilio_account_sid"], ENV["twilio_auth_token"])

    from =

    client.messages.create(
      from: ENV["twilio_phone_number"]
      to: '+17203620696'
      body: "Test Twilio Message from app"
    )
  end

end
