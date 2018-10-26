class ApplicationController < ActionController::Base
  helper_method :apod

  def apod
    ApodFacade.new
  end
end
