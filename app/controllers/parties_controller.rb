class PartiesController < ApplicationController
  def new
    @party = Party.new(new_party_params)
  end

  def create
    party = Party.new(party_params.merge(new_party_params))
    party.host_id = current_user.id
    if party.save
      redirect_to party_path(party)
    else
      flash[:notice] = 'Something went wrong.'
      redirect_to new_party_path(party_params)
    end
  end

  def show
    @party = Party.find(params[:id])
    @party.attendance(params[:user], params[:attendance]) if params[:attendance]
  end

  private
  def party_params
    params.require(:party).permit(:title, :description, :date, :street_address, :city, :zip_code)
  end

  def new_party_params
    params.permit(:zip_code, :date, :state)
  end
end
