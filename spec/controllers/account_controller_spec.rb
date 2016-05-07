require 'spec_helper'

RSpec.describe AccountsController, :type => :controller do
    before :each do
    accounts = [{:gender => 'female', :email => 'fnesvt@outlook.com', :password => '12345678', :password_confirmation => '12345678',
    :firstname => 'Sasa', :lastname => 'Dai',:middlename => 'lulu', :country => 'United States',
:state => 'TX',:city => 'College Station',:street => '950 Colgate Drive',:zip => '77840',:homephone => '8608999350',
:cellphone => '860-899-9350',:DOB => '1999-09-19',:is_former_worker => 'f', :is_current_worker => 'f', :emergency_contact_name => '',
                                  :emergency_phone => '',:emergency_phone_alternate => '',:related_to_councilmember => 'f',
                                  :has_convictions => 'f', :need_accommodations => 'f'}]
  
    @account = accounts.map {|account| Account.create account}
  	           
  end
  
  
  describe "GET #index" do
   subject {get :index }
   
   it "redirect_to action: 'new'" do
    get :index
    response.should redirect_to :signup
   end
 end
 
 describe "GET #new" do
   subject {get :new}
   
   it "render new template" do
   expect(subject).to render_template (:new) 
   end
   end
 
  describe "GET #edit" do
    subject { get :edit, id: @account[0] }
    
    it "assigns the requested account[0] to @account" do 
      get :edit, id: @account[0]
      assigns(:account).should eq @account[0]
    end
end

  describe "POST #create" do
    context "with valid attributes" do
      it "create a new account" do
      expect{ post :create, {:account => {:gender => 'female', :email => 'wzhsld@outlook.com', :password => '12345678', :password_confirmation => '12345678',
    :firstname => 'Sasa', :lastname => 'Dai',:middlename => 'lulu', :country => 'United States',
:state => 'TX',:city => 'College Station',:street => '950 Colgate Drive',:zip => '77840',:homephone => '8608999350',
:cellphone => '860-899-9350',:DOB => '1999-09-19'}}
              }.to change(Account,:count).by(1) 
      end
      
      it "redirect to log in page after saved" do
      post :create, {:account => {:email => 'wzhsld@outlook.com', :firstname => 'Sasa', :lastname => 'Dai',:DOB => '1999-09-19',
:password => '123456', :password_confirmation => '123456', :middlename => 'lulu',:country => 'United States',
:state => 'TX',:city => 'College Station',:street => '950 Colgate Drive',:zip => '77840',:homephone => '8608999350',
:cellphone => '860-899-9350'}}
  	  response.status.should be 302
      end
      end
      
    context "with invalid attributes" do
      it "flash with notice" do
      post :create, {:account => {:email => 'wzhsld@outlook.com',:cellphone => '860-899-9350', :homephone => '8608999350'}}
  	  flash[:danger].should =~ /Registration failed, some information is missing!/i
      end
      
      it "render new template" do
      post :create, {:account => {:email => 'wzhsld@outlook.com', :cellphone => '860-899-9350', :homephone => '8608999350'}}
      expect(subject).to render_template (:new) 
      end
  end
  end
end