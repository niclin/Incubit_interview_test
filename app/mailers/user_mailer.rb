class UserMailer < ApplicationMailer
  default :from => "me@mydomain.com"

  def welcome(user_id)
    @user = User.find(user_id)

    mail(to: "#{@user.name} #{@user.email}", subject: "Welcome")
  end


  def password_reset(user_id)
    @user = User.find(user_id)
    @user.create_reset_digest

    @reset_token = @user.reset_token

    mail(to: "#{@user.name} #{@user.email}", subject: "Password reset")
  end
end
