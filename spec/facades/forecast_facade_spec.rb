require "rails_helper"

describe ForecastFacade do
  subject { ForecastFacade.new(zip_code: "80203")}
  it 'exists' do
    expect(subject).to be_a(ForecastFacade)
  end
end
