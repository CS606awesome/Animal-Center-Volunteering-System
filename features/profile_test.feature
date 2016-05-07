Feature: User can edit profiles
  
Background: accounts in database
 
  Given the following accounts exist:
  | firstname    | lastname | email     | homephone | cellphone |password   | gender  | emergency_contact_name | is_former_worker | DOB|
  | Star         | PG       | zy@zy.com | 650-285-9769   |123-456-7890| 1234567    | male    |                        |                  |1992-03-21|
  | Blade        | G        | Rid@g.com | 650-283-9484    |098-765-4321| 1234567    | female  |                        |                  |1990-04-03|
  

    
  Scenario: Fill new profile
    Given I am on the sign up page for "sign up"
    When I fill in "E-mail" with "zy@zy.com" 
    And I fill in "Password" with "1234567" 
    When I press "Join Us Now!" 
    Then I should on the log in page for "sign up"
    When I fill in "Email" with "zy@zy.com"
    And I fill in "Password" with "1234567"
    When I press "Sign In"
    Then I should on the profiles page for "zy@zy.com"
    When  I fill in "Emergency Contact Name" with "zhou"
    And   I press "Save Changes"
    Then  I should see "Changes Saved!"
    #And   the emergency_contact_name of "zy@zy.com" should be "zhou"
    #When  I check "is_former_worker" with "Yes"
    #Then  I should not see "Date of Employment"
    #And   I press "Save Changes"
    #Then  I should see "Changes Saved!"
    
    