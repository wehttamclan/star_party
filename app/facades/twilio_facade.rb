class TwilioFacade
  def initialize
    @client = Twilio::REST::Client.new(ENV["twilio_account_sid"], ENV["twilio_auth_token"])
  end

  def text(phone, friend_name)
    @client.messages.create(
      from: ENV["twilio_phone_number"],
      to: friend_phone,
      body: "Hi #{friend_name}! #{current_user.name} is attending a
      Star Party and wants you to join! You can see more info at #{link}.")
  end
end
