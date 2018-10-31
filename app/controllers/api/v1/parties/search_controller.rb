class Api::V1::Parties::SearchController < ApplicationController
  def index
    render json: Party.where(search_params)
  end

  private

  def search_params
    params.permit(:zip_code)
  end
end
