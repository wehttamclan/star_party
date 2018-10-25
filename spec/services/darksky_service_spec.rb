require 'rails_helper'

describe DarkskyService do
  subject { DarkskyService.new("80203") }
  context '#dark_sky_data' do
    it 'returns dark sky json data' do
      results = subject.dark_sky_data[:data]

      expect(results.first).to have_key(:time)
      expect(results.first).to have_key(:moonPhase)
      expect(results.first).to have_key(:precipProbability)
      expect(results.first).to have_key(:cloudCover)
    end
  end
end