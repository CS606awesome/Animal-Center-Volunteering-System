class SessionsController < ApplicationController
  def new
   @account =Account.new
  end
  def create
   @account = Account.find_by(email: params[:session][:email].downcase)
    if @account && @account.authenticate(params[:session][:password])
      log_in @account
      redirect_to account_articles_path(@account)
    else
    render 'new'  
    end
  end
  def show
   
  end
  
  def destroy
    
  end
  
    
 
  
end
