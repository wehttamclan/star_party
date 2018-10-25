require 'rails_helper'

describe PartySearchResult do
  it 'exists' do
    psr = PartySearchResult.new(80203)
    expect(psr).to be_a(PartySearchResult)
  end

end
