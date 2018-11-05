class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user, notice: "Login successfully"
    else
      flash[:danger] = "Invalid email or password combination!"
      render 'new'
    end
  end

  def destroy
    log_out if user_signed_in?
    redirect_to login_path
  end
end
