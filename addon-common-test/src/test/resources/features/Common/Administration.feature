@PRE-TESTING
Feature: Administration workspace
  As user
  I want to use all service of Administration workspace

  Background:
    Given I login to EBX succesfully

  Scenario: Delete the dataspace in administration workspace1
    Given I want to create matching table



  Scenario: Run Match with MAME configuration with MatchingTable and Matching Policy Active.
    And I access "administration" menu
    And I access to "Match and Merge configuration" parent item
    And I access to "Matching table" item
    And I create record with the followings
      | Data model:DDL         | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: genealogy | Person    | Yes          |                              |                  |                    |                       |
    And I select first "1" records in table