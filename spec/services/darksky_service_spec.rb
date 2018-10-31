require 'rails_helper'

describe DarkskyService do

  subject { DarkskyService.new("80203") }
  context '#dark_sky_data' do
    it 'returns dark sky json data' do
      results = VCR.use_cassette("pull dark sky data") do
        subject.dark_sky_data[:data]
      end

      expect(results.first).to have_key(:time)
      expect(results.first).to have_key(:moonPhase)
      expect(results.first).to have_key(:precipProbability)
      expect(results.first).to have_key(:cloudCover)
    end
    context "#location" do
      it 'returns string of lat and long' do
        expect(subject.location).to eq("39.731286,-104.98306")
      end
    end
  end
end
