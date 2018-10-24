class ForecastFacade
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def zip_code
    @zip_code
  end

  def location
    @zip_code.to_lat + "," + @zip_code.to_lon
  end



  def dark_sky_data
    response = Faraday.get("https://api.darksky.net/#{ENV["darksky_api_key"]}/#{location}")
    raw_forecast_data = JSON.parse(response.body, symbolize_names: true)[]

  end
end
