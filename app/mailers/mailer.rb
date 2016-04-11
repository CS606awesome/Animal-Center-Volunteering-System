class Mailer < ApplicationMailer
  default from: 'zhangsikai123@tamu.edu'

  def welcome_email(user)
    @user = user
    @url  = '~/reset_your_password'
    mail(to: @user.email, subject: 'Reset password from Animal Center Volunteering System')
  end
end
