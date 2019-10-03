@PRE-TESTING
Feature: Filter with all types
  I want to use Filter on EBX

  Background:
    Given I login to EBX successfully

  Scenario: Filter by text search
    Given I access dataspace "FastTrack"
    And I access dataset "Burger"
    And I access table "Products"
    When I select filter by text with keyword and field below
      | Field contains: | In fields             |
      | Big Mac         | ID, Name, Description |
    Then I should see the total search results "1 - 6 of 6"
    And I logout successfully

  Scenario: Filter by validation search
    Given I access dataspace "FastTrack>[03] Parties data>Company employees"
    And I access dataset "Company employees"
    And I access table "Employees"
    When I select filter by validation with keyword and field below
      | Message contains: | Severity         |
      | start with 'a'    | Errors, Warnings |

  Scenario: Filter by fuzzy search
    Given I access dataspace "FastTrack>[03] Parties data>Company employees"
    And I access dataset "Company employees"
    And I access table "Employees"
    When I select filter by fuzzy search with keyword and field below
      | Record contains: | Fields        |
      | Joanne Light     | Email, Person |
    Then I should see the total search results "1 - 1 of 1"

  Scenario: Filter by fuzzy search
    Given I access dataspace "FastTrack>[03] Parties data>Company employees"
    And I access dataset "Company employees"
    And I access table "Employees"
    When I select filter by fuzzy search with keyword and field below
      | Record contains: | Fields        |
      |                  | Email, Person |
    Then I should see the popup with error message "Unable to search the empty string"

  Scenario: Filter by simple search
    Given I access dataspace "FastTrack>[03] Parties data>Company employees"
    And I access dataset "Company employees"
    And I access table "Employees"
    When I select filter by simple search with criterion
      | Criterion     | Operation  | Value                            | Field type |
      | Identifier    | =          | 23                               | INPUT      |
      | Person        |            | Aaron Eaton, Abraham Dance       | ENUM       |
      | Email         | startsWith | a                                | INPUT      |
      | Hiring date   | is equal   | 3/3/2003                         | DATE       |
      | Hiring reason |            | (01) New position, (13) Transfer | ENUM       |
      | Manager       |            | Yes, No                          | BOOLEAN    |

  Scenario: Filter by advanced search
    Given I access dataspace "Master Data - Reference>referenceChild"
    And I access dataset "Stores"
    And I access table "Stores"
    When I select filter by advanced search with criterion and logical "All criteria match"
      | Criterion  | Operation | Value       | Field type |
      | Name       | contains  | Cook        | INPUT      |
    And I add a logical block with criterion and logical "At least one criterion matches"
      | Criterion  | Operation    | Value | Field type |
      | Name       | contains     | Cook  | INPUT      |
      | City       | is not empty |       | BOOLEAN    |
    Then I click to button Apply in Advanced search

  Scenario: Filter by advanced search and select logical block
    Given I access dataspace "FastTrack>[03] Parties data>Company employees"
    And I access dataset "Company employees"
    And I access table "Employees"
    When I select filter by advanced search with logical block
      | Logical                        | Criterion  | Operation | Value                      | Field type |
      | At least one criterion matches | Identifier | =         | 23                         | INPUT      |
      | Not all criteria match         | Person     |           | Aaron Eaton, Abraham Dance | ENUM       |
