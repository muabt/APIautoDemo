@Run_Match
Feature: Run Match feature
  As user
  I want to use this Run Match to know the duplicate record in the table.

  Background: 
    Given I login to EBX successfully
  Scenario: Run Match with MAME configuration with MatchingTable and Matching Policy Active.
     Given I permit to access matching table
    And I create record with the followings
      | Data model:DDL         | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: genealogy | Person    | Yes          |                              |                  |                    |                       |
    And I select matching policy record of table "Person"
    And some configurations like belows
      | Matching process code | Matching table | Active | Matching execution on creation | Matching execution on update | Merge policy | Advanced settings |
      | RANDOM                |                | Yes     | Inline matching                | Inline matching              |              |                   |
    When I create new Merge policy as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Auto create new golden | Used for manual merge | Apply permission on merge view |
      | RANDOM            | Most trusted source            | Longest                | Disabled               | Yes                   | Yes                            |
    And I create a child of dataspace "Master Data - Reference" with information as following
      | Identifier     | Owner               | English Label |
      | childDataspace | admin admin (admin) |               |
    And I access table "Person" of dataset "genealogy" in dataspace "Master Data - Reference > childDataspace"
    And I select table service "Match and Merge > Run match"  
    And I permit to access matching table
    And I select last record in table
    Then delete it
    And I delete the dataspace
