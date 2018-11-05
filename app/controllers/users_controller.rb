class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.welcome(@user.id).deliver_now
      flash[:success] = "Singup successful!"
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    return unless user_signed_in?

    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user == current_user && @user.update(user_update_params)
      flash[:success] = "Edit successfully"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def user_update_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
