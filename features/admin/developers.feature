Feature: Developers
  As a....

  Scenario: Create and delete developer
    Given I am logged in as an admin
    When I create a developer
    Then I should see the created developer
    When I update the developer
    Then I should see the updated developer
    When I delete the developer
    Then I should not see the deleted developer

