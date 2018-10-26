class PartiesController < ApplicationController
  def new
    @party = Party.new(party_params)
  end

  private
  def party_params
    params.permit(:zip_code, :date)
  end
end