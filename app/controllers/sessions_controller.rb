class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:cart] = current_cart
      redirect_to root_url, notice: 'Logged in'
    else
      flash.now.alert = "Wronf credentials given"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    session[:cart] = nil
    redirect_to root_url, notice: 'Logged out'
  end
end
