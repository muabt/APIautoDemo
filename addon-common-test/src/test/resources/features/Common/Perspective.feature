@PRE-TESTING
Feature: Perspective
  As user
  I want to access to perspective action

  Background: 
    Given I login to EBX succesfully

  Scenario: Select perspective
    Given I permission to access perspective with name "GDPR Art. 17: Right to be forgotten"
    And I want to access action "Compliance > Supervisory authorities"
    Then I create a new record with credentials and PK is "Identifier"
      | Identifier | Name        |
      | MAX        | Noodle soup |
