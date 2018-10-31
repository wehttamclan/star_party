require "rails_helper"

describe TwilioFacade do

  subject { TwilioFacade.new("Friend", "User", "720-730-7827", 5) }

  it 'exists' do
    expect(subject).to be_a(TwilioFacade)
  end
end
