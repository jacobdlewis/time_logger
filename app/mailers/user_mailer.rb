class UserMailer < ApplicationMailer

  def reset_password_email(user)
    @user = user
    @url = edit_password_reset_url(id: @user.reset_password_token)
    @greeting = "Hello "
    mail(:to => user.email,
         :subject => "Password reset email")
  end
end
