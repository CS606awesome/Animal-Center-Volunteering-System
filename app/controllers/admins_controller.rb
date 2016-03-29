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
    @admin = Admin.new
  end
  def admin_params
   params.require(:admin).permit(:email,:password, :password_confirmation,:key)
  end
end
