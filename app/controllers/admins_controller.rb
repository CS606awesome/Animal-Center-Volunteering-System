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
    @accounts = Account.all
    agemin = params[:agemin].to_i
    agemax = params[:agemax].to_i
    firstname = params[:firstname].to_s
    lastname = params[:lastname].to_s
    email = params[:email]
    
    
    if (firstname != '') && (lastname != '') && (email != '')
      @accounts_find_firstname = Account.where('lower(firstname) = ?', firstname.downcase)
      @accounts_find_lastname = @accounts_find_firstname.where('lower(lastname) = ?', lastname.downcase)
      @accounts_find = @accounts_find_lastname.where("lower(email) LIKE lower(?)", "#{email}%")
    elsif (firstname != '') && (lastname != '') && (email == '')
      @accounts_find_firstname = Account.where('lower(firstname) = ?', firstname.downcase)
      @accounts_find = @accounts_find_firstname.where('lower(lastname) = ?', lastname.downcase)
    elsif (lastname != '') && (email != '') && (firstname == '')
      @accounts_find_lastname = Account.where('lower(lastname) = ?', lastname.downcase)
      @accounts_find = @accounts_find_lastname.where("lower(email) LIKE lower(?)", "#{email}%")
    elsif (firstname != '') && (email != '') && (lastname == '')
      @accounts_find_firstname = Account.where('lower(firstname) = ?', firstname.downcase)
      @accounts_find = @accounts_find_firstname.where("lower(email) LIKE lower(?)", "#{email}%")
    elsif (firstname != '') && (lastname == '') && (email == '')
      @accounts_find = Account.where('lower(firstname) = ?', firstname.downcase)
    elsif (lastname != '') && (firstname == '') && (email == '')
      @accounts_find = Account.where('lower(lastname) = ?', lastname.downcase)
    elsif (email != '') && (firstname == '') && (lastname == '')
      @accounts_find = Account.where("lower(email) LIKE lower(?)", "#{email}%")
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
