Feature: Filter with all types
  I want to use Filter on EBX

  Background: 
    Given I login to EBX succesfully

  Scenario: Filter by text search
    Given I access dataspace "FastTrack"
    And I access dataset "Burger"
    And I access table "Products"
    When I select filter by text with keyword and field below
      | Field contains: | In fields             |
      | Big Mac         | ID, Name, Description |
    Then I should see the total search results "1 - 6 of 6"

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

  #Scenario: Filter by fuzzy search
  #Given I access dataspace "FastTrack>[03] Parties data>Company employees"
  #And I access dataset "Company employees"
  #And I access table "Employees"
  #When I select filter by fuzzy search with keyword and field below
  #| Record contains: | Fields        |
  #|                  | Email, Person |
  #Then I should see empty search keyword error message
  Scenario: Filter by simple search
    Given I access dataspace "FastTrack>[03] Parties data>Company employees"
    And I access dataset "Company employees"
    And I access table "Employees"
    When I select filter by simple search with criterion
      | Criterion     | Operation  | Value                            | Field type |
      | Identifier    | =          |                               23 | IN         |
      | Person        |            | Aaron Eaton, Abraham Dance       | ENUM       |
      | Email         | startsWith | a                                | OPIN       |
      | Hiring date   | is equal   | 3/3/2003                         | DATE       |
      | Hiring reason |            | (01) New position, (13) Transfer | ENUM       |
      | Manager       |            | Yes, No                          | BOO        |
