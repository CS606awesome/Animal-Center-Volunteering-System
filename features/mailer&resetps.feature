Feature: reset your password
  
  As a user
  I forget my password and want to reset my password
  So that I can reset my password and login my account
  
Background: accounts in database
   Given the following accounts exist:
   |id|email              |firstname|lastname |password|
   |1|lfangshuo@yahoo.com|Megan    |Liu      |123456  |

Scenario: forget your password
  Given I am on the login page 
  And I follow "Forget your password"
  Then I should be on the input_your_email page 
  And I should see "Please input your email"
  And I fill in "email" with "lfangshuo@yahoo.com" 
  When I press "Reset" 
  Then I should be on the reset_your_password page for "lfangshuo@yahoo.com"  

Scenario: reset your password with email
  Given I am on the reset_your_password page for "lfangshuo@yahoo.com" 
  And I fill in "Create new password" with "111111"
  And I fill in "Re-enter new password" with "111111"
  When I press "Continue"
  Then I should be on the login page 
  And I should see "You have reset your password successfully."

 
Scenario: reset your password with a wrong email (sad path)
  Given  I am on the input_your_email page 
  And I fill in "email" with "lfang@yahoo.com"
  When I press "Reset"
  Then I should still be on the input_your_email page
  Then I should see "Your email is not valid or it has not been registered, please try again!"