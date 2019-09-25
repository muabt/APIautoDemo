#Author: onguyent@tibco.com
@SYSTEM
Feature: Run Metadatas service


  Background: 
    Given I login to EBX successfully

   Scenario: SC-MTD013 Check the correctness of displayed data after launching the Metadata service
             SC-MTD007 Check the correctness of information which displays in Main tab when lauching metadata on a record which is Golden and auto-created is No

    And I create a child of dataspace "Reference-child" with information as following
      | Identifier | Owner              | English Label |
      |            | admin admin(admin) |               |
    Then I should see dataspace with information as following
      | Identifier | Type      | Creation | Status | Owner               | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
      |            | Dataspace |          | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
    And I select dataspace service "View or edit datasets"
    And I access dataset "Store Item"
    And I access table "Categories"
    When I select some records with primary key as following
      | Identifier |
      |          1 |
    And I select table service "Match and Merge > Metadatas"
    Then I should list tabs are "Main,Execution log"
    When I want to verify data displayed in main tab
      | Record    | State  | Group     |
      | Fast food | Golden | Fast food |
    Then I should see detailed record as following
      | Identifier | Parent    | Name      | Comment             |
      |          1 | Fast food | Fast food | There is no commemt |
    When I want to come back metadata screen
    When I want to see group of record
    Then I should see manage group of table "Fast food"
    And I should see Duplicates table as following
      | State  | Identifier | Parent    | Name | Comment     | Text                 |
      | Golden |          1 | Fast food |      | Fast food   | There is no commemt  |
      | Merged |          2 | Fast food |      | Fast food 1 | There is no commemt1 |
    And I should see the Suspects table as following
      | State | Identifier | Parent | Name | Comment | Text |
