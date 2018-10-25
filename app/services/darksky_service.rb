class DarkskyService
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def location
    @zip_code.to_lat + "," + @zip_code.to_lon
  end

  def dark_sky_data
    JSON.parse(response.body, symbolize_names: true)[:daily]
  end

  def response
    @response ||= Faraday.get("https://api.darksky.net/forecast/#{ENV["darksky_api_key"]}/#{location}")
  end
end
