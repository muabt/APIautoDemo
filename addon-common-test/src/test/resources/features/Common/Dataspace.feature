@PRE-TESTING
Feature: Create new data space
  As user
  I want to create new dataspace

  Background: 
    Given I login to EBX succesfully

  Scenario: Create new data space
    And I access "dataspace" menu
    And I access dataspace "FastTrack>[03] Parties data>Company employees"

    When I create a child of dataspace "FastTrack>[03] Parties data>Company employees" with information as following
      | Identifier | Owner              | English Label |
      |            | John Smith (admin) | Store         |

    And I create child Dataspace with information as following
      | Identifier | Owner              | English Label |
      |            | John Smith (admin) | Store         |
    Then I should see Dataspace with information as following
      | Identifier | Type      | Creation | Status | Owner              | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
      | Store      | Dataspace |          | Open   | John Smith (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
    And I close dataspace with service "Close this dataspace"
