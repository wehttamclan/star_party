class ForecastFacade
  attr_reader :zip_code

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def day_forecast_objects
    service.dark_sky_data[:data].map do |day_forecast_data|
      DayForecast.new(day_forecast_data)
    end
  end

  private
  def service
    @service ||= DarkskyService.new(zip_code)
  end
end
