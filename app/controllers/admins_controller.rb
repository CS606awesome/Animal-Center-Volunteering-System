class AdminsController < ApplicationController

  def index
   redirect_to action: 'new'  
  end
  
  def new
    @admin = Admin.new
  end
  
  def edit
      @admin = Admin.find params[:id]
  end
  
  def create
    @admin = Admin.new(admin_params)
      if @admin.save
        redirect_to adminlogin_path :id => @admin.id
      else  
      flash.now[:danger] = 'Registration failed, some inforamtion is missing!'  
      render 'new'
      end  
  end
  
  def show
    #verify user logged in
    if !admin_logged_in
      redirect_to adminlogin_path
    else  
    ##find accounts who has already submitted the applications  
    @accounts = Account.where('submit_bcheck =?', 't')
   
    agemin = params[:agemin].to_i
    agemax = params[:agemax].to_i
    firstname = params[:firstname].to_s
    lastname = params[:lastname].to_s
    email = params[:email]
    
    if agemax > 0
      @accounts = people_younger_than(@accounts,agemax)
    end
    
    if agemin > 0
      @accounts = people_older_than(@accounts,agemin)
    end
    
    if firstname != ''
      @accounts = firstname_filter(@accounts,firstname)
    end
    
    if lastname != ''
      @accounts = lastname_filter(@accounts,lastname)
    end
    
    if email != '' 
      @accounts = email_filter(@accounts,email)
    end
   end
  end

  def check_profile
    if admin_logged_in
      session[:id] = params[:id]
      redirect_to viewapplication_path
    else
      flash[:notice] = "please log in at first!"
      redirect_to adminlogin_path
    end
    
  end


  
  def moreshow
   if !admin_logged_in
      redirect_to adminlogin_path
   else  
    @accounts = Account.where('is_volunteering = ?', 't')
    firstname = params[:firstname].to_s
    lastname = params[:lastname].to_s
    email = params[:email] 
    if firstname != ''
      @accounts = firstname_filter(@accounts,firstname)
    end
    
    if lastname != ''
      @accounts = lastname_filter(@accounts,lastname)
    end
    
    if email != '' 
      @accounts = email_filter(@accounts,email)
    end
   end
  end
  


   def approve
    @account = Account.find(params[:id])
    if @account.update_columns(status: true, submit_bcheck: false)
      flash[:notice] = 'Approvement is successful!'
      redirect_to action: 'show'
    else
      flash[:danger] = 'Approvement is failed!'
      redirect_to action: 'show'
    end
   end
   def reject
     @account = Account.find(params[:id])
    if @account.update_columns(status: false, submit_bcheck: false)
      flash[:notice] = 'Rejection is successful!'
      redirect_to action: 'show'
    else
      flash[:danger] = 'Rejection is failed!'
      redirect_to action: 'show'
    end
   end

   def finish
      @account = Account.find(params[:id])
    if @account.update_columns(status: nil, is_volunteering: false)
      #and the application data should be sent to other schema
      flash[:notice] = "#{@account.firstname} has finished the volunteering!"
      redirect_to action: 'moreshow'
    else
      flash[:danger] = 'Operation is failed!'
      redirect_to action: 'moreshow'
    end
   end
 
      
  #compare the age
  def people_older_than(accounts, n) 
    res = []
    accounts.each do |e|
      if to_sec(e.DOB) < n.years.ago.to_i
        res << e
      end
    end
    res
  end

  def people_younger_than(accounts, n) 
    res = []
    accounts.each do |e|
      if to_sec(e.DOB) > n.years.ago.to_i
        res << e
      end
    end
    res
  end
  
   def firstname_filter(accounts,firstname)
    res = []
    accounts.each do |e|
      if e.firstname.downcase == firstname.downcase
        res << e
      end
    end
    res
  end
  #  @accounts = @accounts.where('lower(firstname) = ?', firstname.downcase)
 # end
  
  def lastname_filter(accounts,lastname)
    res = []
    accounts.each do |e|
      if e.lastname.downcase == lastname.downcase
        res << e
      end
    end
    res
  end
 #   @accounts = @accounts.where('lower(lastname) = ?', lastname.downcase)
#  end
  
  def email_filter(accounts,email)
    res = []
    accounts.each do |e|
      if e.email.to_s.include?(email)
        res << e
      end
    end
    res
  end
  
  



  def admin_params
   params.require(:admin).permit(:email,:password, :password_confirmation,:key)
  end
end

