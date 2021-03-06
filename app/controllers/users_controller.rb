class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update ]
  before_action :logged_in_user, only: [:index, :show, :update]
  before_action :correct_user, only: [:update]

  def index
    @users = User.where(activated: true).order(:created_at).page params[:page]
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, flash: { success: "Profile updated" }
    else
      render :show, status: :unprocessable_entity
    end
  end

  private
    def set_user
      @user = User.find_by(id: params[:id])
    end

    def user_params
      params.require(:user)
      .permit(
        :first_name,
        :last_name,
        :linked_in
      )
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in"
        redirect_to sign_in_path
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
