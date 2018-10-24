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

  def week_summary
    dark_sky_data[:summary]
  end

  def dark_sky_data
    JSON.parse(response.body, symbolize_names: true)[:daily]
  end

  def response
    @response ||= Faraday.get("https://api.darksky.net/forecast/#{ENV["darksky_api_key"]}/#{location}")
  end

  def create_day_forecast_objects
    dark_sky_data[:data].map do |day_forecast_data|
      DayForecast.new(day_forecast_data)
    end
  end
end
