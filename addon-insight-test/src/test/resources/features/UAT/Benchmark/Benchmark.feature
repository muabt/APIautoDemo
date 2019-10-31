@Benchmark
Feature: Run Match feature
  As user
  I want to use this Run Match to know the duplicate record in the table.

  Background:
    Given I login to EBX successfully

  Scenario: Run Match
    And I permit to access matching table
    When I select "MAME_Configuration_RunMatch.ebx" file to import
    And I create a child of dataspace "Master Data - Reference" with information as following
      | Identifier     | Owner               | English Label |
      | childDataspace | admin admin (admin) |               |
    And I access table "Person" of dataset "genealogyForRunMatch" in dataspace "Master Data - Reference > childDataspace"
    Then the Run Match service is executed with the information as belows
      | Matching process | Records to match against |
      | SESSION          | Entire table             |
    And I delete some MAME config records with primary key as following
      | Data model                        | Table  |
      | Publication: genealogyForRunMatch | Person |
    And I delete the dataspace

  Scenario: Manual Merge
    And I permit to access matching table
    When I select "MAME_Configuration_ManualMerge.ebx" file to import
    And I create a child of dataspace "Master Data - Reference" with information as following
      | Identifier     | Owner               | English Label |
      | childDataspace | admin admin (admin) |               |
    And I access table "Person" of dataset "genealogy" in dataspace "Master Data - Reference > childDataspace"
    And I select first "2" records in table
    And I select table service "Match and Merge > Merge"
    And I delete some MAME config records with primary key as following
      | Data model                        | Table  |
      | Publication: genealogyForRunMatch | Person |
    And I delete the dataspace

