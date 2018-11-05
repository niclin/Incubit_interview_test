class UserMailer < ApplicationMailer
  default :from => "me@mydomain.com"

  def welcome(user_id)
    @user = User.find(user_id)

    mail(to: "#{@user.name} #{@user.email}", subject: "Welcome")
  end

  def password_reset(user_id, token)
    @user = User.find(user_id)

    @token = token

    mail(to: "#{@user.name} #{@user.email}", subject: "Password reset")
  end
end
