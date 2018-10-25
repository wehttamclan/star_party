require 'rails_helper'

describe ApodService do
  it 'exists' do
    as = ApodService.new
    expect(as).to be_a(ApodService)
  end
end
