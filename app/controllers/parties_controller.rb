class PartiesController < ApplicationController
  def new
    @party = Party.new(new_party_params)
  end
  
  def create
    party = Party.new(party_params.merge(new_party_params))
    if party.save
      redirect_to party_path(party)
    else
      flash[:notice] = 'Something went wrong.'
      render :new
    end
  end

  private
  def party_params
    params.require(:party).permit(:title, :description, :date, :street_address, :city, :zip_code)
  end

  def new_party_params
    params.permit(:zip_code, :date, :state)
  end
end