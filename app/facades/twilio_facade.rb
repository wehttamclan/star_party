class TwilioFacade
  def initialize(friend_name, user_name, number, party)
    @client = Twilio::REST::Client.new(ENV["twilio_account_sid"], ENV["twilio_auth_token"])
    @friend_name = friend_name
    @user_name = user_name
    @number = number
    @party_id = party
  end

  def text
    @client.messages.create(
      from: ENV["twilio_phone_number"],
      to: number,
      body: "Hi #{@friend_name}! #{@user_name} is attending a
      Star Party and wants you to join! You can see more info at #{text_link}.")
  end

  def number
    @number.delete('^0-9').prepend("+1")
  end

  def text_link
    link = "https://star-party.herokuapp.com/parties/#{@party_id}"
  end
end
