class AdminSessionsController < ApplicationController
  def new
   @admin =Admin.new
  end
  def create
   @admin = Admin.find_by(email: params[:session][:email].downcase)
  #@account.authenticate('123456')
   if @admin && @admin.authenticate(params[:session][:password])
      admin_log_in @admin
      redirect_to @admin
    else
    flash.now[:danger] = 'Your are not in admin table'  
       render 'admin_sessions/new'
    end
  end
end
