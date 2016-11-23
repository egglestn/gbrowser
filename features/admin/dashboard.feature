Feature: Admin Dashboard
  As a....

Scenario: View the dashboard
  Given I am logged in as an admin
  When I visit the Hoozzi site
  Then I should be on the admin dashboard
