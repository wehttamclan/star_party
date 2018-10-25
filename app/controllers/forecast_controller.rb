class ForecastController < ApplicationController
  def index
    @forecast_results = ForecastFacade.new(params[:zip_code])
  end
end
