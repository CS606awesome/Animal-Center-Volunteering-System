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
        redirect_to adminlogin_path
      else  
      flash.now[:danger] = 'Registration failed, some inforamtion is missing!'  
      render 'new'
      end  
  end
  
  def show
    if !admin_logged_in
      redirect_to adminlogin_path
    else
    @accounts = Account.all
    agemin = params[:agemin].to_i
    agemax = params[:agemax].to_i
    firstname = params[:firstname].to_s
    lastname = params[:lastname].to_s
    email = params[:email].to_s
    
    if (firstname != '') && (lastname != '') && (email != '')
      @accounts_find = Account.where(:firstname => firstname, :lastname => lastname, :email => email)
    elsif (firstname != '') && (lastname != '') && (email == '')
      @accounts_find = Account.where(:firstname => firstname, :lastname => lastname)
    elsif (lastname != '') && (email != '') && (firstname == '')
      @accounts_find = Account.where(:lastname => lastname, :email => email)
    elsif (firstname != '') && (email != '') && (lastname == '')
      @accounts_find = Account.where(:firstname => firstname, :email => email)
    elsif (firstname != '') && (lastname == '') && (email == '')
      @accounts_find = Account.where(:firstname => firstname)
    elsif (lastname != '') && (firstname == '') && (email == '')
      @accounts_find = Account.where(:lastname => lastname)
    elsif (email != '') && (firstname == '') && (lastname == '')
      @accounts_find = Account.where(:email => email)
    else @accounts_find = Account.all
    end
    
    if (agemin > 0) && ((firstname != '') || (lastname != '') || (email != ''))
      @accounts = people_older_than(@accounts_find,agemin)
    elsif (agemin > 0) && (firstname == '') && (lastname == '') && (email == '')
      @accounts = people_older_than(@accounts,agemin)
    elsif agemin <= 0
      @accounts = @accounts_find
    end

    if (agemax > 0) && ((firstname != '') || (lastname != '') || (email != ''))
      @accounts = people_younger_than(@accounts_find,agemax)
    elsif (agemax > 0) && (firstname == '') && (lastname == '') && (email == '')
      @accounts = people_younger_than(@accounts,agemax)
    elsif agemax <= 0
      @accounts = @accounts_find
    end
   end
  end

  def admin_params
   params.require(:admin).permit(:email,:password, :password_confirmation,:key)
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

end
