require "rails_helper"

describe TwilioFacade do

  subject { TwilioFacade.new("friend", "User", "720-730-7827", 5) }

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

    context '#text_link' do
      it 'should format a link for the given party' do
        expected = "https://star-party.herokuapp.com/parties/5"

        expect(subject.text_link).to eq(expected)
      end
    end

    context '#text_body' do
      it 'should format a set body for text' do
        expected = "Hi Friend! User is attending a Star Party and wants you to join! You can see more info at https://star-party.herokuapp.com/parties/5."

        expect(subject.text_body).to eq(expected)
      end
    end
  end
end
