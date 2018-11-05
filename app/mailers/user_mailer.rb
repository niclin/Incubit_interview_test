class UserMailer < ApplicationMailer
  default :from => "me@mydomain.com"

  def welcome(user_id)
    @user = User.find(user_id)

    mail(to: "#{@user.name} #{@user.email}", subject: "Welcome")
  end
end
