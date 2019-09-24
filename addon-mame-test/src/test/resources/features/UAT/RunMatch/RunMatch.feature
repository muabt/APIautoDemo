@Run_Match
Feature: Run Match feature
  As user
  I want to use this Run Match to know the duplicate record in the table.

  Background: 
    Given I login to EBX successfully

  Scenario: UAT-RM-01 Run Match with MAME configuration with MatchingTable and Matching Policy Active.
    Given I permit to access matching table
    And I select last record in table
    Then delete it
    And I create record with the followings
      | Data model:DDL         | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: genealogy | Person    | Yes          |                              |                  |                    |                       |
    And I select matching policy record of table "Person"
    And the matching process is configured as the followings
      | Matching process code | Matching table | Active | Matching execution on creation | Matching execution on update | Merge policy | Advanced settings |
      | RANDOM                |                | Yes     | Inline matching                | Inline matching              |              |                   |
    #And I create a child of dataspace "Master Data - Reference" with information as following
      #| Identifier     | Owner               | English Label |
      #| childDataspace | admin admin (admin) |               |
    And I access table "Person" of dataset "genealogy" in dataspace "Master Data - Reference > childDataspace"
    When I select table service "Match and Merge > Run match"
    Then I should see Run Match with information as following
      | Matching process | Records to match against |
      | SESSION          | Entire table             |
    When I click on Run Match button
    And I permit to access matching table
    And I select last record in table
    Then delete it
    And I delete the dataspace