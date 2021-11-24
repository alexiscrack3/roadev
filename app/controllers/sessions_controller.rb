class SessionsController < ApplicationController
  def sign_up
    @user = User.new
  end

  def sign_in
    @user = User.new
  end

  def authenticate_user
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      redirect_to dashboard_path
    else
      flash.now[:danger] = "Invalid email/password combination"
      render "sign_in"
    end
  end

  def create_user
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Dashboard!"
      redirect_to dashboard_url
      # redirect_to user_url(@user) # or redirect_to @user
    else
      render "sign_up"
    end
  end

  def sign_out
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
