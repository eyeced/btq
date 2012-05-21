class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
# session[:user_id] = @user.id
      redirect_to root_url, notice: 'Thank you for signing up, an email is sent to your mail id #{@user.email} for email confirmation'
    else
      render :new
    end
  end
end
