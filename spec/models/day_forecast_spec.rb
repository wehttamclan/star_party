require 'rails_helper'

describe DayForecast do
  attributes = {"time": 1540360800,
                "summary": "Rain until evening.",
                "moonPhase": 0.51,
                "precipProbability": 0.87,
                "cloudCover": 0.99}

  subject { DayForecast.new(attributes) }

  it 'exists' do
    expect(subject).to be_a DayForecast
  end

  it 'attributes' do
    expect(subject.time).to eq '2018-10-24 00:00:00 -0600'
  end
end
