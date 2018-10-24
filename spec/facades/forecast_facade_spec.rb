require "rails_helper"

describe ForecastFacade do

  subject { ForecastFacade.new("80203")}

  it 'exists' do
    expect(subject).to be_a(ForecastFacade)
  end

  it 'has zip code attribute' do
    expect(subject.zip_code).to eq("80203")
  end

  context 'instance methods' do
    context '#dark_sky_data' do
      it 'returns dark sky json data' do
        results = subject.dark_sky_data

        expect(results.first).to have_key(:time)
        expect(results.first).to have_key(:moonPhase)
        expect(results.first).to have_key(:precipProbability)
        expect(results.first).to have_key(:cloudCover)
      end
    end

    context "#location" do
      it 'returns string of lat and long' do
        expect(subject.location).to eq("39.731286,-104.98306")
      end
    end
  end
end
