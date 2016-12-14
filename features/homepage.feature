Feature: Homepage
  As an unauthenticated user
  I want to visit the website

  Scenario: Visit Homepage
    When I visit the site
    Then I should be on the guest homepage
