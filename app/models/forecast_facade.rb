class ForecastFacade
  attr_reader :zip_code

  def initialize(zip_code)
    @zip_code = zip_code
  end

  # def zip_code
  #   @zip_code
  # end

  def location
    service.location
    # @zip_code.to_lat + "," + @zip_code.to_lon
  end

  def week_summary
    service.dark_sky_data[:summary]
  end

  def day_forecast_objects
    service.dark_sky_data[:data].map do |day_forecast_data|
      DayForecast.new(day_forecast_data)
    end
  end

  def service
    @service ||= DarkskyService.new(zip_code)
  end

end
