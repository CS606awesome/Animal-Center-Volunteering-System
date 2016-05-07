require 'spec_helper'


RSpec.describe AdminsController, :type => :controller do
    before :each do
    admins = [{:email => 'lulu1993@outlook.com', :password => '123456', :password_confirmation => '123456',
  	           :key => '11110318'},
    	        {:email => 'blade099@hotmail.com', :password => '654321', :password_confirmation => '654321',
  	           :key => '19990919'}]
  	accounts = [{:email => 'wzhsld@outlook.com', :firstname => 'Sasa', :lastname => 'Dai',:DOB => '1999-09-19',
:password => '123456', :password_confirmation => '123456', :middlename => 'lulu',:country => 'United States',
:state => 'TX',:city => 'College Station',:street => '950 Colgate Drive',:zip => '77840',:homephone => '8608999350',
:cellphone => '860-899-9350', :is_former_worker => 'f', :is_current_worker => 'f', :emergency_contact_name => '',
                                  :emergency_phone => '',:emergency_phone_alternate => '',:related_to_councilmember => 'f',
                                  :has_convictions => 'f', :need_accommodations => 'f'}, 	       
    	        {:email => 'dejelsn@hotmail.com', :firstname => 'Sikai', :lastname => 'Zhang', :DOB => '1993-02-18',
:password => '654321', :password_confirmation => '654321',:middlename => 'waw',:country => 'United States',
:state => 'TX',:city => 'College Station',:street => '233 hollenman dr',:zip => '77840',:homephone => '7564861',
:cellphone => '123-456-7800', :is_former_worker => 'f', :is_current_worker => 'f', :emergency_contact_name => '',
                                  :emergency_phone => '',:emergency_phone_alternate => '',:related_to_councilmember => 'f',
                                  :has_convictions => 'f', :need_accommodations => 'f'}]

   @account = accounts.map {|account| Account.create account}
  
      
    @admin = admins.map { |admin| Admin.create! admin } 
    end

 
 describe "GET #index" do
   subject {get :index }
   
   it "redirect_to action: 'new'" do
    get :index
    response.should redirect_to :adminsignup
   end
 end
 
 describe "GET #new" do
   subject {get :new}
   
   it "render new template" do
   expect(subject).to render_template (:new) 
   end
   end
 
  describe "GET #edit" do
    subject { get :edit, id: @admin[1] }
    
    it "assigns the requested admin[1] to @admin" do 
      get :edit, id: @admin[1]
      assigns(:admin).should eq @admin[1]
    end
end

  describe "POST #create" do
    context "with valid attributes" do
      it "create a new admin" do
      expect{ post :create, {:admin => {:email => 'lulu1993@outlook.com', :password => '123456', :password_confirmation => '123456',
  	           :key => '11110318'}}
              }.to change(Admin,:count).by(1) 
      end
      
      it "redirect to log in page after saved" do
      post :create, {:admin => {:email => 'lulu1993@outlook.com', :password => '123456', :password_confirmation => '123456',
  	           :key => '11110318'}}
  	  response.should redirect_to("/adminlogin?id=#{assigns(:admin).id}")
      end
      end
      
    context "with invalid attributes" do
      it "flash with notice" do
      post :create, {:admin => {:email => 'lulu1993@outlook.com'}}
  	  flash[:danger].should =~ /Registration failed, some inforamtion is missing!/i
      end
      
      it "render new template" do
      post :create, {:admin => {:email => 'lulu1993@outlook.com'}}
      expect(subject).to render_template (:new) 
      end
  end
  end
  
  describe "GET #show" do
   
    
    context "admin not logged in" do
    it "redirect to log in page" do
    get :show, id: @admin[1]
    request.session[:id] = 2
    response.should redirect_to :adminlogin
    end
end

  describe "GET #approve" do
    it "approve the applicant" do
    get :approve, id: @account[0]
    @account[0].update(:status => 't', :submit_bcheck => 'f')
    flash[:success].should =~ /Approvement is successful!/i
    response.should redirect_to("/admins/1")
    end
  end
  
  describe "GET #reject" do
    it "reject the applicant" do
    get :reject, id: @account[0]
    @account[0].update(:status => 'f', :submit_bcheck => 'f')
    flash[:success].should =~ /Rejection is successful!/i
    response.should redirect_to("/admins/1")
    end
  end
  
  describe "GET #moreshow" do
    it "redirect to admin log in page" do
    get :show, id: @admin[1]
    request.session[:id] = 2
    response.should redirect_to :adminlogin
    end
  end
    
  end
  end
  
