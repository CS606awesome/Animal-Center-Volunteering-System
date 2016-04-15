Feature: Volunteer can sign up and sign into the system

 Scenario: Sign up
    Given I am on the sign up page for "sign up"
    When I fill in "E-mail" with "sabrina@gmail.com"
    And I fill in "password" with "123"
    When I press "Join us now!"
    Then I should see "Registration failed, some inforamtion is missing!"
    When I fill in "E-mail" with "sabrina@gmail.com"
    And I fill in "password" with "123456"
    When I press "Join us now!"
    Then I should on the log in page for "sign up"
    When I fill in "email" with "sabrina@gmail.com"
    And I fill in "Password" with "12345"
    When I press "I am already a volunteer!"
    Then I should see "Wrong email/password combination!"
  
