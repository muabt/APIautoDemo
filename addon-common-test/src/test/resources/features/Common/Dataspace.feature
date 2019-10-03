@PRE-TESTING
Feature: Create new data space
  As user
  I want to create new dataspace

  Background:
    Given I login to EBX successfully

  Scenario: Create new data space
    When I create a child of dataspace "Master Data - Reference" with information as following
      | Identifier | Owner               | English Label |
      | Duplicate  | admin admin (admin) | Duplicate     |
#    Then I should see dataspace with information as following
#      | Identifier | Type      | Status | Owner               | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
#      | Duplicate  | Dataspace | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
#    And I select dataspace service "Close this dataspace"
    And I delete the dataspace
