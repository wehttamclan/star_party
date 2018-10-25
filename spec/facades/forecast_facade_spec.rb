require "rails_helper"

describe ForecastFacade do
  subject { ForecastFacade.new("80203") }

  it 'exists' do
    expect(subject).to be_a(ForecastFacade)
  end

  it 'has zip code attribute' do
    expect(subject.zip_code).to eq("80203")
  end

  context 'instance methods' do
    context '#day_forecast_objects' do
      it 'returns dark sky json data' do
        results = subject.day_forecast_objects

        expect(results.length).to eq(8)
        expect(results.first).to be_a DayForecast
      end
    end

    context '#zip_code' do
      it 'returns the zip code passed in' do
        zip_code = subject.zip_code

        expect(zip_code).to eq('80203')
      end
    end

    context '#week_summary' do
      it 'returns the summary for the week' do
        summary = subject.week_summary

        expect(summary).to be_a String
      end
    end

  end
end
