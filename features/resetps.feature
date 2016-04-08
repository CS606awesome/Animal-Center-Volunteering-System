Feature: reset your password
  
  As a user
  I forget my password and want to reset my password
  So that I can reset my password and login my account
  
Background: accounts in database
   Given the following accounts exist:
   |email         |firstname|middlename   |lastname |password_digest|current_address|homephone  |DOB     |cellphone|
   |423523@qwe.com|xudong   |laoxian      |huang    |123457777      |baker street   |4543656345 |2000-1-1|54356565 |

Scenario: forget your password
  Given I am on the login page 
  And I click "Forget your password"
  Then I should be on the input_your_email page 
  And I should see "Please input your email"
  And I fill in "email" with "423523@qwe.com" 
  When I press "Reset" 
  Then I should be on the reset_your_password page 
  
Scenario: reset your password with email
  Given I am on the reset_your_password page for "423523@qwe.com"
  And I fill in "create new password"
  And I fill in "Re-enter new password"
  When I press "Continue"
  Then I should be on the login page 
  Then I should see "You have reset your password successfully."
  
Scenario: reset your password with a wrong email (sad path)
  Given  I am on the input_your_email page 
  And I fill in "email" with "42352@qwe.com"
  When I press "Reset"
  Then I should still be on the input_your_email page
  Then I should see "Your email is not valid or it has not been registered, please try again!"
  
  
  
  
  
  
  