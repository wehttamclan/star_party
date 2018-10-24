class WelcomeController < ApplicationController
  def index
    @apod = ApodFacade.new
  end
end
