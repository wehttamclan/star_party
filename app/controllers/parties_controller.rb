class PartiesController < ApplicationController
  def new
    if current_user
      @party = Party.new(new_party_params)
    else
      flash[:notice] = 'Must be logged in to create party.'
      redirect_to "/"
    end
  end

  def create
    if current_user
      party = Party.new(party_params)
      party.host_id = current_user.id
      time = { hour: time_params["date(4i)"], min: time_params["date(5i)"] }
      party.update(date: party.date.change(time))
      if Geocoder.coordinates(party.address)
        coordinates = Geocoder.coordinates(party.address)
        party.latitude = coordinates[0]
        party.longitude = coordinates[1]
        if party.save
          redirect_to party_path(party)
        else
          flash[:notice] = "Something went wrong. \n
                            Please fill in all fields"

          redirect_to new_party_path(party_params)
        end
      else
        flash[:notice] = 'Must put in valid address.'
        redirect_to new_party_path(party_params)
      end
    else
      flash[:notice] = 'Must be logged in to create party.'
      render :new
    end
  end

  def show
    @party = Party.find(params[:id])
    @party.attendance(current_user, params[:attendance]) if params[:attendance]
  end

  def destroy
    party = Party.find(params[:id])
    if party.destroy
      flash[:notice] = "Your party was successfully cancelled."
      redirect_to '/dashboard'
    else
      flash[:alert] = "Something went wrong, your party wasn't cancelled."
      render :show
    end
  end

  private
  def party_params
    params.require(:party).permit(:title, :description, :date, :street_address, :city, :zip_code, :state)
  end

  def new_party_params
    params.permit(:zip_code, :date)
  end

  def time_params
    params.require(:time).permit(:date)
  end
end
