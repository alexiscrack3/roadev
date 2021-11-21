class SessionsController < ApplicationController
  def sign_up
    @user = User.new
  end

  def sign_in
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      redirect_to users_sign_in_path
    end
  end
end
