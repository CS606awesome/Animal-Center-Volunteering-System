class AccountsController < ApplicationController
  def index
   redirect_to new_account_path
  end
  def new
   @account = Account.new 
  end
  def create
    @account = Account.new (account_param)
    if @account.save
      redirect_to @account
    else
      render 'new'
    end
  end
  def account_param
   params.require(:account).permit(:email, :password)
  end
  
    
end
