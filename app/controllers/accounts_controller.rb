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
    @account = Account.new
  end
  
  def profiles 
      @account = Account.find(params[:id])  
      #@accounts = Account.all
  end
  
  
  def update
     @account = Account.find(params[:id])
     #@account.update_attributes!(account_update_params)
     if(params[:account][:is_former_worker] == "1") 
       @account.user_formerworker ||= UserFormerworker.new   
     end
     if(params[:account][:related_to_councilmember] == "1") 
       @account.related_councilmember ||= RelatedCouncilmember.new   
     end
     if(params[:account][:is_current_worker] == "1") 
       @account.current_worker ||= CurrentWorker.new   
     end
     if(params[:account][:has_convictions] == "1") 
       @account.former_criminal ||= FormerCriminal.new   
     end
     if(params[:account][:need_accommodations] == "1") 
       @account.accommodation ||= Accommodation.new   
     end
     
     @account.attributes = account_update_params
     
     if(params[:account][:is_former_worker] == "0")
         if(@account.user_formerworker != nil)
             @account.user_formerworker.destroy
         end
     end
     if(params[:account][:related_to_councilmember] == "0") 
       if @account.related_councilmember != nil
           @account.related_councilmember.destroy
       end
     end
     if(params[:account][:is_current_worker] == "0") 
       if @account.current_worker != nil  
           @account.current_worker.destroy
       end
     end
     if(params[:account][:has_convictions] == "0") 
       if @account.former_criminal != nil  
           @account.former_criminal.destroy
       end
     end
     if(params[:account][:need_accommodations] == "0") 
       if @account.accommodation != nil   
           @account.accommodation.destroy
       end
     end
     
     @account.save(:validate => false)
     flash[:notice] = 'Changes Saved!'
     redirect_to profiles_path :id => @account.id
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
                                  accommodation_attributes: [:id, :accommodation_name])
                                
  end
  

  #def current_worker_params
     # params.require(:current_worker).permit(:)
end
