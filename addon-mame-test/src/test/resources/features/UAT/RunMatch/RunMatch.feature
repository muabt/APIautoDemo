@Run_Match
Feature: Run Match feature
  As user
  I want to use this Run Match to know the duplicate record in the table.

  Background: 
    Given I login to EBX successfully

  Scenario: Run Match with MAME configuration with MatchingTable and Matching Policy Active.
    Given I want to create matching table
    And I create record with the followings
      | Data model:DDL         | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: genealogy | Person    | Yes          |                              |                  |                    |                       |
    And I want to access the Matching record of table "Person"
    And I access to "Matching process" tab
    And I want to delete all of record in the table
    
