require "rails_helper"

describe TwilioFacade do

  subject { TwilioFacade.new("Friend", "User", "720-730-7827", 5) }

  it 'exists' do
    expect(subject).to be_a(TwilioFacade)
  end

  context 'instance methods' do
    context '#number' do
      it 'should format phone number for Twilio' do
        expected = '+17207307827'

        expect(subject.number).to eq(expected)
      end
    end
  end
end
