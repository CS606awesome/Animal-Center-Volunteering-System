class SessionsController < ApplicationController
def new
   @account =Account.new
  end
  def create
   @account = Account.find_by(email: params[:session][:email].downcase)
   if @account&& @account.authenticate(params[:session][:password])
      log_in @account
      render 'volunteer'
    else
    flash.now[:danger] = 'Wrong email/password combination!'  
       render 'accounts/show'
    end
  end
  
  def show
   
  end
  
  def destroy
    log_out
    redirect_to accounts_path
  end
end
