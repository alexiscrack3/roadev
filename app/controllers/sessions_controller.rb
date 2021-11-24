class SessionsController < ApplicationController
  def sign_up
    @user = User.new
  end

  def sign_in
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to dashboard_path
    else
      # flash.now[:danger] = 'Invalid email/password combination'
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

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
