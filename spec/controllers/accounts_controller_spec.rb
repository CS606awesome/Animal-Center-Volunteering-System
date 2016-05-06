require 'spec_helper'
require 'rails_helper'

describe AccountsController do 
    before :each do
    accounts = [{:firstname => 'Xudong', 
                 :lastname => 'Huang',
  	             :DOB => '1999-01-01', 
  	             :email => 'xudong1@qq.com',
                 :password => '12345678',
                 :homephone => '111-111-1111',
                 :cellphone => '222-222-2222',
                 :gender =>'male'
                }
  	           ]

    @accounts = accounts.map { |account| Account.create! account } 
  end
  
  describe "GET #profiles" do

    
    it "it renders login template" do 
      get :profiles
      expect(subject).should redirect_to login_path
    end
    
    it "goes to profile page" do 
      session[:id] = @accounts[0].id
      get :profiles
      response.body.should == ""
    end
    
    it "get correct profile" do 
      session[:id] = @accounts[0].id
      get :profiles
      assigns(:account).should eq @accounts[0]
    end
  end
  
  describe "GET #application" do 
    it "it renders login template" do 
      get :application
      expect(subject).should redirect_to login_path
    end
    
    it "find correct application account" do 
      session[:id] = @accounts[0].id
      get :application
      assigns(:account).should eq @accounts[0]
    end
  end
  
  describe "GET #viewapplication" do 
    it "it renders login template" do 
      get :viewapplication
      expect(subject).should redirect_to login_path
    end
    
    it "find correct viewapplication account" do 
      session[:id] = @accounts[0].id
      get :viewapplication
      assigns(:account).should eq @accounts[0]
    end
  end  
  
  describe "GET #save_change" do 
    
    it "find account and save" do 
      session[:id] = @accounts[0].id
      get :save_change
      assigns(:account).should eq @accounts[0]
    end
  end
  
  describe "POST #save_and_submit" do 
    
    it "find correct account first" do 
      session[:id] = @accounts[0].id
      post :save_and_submit
      assigns(:account).should eq @accounts[0]
    end
    
    it "profile sent to admin" do 
      session[:id] = @accounts[0].id
      post :save_and_submit
      flash[:success].should == 'Your profile has been sent to the administrator'
    end
    
    it "profile rejected" do 
      session[:id] = @accounts[0].id
      @accounts[0].update_columns(submit_bcheck: true, status: false)
      post :save_and_submit
      flash[:warning].should == 'We are sorry that your profile is rejected, you can not submit again'
    end
    
    it "profile approved" do 
      session[:id] = @accounts[0].id
      @accounts[0].update_columns(submit_bcheck: true, status: true)
      post :save_and_submit
      flash[:success].should == 'You are approved, no need to bother our administrator right? LOL'
    end
    
    it "profile pending" do 
      session[:id] = @accounts[0].id
      @accounts[0].update_columns(submit_bcheck: true)
      post :save_and_submit
      flash[:info] = 'Your profile is under processing!'
    end
  end
  
  # describe " #update" do
    # it "change saved" do 
      # session[:id] = @accounts[0].id
      # put :update
      # flash[:danger].should == 'Changes Saved!'
    # end
  # end
    
end