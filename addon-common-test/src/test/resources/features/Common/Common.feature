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
    And I access "administration" menu
    And I access to administration service "Dataspaces"
    And I access table "Dataspaces/snapshots" service
    And I select filter by text with keyword and field below
      | Field contains: | In fields |
      | Store           |           |
    And I delete the dataspace "Dataspace Store (Store)" with service "Delete dataspaces and snapshots recursively"

  @Dataset&Table
  Scenario: Create new data set
    And I access dataspace "FastTrack"
    When I create a child of dataset of "Flowers" with credentials as following
      | Unique name | Owner              | Label         |
      |             | Vicky Chan (vicky) | Flowers Child |
    And I access table "Flowers"
    When I select first "4" records in table
    #When I select some records as following
    #| Identifier | Owner              | English Label |
    #| Store      | John Smith (admin) | Store         |
    And I select table service "View history"
    And I want to delete dataset

  Scenario: Duplicate dataset
    Given I access dataspace "FastTrack"
    And I access dataset "Flowers"
    When I want to duplicate a dataset from dataset followings
      | Unique name        | Owner              | Label              |
      | Flowers-Duplicated | Vicky Chan (vicky) | Flowers Duplicated |
    And I want to delete dataset

  Scenario: Create new record in exist table
    Given I access dataspace "FastTrack>[03] Parties data>Company employees"
    And I access dataset "Company employees"
    And I access table "Persons"
    And I create record with the followings
      | Identifer:TXT | Civil status:DDL | First name:TXT | Last name:TXT | Maiden name:TXT | Birth date:DATE | Gender:RADIO | Marital status:DDL | GDPR type:DDL |
      |               | Dr.              | Jenifer        | Pham          |                 | 7/29/1988       | Female       | (C) Single         | Child         |
    
  Scenario: Select perspective
    Given I permission to access perspective with name "GDPR Art. 17: Right to be forgotten"
    And I want to access action "Compliance > Supervisory authorities"
    Then I create a new record with credentials and PK is "Identifier"
      | Identifier | Name        |
      | MAX        | Noodle soup |
