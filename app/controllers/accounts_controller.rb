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
    flash[:success] = 'Congradulations!now go ahead and login'  
    @account = Account.new
  end
  
  def profiles 
      if logged_in
      @account = Account.find(params[:id])  
      #@accounts = Account.all
      else
      redirect_to login_path
      end
  end
  
  def application
      if logged_in
      @account = Account.find(params[:id])  
      #@accounts = Account.all
      else
      redirect_to login_path
      end
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

   params.require(:account).permit(:email,:password, :password_confirmation,:firstname,:lastname, :middlename,:country,:state,:city,:street,:zip,:homephone,:cellphone,:DOB)
  end
  
  def account_update_params
   params.require(:account).permit(:is_former_worker,:is_current_worker, :emergency_contact_name,
                                  :emergency_phone,:emergency_phone_alternate,:related_to_councilmember,
                                  :has_convictions, :need_accommodations, 
                                  current_worker_attributes: [:id, :department, :name],
                                  user_formerworker_attributes: [:id, :date_of_employment, :reason_for_leaving, :position_or_department],
                                  former_criminal_attributes: [:id, :date_of_conviction, :nature_of_offense, :name_of_court, :disposition_of_case, :former_crime],
                                  related_councilmember_attributes: [:id, :name, :relationship],
                                  accommodation_attributes: [:id, :accommodation_name],
                                  application_form_attributes: [:id, :signature, :interested_areas, :volunteering_status, :application_date, :available_time_begin, :available_time_end],
                                  criminal_application_attributes: [:id, :mandatory_hours, :mandatory_area, :deadline],
                                  student_application_attributes: [:id, :required_area, :required_time, :deadline],
                                  minor_application_attributes: [:id, :parent_signature])
                                
  end

  #change password
  def input_your_email
      if params[:email]
        @account = Account.find_by(email: params[:email])
        if @account
          session[:id]= @account.id
          Mailer.welcome_email(@account).deliver_now
          redirect_to check_your_email_path
        else
          flash.now[:danger] = 'Your email is not valid or it has not been registered, please try again!'
          render 'input_your_email'
        end
      end
  end
  
  def reset_your_password
     @account = Account.find(session[:id])
  end
   
   def save_password_change
      @account = Account.find(session[:id])
     
       if (params[:account][:password] == params[:account][:password_confirmation])
         if @account.update_attributes(account_password_params)   
            flash[:success] = "You have reset your password successfully."
            redirect_to login_path
         else
<<<<<<< HEAD
           flash[:failed] = "passwords are not satisfied the requirement."
           flash[:requirement] = "Your password must be 6-20 characters and cannot be blank."
=======
           flash[:failed] = 'passwords are not satisfied the requirement.'
           flash[:requirement] = 'Your password must be 6-20 characters and cannot be blank.'
>>>>>>> c2edd36f3fd4c9dc8cbddee7812b2bac8b69e754
           render 'reset_your_password'
         end
       else
          flash[:alert]="The passwords you entered must be the same!"
          render 'reset_your_password'
       end
   end
   
private
  def account_password_params
     params.require(:account).permit(:password, :password_confirmation)
  end

end
