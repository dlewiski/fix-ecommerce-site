class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      flash[:notice] = "You've successfully signed in"
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/sign_in'
    end
  end

  def destroy
    flash[:notice] = "You've successfully signed out!"
    session[:user_id] = nil
    redirect_to '/sign_in'
  end

end
