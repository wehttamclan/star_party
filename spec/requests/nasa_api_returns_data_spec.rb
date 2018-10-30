require 'rails_helper'

describe 'nasa api endpoints' do
  it 'should return apod data' do
    apod_json = ApodService.new.get_json

    expect(apod_json[:title]).to be
    if apod_json[:copyright]
      expect(apod_json[:copyright]).to be
    end
    expect(apod_json[:hdurl]).to be
  end
end
