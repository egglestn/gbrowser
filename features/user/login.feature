Feature: User Login
  As a user
  I want to log into the site

  Scenario:
    Given I am a user
    When I log in as a user
    Then I should be on the user home page

  Scenario: Log out
    Given I am logged in as a user
    When I log out as a user
    Then I should be on the user home page
