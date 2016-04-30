Feature: Administrator can manage the vonlunteering system
  
 Given the following vonlunteers exist:
  | firstname  | lastname | gender   | email               | DOB        |
  | Sasa       | Wang     | female   | sa123@gmail.com     | 1999-09-19 |
  | Blade      | Liu      | male     | blade099@hotmail.com| 1982-06-25 |
  | Alien      | Watt     | male     | alien@123.com       | 1992-05-25 |
  | Lulu       | Mi       | female   | lulu1993@outlook.com| 1995-03-11 |

 Scenario: manage the vonlunteering system
    Given I am on the admin login page for "login"
    When I fill in "email" with "wyf1111@gmail.com"
    And I fill in "password" with "123456"
    And I fill in "the magic key" with "123456"
    When I press "Join Us Now!"
    Then I should on the admin login page for "login"
    When I fill in "E-mail" with "wyf1111@gmail.com"
    And I fill in "Password" with "12345"
    And I fill in "The Magic Key" with "12345"
    When I press "Sign In"
    Then I should see "Your are not in admin table"
    Then I should on the admin login page for "login"
    When I fill in "E-mail" with "wyf1111@gmail.com"
    And I fill in "Password" with "123456"
    And I fill in "The Magic Key" with "123456"
    When I press "Sign In"
    Then I should on the admin manage page for "wyf1111@gmail.com"
    Then I should see "Welcome Administrator!"
    When I fill in "Older Than" with "23"
    And I fill in "Younger Than" with "26"
    And I fill in "First Name" with "sasa"
    And I fill in "Last Name" with "wang"
    And I fill in "Email" with "sa123"
    When I press "Select"
    Then I should see the following table:
    | firstname  | lastname | gender   | email               | DOB        |
    | Sasa       | Wang     | female   | sa123@gmail.com     | 1999-09-19 |