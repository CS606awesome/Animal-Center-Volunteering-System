class Mailer < ApplicationMailer
  default from: 'zhangsikai123@tamu.edu'

  def reset_password_email(user)
    @user = user
    @url  = '~/reset_your_password'
    mail(to: @user.email, subject: 'Reset password from Animal Center Volunteering System')
  end

  def approve_email(user)
  	@user = user
    mail(to: @user.email, subject: 'Congradulations!You have been approved by Animal Center Volunteering Administrator')
  end

  def reject_email(user)
  	@user = user
    mail(to: @user.email, subject: 'Sorry, You are rejected by Animal Center Volunteering Administrator')
  end
end
