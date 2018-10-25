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
        results = subject.day_forecast_objects

        expect(results.length).to eq(8)
      end
    end

    context "#location" do
      it 'returns string of lat and long' do
        expect(subject.location).to eq("39.731286,-104.98306")
      end
    end
  end
end
