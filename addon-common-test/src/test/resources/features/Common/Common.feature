@STORE
Feature: Create new data model
  As user
  I want to create new Store data set

  Background: 
    Given I login to EBX succesfully

  @Dataspace
  Scenario: Create new data space
    And I access "Dataspaces" menu
    And I access dataspace "Master Data - Reference>[03] Parties data>Company employees>Store"
    And I create child Dataspace with information as following
      | Identifier | Owner              | English Label |
      | Store      | John Smith (admin) | Store         |
    Then I should see Dataspace with information as following
      | Identifier | Type      | Creation | Status | Owner              | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
      | Store      | Dataspace |          | Open   | John Smith (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
    And I select dataspace service "Merge dataspace"

  @Dataset&Table
  Scenario: Create new data set
    When I access "dataset" menu
    And I access dataspace "Master Data - Reference>[03] Parties data>Company employees"
    And I access dataset "Chart-API"
    And I access table "Data type"
    When I select first "4" records in table
    When I select some records as following
      | Identifier | Owner              | English Label |
      | Store      | John Smith (admin) | Store         |
    And I select table service "Merge dataspace"
    When I create a child of dataset of "Flowers" with credentials as following
      | Unique name | Owner              | Label         |
      |             | Vicky Chan (vicky) | Flowers Child |
    And I access dataset "Chart-API"
    And I want to delete dataset "Flowers-Child"

  Scenario: Select perspective
    Given I permission to access perspective with name "GDPR Art. 17: Right to be forgotten"
    And I want to access action "Compliance > Supervisory authorities"
    Then I create a new record with credentials and PK is "Identifier"
      | Identifier | Name        |
      | MAX        | Noodle soup |

  Scenario: Duplicate dataset
    Given I access dataspace "FastTrack"
    When I want to duplicate a dataset from dataset "Flowers"
      | Unique name        | Owner              | Label         |
      | Flowers-Duplicated | Vicky Chan (vicky) | Flowers Child |

  Scenario: Create new record in exist table
    Given I access dataspace "FastTrack>[03] Parties data>Company employees"
    And I access dataset "Company employees"
    And I access table "Persons"
    And I create record with the followings
      | Identifer:TXT | Civil status:DDL | First name:TXT | Last name:TXT | Maiden name:TXT | Birth date:DATE | Gender:RADIO | Marital status:DDL | GDPR type:DDL |
      |               | Dr.              | Jenifer        | Pham          |                 | 7/29/1988       | Female       | (C) Single         | Child         |
