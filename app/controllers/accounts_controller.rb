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
    #@current_worker = @account.current_workers.create(current_worker_params)
    if @account.save
     redirect_to @account 
    else  
      flash.now[:danger] = 'Registration failed, some inforamtion is missing!'  
      render 'new'
    end  
  end
  
  def show
    flash.now[:success] = 'Congradulations!now go ahead and login'  
    @account = Account.new
  end
  
  def profiles 
      @account = Account.find(params[:id])  
      #@accounts = Account.all
  end
  
  
  def update
     @account = Account.find(params[:id])
     if @account.update_attributes(account_password_params)
         flash[:success] = "You have reset your password successfully."
         redirect_to login_path
     else
         flash[:failed] = 'Two passwords do not match or passwords are not satisfied the requirement.'
         flash[:requirement] = 'Your password must be 6-20 characters.'
       
     end
     @account.attributes = account_update_params
     @account.save(:validate => false)
     redirect_to save_change_path :id => @account.id
  end
     
  
  def save_change
      @account = Account.find(params[:id])
  end  
  
  def account_params
   params.require(:account).permit(:email,:password, :password_confirmation,:firstname,:lastname, :middlename,:current_address,:homephone,:cellphone,:DOB)
  end
  
  def account_update_params
   params.require(:account).permit(:is_former_worker,:is_current_worker, :emergency_contact_name,
                                  :emergency_phone,:emergency_phone_alternate,:related_to_councilmember,
                                  :has_convictions, :need_accommodations, 
                                  current_worker_attributes: [:id, :department, :name],
                                  user_formerworker_attributes: [:id, :date_of_employment, :reason_for_leaving, :position_or_department],
                                  former_criminal_attributes: [:id, :date_of_conviction, :nature_of_offense, :name_of_court, :disposition_of_case, :former_crime],
                                  related_councilmember_attributes: [:id, :name, :relationship],
                                  accommodation_attributes: [:id, :accomodation_name])
                                
  end

  def forgetyourpassword
      redirect_to  input_your_email_path
  end
  
  def inputyouremail
      if params[:email]
        @account = Account.find_by(email: params[:email])
        if @account
          session[:id]= @account.id
          render  'resetyourpassword'
        else
          flash.now[:danger] = 'Your email is not valid or it has not been registered, please try again!'
          render 'inputyouremail'
        end
      end
  end
    
    
  def reset_your_password
      @account = Account.find(session[:id])
      @account.update(account_password_params)
  end
private
  def account_password_params
     params.require(:account).permit(:password, :password_confirmation)
  end

end
