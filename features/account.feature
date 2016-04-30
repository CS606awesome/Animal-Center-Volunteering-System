Feature: Volunteer can sign up and sign into the system

 Scenario: Sign up and sign in 
    Given I am on the sign up page for "sign up"
    When I fill in "E-mail" with "sabrina@gmail.com"
    And I fill in "Pass-word" with "123"
    When I press "Join Us Now!"
    Then I should see "Registration failed, some information is missing!"
    When I fill in "E-mail" with "sabrina@gmail.com"
    And I fill in "Pass-word" with "123456"
    And I fill in "MM-DD-YYYY" with "03-14-1993"
    And I fill in "Homephone" with "860-899-9350"
    And I fill in "Cellphone" with "860-899-9350"
    When I press "Join Us Now!"
    Then I should on the log in page for "sign up"
    When I fill in "Email" with "sabrina@gmail.com"
    And I fill in "Password" with "12345"
    When I press "Sign In"
    Then I should see "Wrong email/password combination!"
  
