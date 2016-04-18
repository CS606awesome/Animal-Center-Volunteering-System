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
    @accounts = Account.where('submit_bcheck = ?', 't')
   
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
    if @account.update(:status => 't', :submit_bcheck => 'f')
      flash[:notice] = 'Approvement is successful!'
      redirect_to action: 'show'
    else
      flash[:danger] = 'Approvement is failed!'
      redirect_to action: 'show'
    end
   end
   def reject
     @account = Account.find(params[:id])
    if @account.update(:status => 'f', :submit_bcheck => 'f')
      flash[:notice] = 'Rejection is successful!'
      redirect_to action: 'show'
    else
      flash[:danger] = 'Rejection is failed!'
      redirect_to action: 'show'
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
    @accounts = @accounts.where('lower(firstname) = ?', firstname.downcase)
  end
  
  def lastname_filter(accounts,lastname)
    @accounts = @accounts.where('lower(lastname) = ?', lastname.downcase)
  end
  
  def email_filter(accounts,email)
    @accounts = @accounts.where("lower(email) LIKE lower(?)", "#{email}%")
  end
  



  def admin_params
   params.require(:admin).permit(:email,:password, :password_confirmation,:key)
  end
end

