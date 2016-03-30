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
    @accounts = Account.all
    agemin = params[:agemin].to_i
    agemax = params[:agemax].to_i
    if agemin > 0     
      @accounts = people_older_than(@accounts,agemin)
    end

    if agemax > 0    
      @accounts = people_younger_than(@accounts,agemax)
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
