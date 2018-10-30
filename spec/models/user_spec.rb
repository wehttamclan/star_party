require "rails_helper"

describe User do
  context 'relationships' do
    it { should have_many(:user_parties) }
    it { should have_many(:parties), through: :user_parties }
  end
end
