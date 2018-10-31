class PartiesController < ApplicationController
  def new
    @party = Party.new(new_party_params)
  end

  def create
    party = Party.new(party_params.merge(new_party_params))
    party.host_id = current_user.id
    coordinates = Geocoder.coordinates(party.address)
    party.latitude = coordinates[0]
    party.longitude = coordinates[1]
    if party.save
      redirect_to party_path(party)
    else
      flash[:notice] = 'Something went wrong.'
      redirect_to new_party_path(party_params)
    end
  end

  def show
    @party = Party.find(params[:id])
    @party.attendance(current_user, params[:attendance]) if params[:attendance]
  end

  private
  def party_params
    params.require(:party).permit(:title, :description, :date, :street_address, :city, :zip_code, :state)
  end

  def new_party_params
    params.permit(:zip_code, :date)
  end
end
