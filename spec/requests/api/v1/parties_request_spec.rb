require 'rails_helper'

describe "Parties API" do
  it "sends a list of merchants" do
    create_list(:party, 3)

    get '/api/v1/parties'

    expect(response).to be_successful

    parties = JSON.parse(response.body)

    expect(parties).count to eq(3)
  end
end
