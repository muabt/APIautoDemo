@PRE-TESTING
Feature: Create new data space
  As user
  I want to create new dataspace

  Background:
    Given I login to EBX succesfully

  Scenario: Create new data space
    When I create a child of dataspace "Master Data - Reference>ManualMerge" with information as following
      | Identifier | Owner                | English Label |
      | MM06       | admin admin (admin)| Store         |
    Then I should see dataspace with information as following
      | Identifier | Type      | Status | Owner           | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
      | MM06      | Dataspace | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
    And I select dataspace service "Close this dataspace"
