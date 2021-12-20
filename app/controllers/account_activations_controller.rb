class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      reset_session
      user.activate
      log_in user
      flash[:success] = "Account activated!"
      redirect_to dashboard_url
      # redirect_to user_url(@user) # or redirect_to @user
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
