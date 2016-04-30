Feature: reset your password
  
  As a user
  I forget my password and want to reset my password
  So that I can reset my password and login my account
  
Background: accounts in database
   Given the following accounts exist:
   |id|email              |firstname|lastname |password|homephone |
   |10 |670348828@qq.com   |Dongni   |Han      |123456  |9795714506|

Scenario: forget your password
  Given I am on the login page 
  And I follow "Forget Your Password"
  Then I should be on the input_your_email page 
  And I should see "Please Input Your Email"
  And I fill in "Email" with "670348828@qq.com" 
  When I press "Reset" 
  Then I should be on the check_your_email page  

#Scenario: reset your password with email
#  Given I am on the reset_your_password page for "670348828@qq.com" 
#  And I type "654321" in "Create New Password"
#  And I type "654321" in "Re-enter New Password"
#  When I press "Continue"
#  Then I should be on the login page 
  

 
Scenario: reset your password with a wrong email (sad path)
  Given  I am on the input_your_email page 
  And I fill in "email" with "670348827@qq.com"
  When I press "Reset"
  Then I should still be on the input_your_email page
  Then I should see "Your email is not valid or it has not been registered, please try again!"