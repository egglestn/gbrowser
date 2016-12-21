Feature: User Login
  As a user
  I want to log into the site

  Scenario:
    Given I am a user
    When I log in as a user
    Then I should be on the user dashboard
