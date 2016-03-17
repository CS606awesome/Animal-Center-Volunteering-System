class AccountsController < ApplicationController
  def index
   redirect_to action: 'new' 
   
  end
  
  def new
    @account = Account.new
  end
  
  def edit
      @account = Account.find params[:id]
  end
  
  def create
    @account = Account.new(account_params)
    if @account.save
     redirect_to @account 
    else  
      flash.now[:danger] = 'Registration failed, some inforamtion is missing!'  
      render 'new'
    end  
  end
  
  def show
    @account = Account.new
  end
  
  def profiles 
      #@account = Account.find(params[:id])  
      @accounts = Account.all
  end
  
  def update
     @account = Account.find(params[:id])
     @account.update_attributes!(account_update_params)
     redirect_to save_change_path
     #profiles_path
  end
  
  def save_change
  end
    
  def account_params
   params.require(:account).permit(:email,:password, :password_confirmation,:firstname,:lastname,:current_address,:homephone,:cellphone,:DOB)
  end
  
  def account_update_params
   params.require(:account).permit(:is_former_worker,:is_current_worker, :emergency_contact_name,
                                  :emergency_phone,:emergency_phone_alternate,:related_to_councilmember,
                                  :has_convictions, :need_accommodations)
  end
  
end
