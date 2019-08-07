@STORE
Feature: Create new data model
  As user
  I want to create new Store data set

  Background: 
    Given I login to EBX succesfully

  @Dataspace
  Scenario: Create new data space
    And I access "dataspace" menu
    And I access dataspace "FastTrack>[03] Parties data>Company employees"
    And I create child Dataspace with information as following
      | Identifier | Owner              | English Label |
      | Store      | John Smith (admin) | Store         |
    Then I should see Dataspace with information as following
      | Identifier | Type      | Creation | Status | Owner              | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
      | Store      | Dataspace |          | Open   | John Smith (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
    And I close dataspace with service "Close this dataspace"
