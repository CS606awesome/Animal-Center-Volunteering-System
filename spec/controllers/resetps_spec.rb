require 'spec_helper'
require 'rails_helper'
require "minitest/autorun"

describe AccountsController do
    before :each do
            accounts = [{:email => '670348828@qq.com',
                         :password =>'123456',
                         :firstname => 'Dongni',
                         :lastname => 'Han',
                         :homephone => '979-571-4506',
                         :DOB => '2015-11-13',
                         :cellphone => '979-571-4506'
            }]
            @accounts = accounts.map{|account| Account.create! account}
          end
=begin
   describe 'GET #input_your_email' do
        it 'should find account id by inputting email' do
            get :input_your_email
            assigns(:account).should eq @accounts[1]
        end
      #happy path
        it "should go to check_your_email page" do
            post :input_your_email
            #response.should redirect_to check_your_email_path
            visit check_your_email_path
            flash[:success].should == "Email has been resent, please check it."
       end
      #sad path
        it "should still stay on the input_your_email page" do
            post :input_your_email
            danger = "Your email is not valid or it has not been registered, please try again!"
            #flash[:danger].should == danger
            assert_equal danger, flash[:danger]
     end
 end   
=end
    
       
end