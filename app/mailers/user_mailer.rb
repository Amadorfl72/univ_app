class UserMailer < ApplicationMailer
  def confirmation_email(user)
    @user = user
    @confirmation_url = "#{root_url}/students/confirm/#{@user.confirmation_token}"
    mail(to: @user.email, subject: "Confirma tu cuenta")
  end
end