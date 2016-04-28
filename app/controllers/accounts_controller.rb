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
  
  #render the login page
  def show
    flash[:success] = 'Congradulations! Now go ahead and log in'  
    @account = Account.new
  end
  
  
  def profiles 
      if logged_in
      @account = Account.find(session[:id])  
      else
      redirect_to login_path
      end
  end
  
  #submit application 
  def submit_application
      @account = Account.find(session[:id])
      if @account.update(:is_volunteering=>'t')
       redirect_to viewapplication_path
      else
       redirect_to action: 'application'
      end

  end


  def destroyapplication
    @account = Account.find(session[:id])
    if @account.update(:is_volunteering=>'f') && @account.application_form.destroy
      flash[:success] = "Withdrawal succeeded!"
      redirect_to action: 'profiles'
    else
      flash[:danger] = "Withdrawal failed!"  
      redirect_to action: 'viewapplication'
    end

  end


  def application

      if logged_in
      @account = Account.find(session[:id]) 
          if @account.status == nil|| @account.status==false
              #if rejected
              if @account.status ==false
              flash[:danger] = 'You were rejected by our administrator, we are sorry you can not be a volunteer this time.' 
              #haven't submit for background check 
              else           
              flash[:danger] = 'You have not be approved by our administrator yet, please submit and wait with patience.'
              end
              redirect_to profiles_path#(:id => @account.id)
          else
          @account.application_form ||= ApplicationForm.new 
          # if user is a criminal
           if @account.has_convictions == true   
            @account.criminal_application ||= CriminalApplication.new
           end  
           #if user is required by organization
           if @account.is_student == true
               @account.student_application ||= StudentApplication.new
           end
           ##if user's DOB is later than 18 years ago(younder than 18)

           ##if user is a student
         #  if 
         #   @account.student_application ||= StudentApplication.new 
         #  end   
           if to_sec(@account.DOB) > 18.years.ago.to_i    
            @account.minor_application ||= MinorApplication.new   
           end


          end          
     
      else
      redirect_to login_path
      end
  end
  
  def viewapplication
    
    if logged_in
      @account = Account.find(session[:id])
     #if @account.is_volunteering == false || @account.is_volunteering == nil
        #redirect_to profiles_path :id => @account.id
        #flash[:notice] = "Your have no submitted application, please wait or contact the administrator."
      #end

    #check as a administrator
    elsif admin_logged_in
      @account = Account.find(params[:id])

    else
      redirect_to login_path
    end
  end
  
  def update

     @account = Account.find(params[:id])
     
     #@account.is_volunteering = false
     
     #if params[:account][:application_form_attributes][signature
    #    @account.is_volunteering = true
    # end
     
     #if @account.is_volunteering == nil || @account.is_volunteering == false
     #@account.update_attributes!(account_update_params)

     if @account.submit_bcheck == false
     
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
     
        if @account.save(:validate => false)
        flash[:success] = 'Changes Saved!'
    
     #else
     #   flash[:notice] = 'Your have already submitted an application, you can not submit change until you complete this one.'
    #    redirect_to profiles_path :id => @account.id
        redirect_to action: 'profiles'
        else
        flash[:alert] = 'Your last application has been approved, you can not submit a new one until you complete this one.'
        redirect_to application_path :id => @account.id
        end
     else
         flash[:warning] = 'Your profile is under investigation, please do not make any changes'
         redirect_to profiles_path
     end

  end
  
  def save_and_submit
      @account = Account.find(session[:id])

      if @account.submit_bcheck == false && @account.status == nil      #if never submit, then save and submit        
          if @account.update(:submit_bcheck => 't')
              flash[:success] = 'Your profile has been sent to the administrator'

     #     redirect_to profiles_path :id => @account.id
     # else                                                   # if have already submitted, return to page and do nothing
     #     redirect_to profiles_path :id => @account.id

          else
          flash[:danger] = 'Submission is failed'  
          end
      else     
          if @account.status != nil  
          flash[:success] = 'You are approved, no need to bother our administrator right? LOL'# if have submitted, return to page and do nothing
          else
          flash[:info] = 'Your profile is under processing!'
          end
      end
      
      redirect_to profiles_path #:id => @account.id
      
  end
     
  
  def save_change
      @account = Account.find(params[:id])
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
    
  def resend_your_email
     @account = Account.find(session[:id])
     Mailer.welcome_email(@account).deliver_now
     flash[:success] = "Email has been resent again, please check it!"
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
           flash[:warning] = "Passwords are not satisfied the requirement."
           flash[:info] = "Your password must be 6-20 characters and cannot be blank."
           render 'reset_your_password'
         end
       else
          flash[:warning]="The passwords you entered must be the same!"
          render 'reset_your_password'
       end
   end

private
  def account_password_params
     params.require(:account).permit(:password, :password_confirmation)
  end
  def account_params

   params.require(:account).permit(:gender, :email,:password, :password_confirmation,:firstname,:lastname, :middlename,:country,:state,:city,:street,:zip,:homephone,:cellphone,:DOB)
  end
  
  def account_update_params
   params.require(:account).permit(:is_former_worker,:is_current_worker, :emergency_contact_name,
                                  :emergency_phone,:emergency_phone_alternate,:related_to_councilmember,
                                  :has_convictions, :need_accommodations, :is_volunteering,  :is_student,
                                  :firstname, :lastname, :DOB, :homephone, :cellphone, :street, :city, :state, :zip,
                                  current_worker_attributes: [:id, :department, :name],
                                  user_formerworker_attributes: [:id, :date_of_employment, :reason_for_leaving, :position_or_department],
                                  former_criminal_attributes: [:id, :date_of_conviction, :nature_of_offense, :name_of_court, :disposition_of_case, :former_crime],
                                  related_councilmember_attributes: [:id, :name, :relationship],
                                  accommodation_attributes: [:id, :accommodation_name],
                                  application_form_attributes: [:id, :signature, :interested_areas, :volunteering_status, :application_date, :available_time_begin, :available_time_end],
                                  criminal_application_attributes: [:id, :mandatory_hours, :mandatory_area, :deadline],
                                  student_application_attributes: [:id, :student_program, :required_area, :required_time, :deadline],
                                  minor_application_attributes: [:id, :parent_signature])
                                
  end


end
