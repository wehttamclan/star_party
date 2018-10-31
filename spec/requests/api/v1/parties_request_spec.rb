require 'rails_helper'

describe "Parties API" do
  it "sends a list of parties" do
    VCR.use_cassette("create 5 parties") do
      create_list(:party, 5)
    end

    VCR.use_cassette("get all parties api") do
      get '/api/v1/parties'
    end

    expect(response).to be_successful

    parties = JSON.parse(response.body)

    expect(parties.count).to eq(5)
  end

  it "can get one party by its id" do
    VCR.use_cassette("create standard party") do
      @id = create(:party).id
    end

    VCR.use_cassette("visit party show api") do
      get "/api/v1/parties/#{@id}"
    end

    party = JSON.parse(response.body)

    expect(response).to be_successful
    expect(party["id"]).to eq(@id)
  end

  it "returns all parties by zip code" do
    VCR.use_cassette("create parties by zip") do
      @party1, @party2 = create_list(:party, 2, zip_code: 80000)
      @party3 = create(:party, zip_code: 70000)
    end

    VCR.use_cassette("return parties in certain zip code api") do
      get "/api/v1/parties/find_all?zip_code=#{@party1.zip_code}"
    end

    expect(response).to be_successful

    parties = JSON.parse(response.body)

    expect(response.body).to include("#{@party1.id}")
    expect(response.body).to include("#{@party2.id}")
    expect(response.body).to_not include("#{@party3.zip_code}")
  end
end
