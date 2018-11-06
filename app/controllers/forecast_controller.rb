class ForecastController < ApplicationController
  def index
    @zip_code = params[:zip_code]
    if (@zip_code.to_lat && @zip_code.to_lon)
      @forecast_results = ForecastFacade.new(@zip_code)
    else
      flash[:alert] = "Sorry, no data for #{@zip_code}. Please try again."
      redirect_to '/'
    end 
  end
end
