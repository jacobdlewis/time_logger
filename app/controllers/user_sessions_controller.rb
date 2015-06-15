class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:user][:email], params[:user][:password])
      redirect_to root_path, notice: "Welcome back, #{@user.name}"
    else
      @user = User.new(email: params[:user][:email])
      flash.alert = "We could not sign you in. Please check your email/password and try again."
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: "You have been signed out."
  end
end