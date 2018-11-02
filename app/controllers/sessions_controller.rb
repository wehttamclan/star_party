class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/dashboard"
    elsif auth_hash
      user = User.find_by_email(auth_hash["info"]["email"]) || User.create_with_omniauth(auth_hash)
      session[:user_id] = user.id
      redirect_to "/dashboard", flash[:notice] => "Signed in!"
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
