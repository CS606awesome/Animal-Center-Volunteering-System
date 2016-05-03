class AdminsController < ApplicationController
  #gmail library
  require 'gmail'

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
    @accounts = Account.where('submit_bcheck =?', true)
   
    agemin = params[:agemin].to_i
    agemax = params[:agemax].to_i
    firstname = params[:firstname].to_s
    lastname = params[:lastname].to_s
    email = params[:email].to_s
    
    if agemax > 0
      @accounts = people_younger_than(@accounts,agemax)
    end
    
    if agemin > 0
      @accounts = people_older_than(@accounts,agemin)
    end

    if email != ''
      @accounts = email_filter(@accounts,email)
    end
    
    if firstname != ''
      @accounts = firstname_filter(@accounts,firstname)
    end
    
    if lastname != ''
      @accounts = lastname_filter(@accounts,lastname)
    end
   
   end
  end

  ####some funcitons for adminshow page

    #send email
  def gmailsender
    if !session[:sended]
    session[:reciever_id]=params[:id]
    else
    session.delete(:sended)
    end
    @account = Account.find(session[:reciever_id]) 
  end

  def send_gmail
   @account = Account.find(session[:reciever_id])
   address = @account.email
   body = params[:body]
   gmail = Gmail.connect('sssikai123@gmail.com','woshizhu@123')
   email = gmail.compose do
    to "#{address}"
    subject "Hi,I am the volunteering administrator from bryan animal center"
    body "#{body}"
   end
   if email.deliver!
     flash[:success] = "Deliver successful!"
   else
      flash[:success] = 'Deliver failed!'  
   end
   session[:sended] = 1
   redirect_to send_gmail_path, :method =>'get'
  end
  
  ######################check profile
  def check_profile
    if admin_logged_in
      session[:id] = params[:id]
      redirect_to viewapplication_path
    else
      flash[:info] = "Please log in at first!"
      redirect_to adminlogin_path
    end
    
  end


  
  def moreshow
   if !admin_logged_in
      redirect_to adminlogin_path
   else  
    @accounts = Account.where('is_volunteering = ?', true)
    firstname = params[:firstname].to_s
    lastname = params[:lastname].to_s
    email = params[:email].to_s
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
      flash[:success] = 'Approvement is successful!'
        Mailer.approve_email(@account).deliver_now
      redirect_to action: 'show'
    else
      flash[:danger] = 'Approvement is failed!'
      redirect_to action: 'show'
    end
   end
   def reject
     @account = Account.find(params[:id])
    if @account.update_columns(status: false, submit_bcheck: false)
      flash[:success] = 'Rejection is successful!'
        Mailer.reject_email(@account).deliver_now

      redirect_to action: 'show'
    else
      flash[:danger] = 'Rejection is failed!'
      redirect_to action: 'show'
    end
   end

  ############functions for adminmoreshow page
   
   def finish
      @account = Account.find(params[:id])
    if @account.update_columns(status: nil, is_volunteering: false)
      #and the application data should be sent to other schema
      flash[:success] = "#{@account.firstname} has finished the volunteering!"
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

