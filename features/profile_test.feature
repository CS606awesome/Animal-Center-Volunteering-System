Feature: User can edit profiles
  
Background: accounts in database
 
  Given the following accounts exist:
  | firstname    | lastname | email     | homephone | password   | gender  | emergency_contact_name | is_former_worker |
  | Star         | PG       | zy@zy.com | 123123    | 1234567    | male    |                        |                  |
  | Blade        | G        | Rid@g.com | 234234    | 1234567    | female  |                        |                  |
  

    
  Scenario: Fill new profile
    Given I am on the profiles page for "zy@zy.com"
    When  I fill in "Emergency Contact Name" with "zhou"
    And   I press "Save Changes"
    Then  I should see "Changes Saved!"
    And   the emergency_contact_name of "zy@zy.com" should be "zhou"
    When  I check "is_former_worker" with "Yes"
    Then  I should not see "Date of Employment"
    And   I press "Save Changes"
    Then  I should see "Changes Saved!"
    
    