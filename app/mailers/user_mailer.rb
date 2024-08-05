class UserMailer < ApplicationMailer
  def confirmation_email(user)
    @user = user
    
    #@confirmation_url = "#{root_url}/students/confirm/#{@user.confirmation_token}"
    @confirmation_url = "http://localhost:3000/students/confirm/#{@user.confirmation_token}"
    mail(to: @user.email, subject: "¡Hola desde MiMailer!") do |format|
      format.html { render plain: @confirmation_url }
      format.text { render plain: @confirmation_url }  
    end
    
  end
  
end