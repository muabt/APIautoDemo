@2
Feature: Dataset and table
  As user
  I want to interact with dataset and table content

  Background:
    Given I login to EBX succesfully

  @Dataset&Table
  Scenario: Create new data set
    And I access dataspace "FastTrack"
    And I access dataset "Flowers"
    When I create a child of dataset of "Flowers" with credentials as following
      | Unique name | Owner              | Label         |
      |             | Vicky Chan (vicky) | Flowers Child |
    And I access table "Flowers"
    #When I select first "4" records in table
    When I select some records with primary key as following
      | ID |
      | 1  |
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
