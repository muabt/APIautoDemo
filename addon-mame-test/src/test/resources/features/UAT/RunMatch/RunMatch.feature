@UAT
#MAME Test Design: https://docs.google.com/spreadsheets/d/1r_xok0EpPQXFJr23HEAfsY0fW3usrg06wuJ_e6V-Ai8/edit#gid=1172924389
#@Run_Match
Feature: Run Match feature
  As user
  I want to use this Run Match to know the duplicate record in the table.

  Background:
    Given I login to EBX successfully

  Scenario: UAT-RM01 Run Match with MAME configuration with MatchingTable and Matching Policy Active = true and Without Decision Tree.
    Given I permit to access matching table
    And I create record with PK "Publication: Genealogy" is "Person" and the content followings
      | Data model:DDL         | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: genealogy | Person    | Yes          |                              |                  |                    |                       |
    And I select matching table record of table "Person"
    And the matching process is configured as the followings
      | Matching process code | Matching table | Active | Matching execution on creation | Matching execution on update | Merge policy | Keep not matched records untouched | Merged record is recycled | Modify merged without match |
      | RANDOM                |                | Yes    | Inline matching                | Inline matching              |              | Yes                                | Yes                       | Yes                         |
    And I create a child of dataspace "Master Data - Reference" with information as following
      | Identifier     | Owner               | English Label |
      | childDataspace | admin admin (admin) |               |
    And I access table "Person" of dataset "genealogy" in dataspace "Master Data - Reference > childDataspace"
    Then the Run Match service is executed with the information as belows
      | Matching process | Records to match against |
      | SESSION          | Entire table             |
    Then the popup message should be shown "The decision tree has not been configured properly. Please check your configuration."
    When I delete some MAME config records with primary key as following
      | Data model             | Table  |
      | Publication: Genealogy | Person |
    And I delete the dataspace

  Scenario: UAT-RM02 Run Match with MAME configuration with MatchingTable and Matching Policy Active = No.
    Given I permit to access matching table
    And I create record with PK "Publication: Genealogy" is "Person" and the content followings
      | Data model:DDL         | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: genealogy | Person    | Yes          |                              |                  |                    |                       |
    And I select matching table record of table "Person"
    And the matching process is configured as the followings
      | Matching process code | Matching table | Active | Matching execution on creation | Matching execution on update | Merge policy | Keep not matched records untouched | Merged record is recycled | Modify merged without match |
      | RANDOM                |                | No     | Inline matching                | Inline matching              |              | Yes                                | Yes                       | Yes                         |
    And I create a child of dataspace "Master Data - Reference" with information as following
      | Identifier     | Owner               | English Label |
      | childDataspace | admin admin (admin) |               |
    And I access table "Person" of dataset "genealogy" in dataspace "Master Data - Reference > childDataspace"
    When I select table service "Match and Merge > Run match"
    Then the popup message should be shown "The run match service can't be executed: No matching process is actived. Please check your configuration."
    When I delete some MAME config records with primary key as following
      | Data model             | Table  |
      | Publication: Genealogy | Person |
    And I delete the dataspace

#  Scenario: UAT-RM03 Run Match with Import MAME_Configuration.ebx file with configure MatchingTable, Matching Policy Active = Yes and Decision Tree.
#    And I permit to access matching table
#    When I select "MAME_Configuration.ebx" file to import
#    And I create a child of dataspace "Master Data - Reference" with information as following
#      | Identifier     | Owner               | English Label |
#      | childDataspace | admin admin (admin) |               |
#    And I access table "Person" of dataset "genealogy" in dataspace "Master Data - Reference > childDataspace"
#    Then the Run Match service is executed with the information as belows
#      | Matching process | Records to match against |
#      | SESSION          | Entire table             |
#    And I access table "RecordMetadata" of dataset "genealogy_person_MDS" in dataspace "Master Data - Reference > childDataspace"
#    Then I will verify the group id of table Recordmetadata as below
#      | Group  | functionalId |
#      | GROUP1 | 10           |
#      | GROUP2 | 9            |
#      | GROUP3 | 8            |
#      | GROUP4 | 7            |
#      | GROUP5 | 6            |
#      | GROUP6 | 5            |
#      | GROUP7 | 4            |
#      | GROUP8 | 3            |
#      | GROUP9 | 2, 1         |
#    And I will verify other data of the table Recordmetadata as below
#      | functionalId | state  | autoCreated | isolated |
#      | 10           | Golden | No          | Yes      |
#      | 9            | Golden | No          | Yes      |
#      | 8            | Golden | No          | Yes      |
#      | 7            | Golden | No          | Yes      |
#      | 6            | Golden | No          | Yes      |
#      | 5            | Golden | No          | Yes      |
#      | 4            | Golden | No          | Yes      |
#      | 3            | Golden | No          | Yes      |
#      | 2            | Unset  | No          | No       |
#      | 1            | Unset  | No          | No       |
#    Then I will see table MatchingSession as below
#      | id | executionDate | matchingProcessId | matchAgainst | matchAgainstStates | phase         |
#      | ID | DATE          |                   | ENTIRE_TABLE |                    | DEDUPLICATION |
#    Then I will see table MatchingResult as below
#      | id   | sourceId | targetId | lastResult  | sessionId |
#      | 1~2~ | 1        | 2        | MATCHED     | SESSIONID |
#      | 10~~ | 10       |          | NOT_MATCHED | SESSIONID |
#      | 2~~  | 2        |          | MATCHED     | SESSIONID |
#      | 3~4~ | 3        | 4        | SUSPECTED   | SESSIONID |
#      | 4~~  | 4        |          | SUSPECTED   | SESSIONID |
#      | 5~6~ | 5        | 6        | SUSPECTED   | SESSIONID |
#      | 6~~  | 6        |          | SUSPECTED   | SESSIONID |
#      | 7~~  | 7        |          | NOT_MATCHED | SESSIONID |
#      | 8~~  | 8        |          | NOT_MATCHED | SESSIONID |
#      | 9~~  | 9        |          | NOT_MATCHED | SESSIONID |
#    When I delete some MAME config records with primary key as following
#      | Data model             | Table  |
#      | Publication: Genealogy | Person |
#    And I delete the dataspace

  Scenario: UAT-RM04 Run Match with Import MAME_Configuration_Inline.ebx file with configure MatchingTable, Matching Policy Active = Yes and Decision Tree.
    And I permit to access matching table
    When I select "MAME_Configuration_Inline.ebx" file to import
    And I create a child of dataspace "Master Data - Reference" with information as following
      | Identifier     | Owner               | English Label |
      | childDataspace | admin admin (admin) |               |
    And I access table "Person" of dataset "genealogy" in dataspace "Master Data - Reference > childDataspace"
    Then the Run Match service is executed with the information as belows
      | Matching process | Records to match against |
      | SESSION          | Entire table             |
    And I access table "RecordMetadata" of dataset "genealogy_person_MDS" in dataspace "Master Data - Reference > childDataspace"
    Then I will verify the group id of table Recordmetadata as below
      | Group  | functionalId |
      | GROUP1 | 10           |
      | GROUP2 | 9            |
      | GROUP3 | 8            |
      | GROUP4 | 7            |
      | GROUP5 | 6            |
      | GROUP6 | 5            |
      | GROUP7 | 4            |
      | GROUP8 | 3            |
      | GROUP9 | 2, 1         |
    And I will verify other data of the table Recordmetadata as below
      | functionalId | state  | autoCreated | isolated |
      | 10           | Golden | No          | Yes      |
      | 9            | Golden | No          | Yes      |
      | 8            | Golden | No          | Yes      |
      | 7            | Golden | No          | Yes      |
      | 6            | Golden | No          | Yes      |
      | 5            | Golden | No          | Yes      |
      | 4            | Golden | No          | Yes      |
      | 3            | Golden | No          | Yes      |
      | 2            | Unset  | No          | No       |
      | 1            | Unset  | No          | No       |
    Then I will see table MatchingSession as below
      | id | executionDate | matchingProcessId | matchAgainst | matchAgainstStates | phase         |
      | ID | DATE          |                   | ENTIRE_TABLE |                    | DEDUPLICATION |
    Then I will see table MatchingResult as below
      | id   | sourceId | targetId | lastResult  | sessionId |
      | 1~2~ | 1        | 2        | MATCHED     | SESSIONID |
      | 10~~ | 10       |          | NOT_MATCHED | SESSIONID |
      | 2~~  | 2        |          | MATCHED     | SESSIONID |
      | 3~4~ | 3        | 4        | SUSPECTED   | SESSIONID |
      | 4~~  | 4        |          | SUSPECTED   | SESSIONID |
      | 5~6~ | 5        | 6        | SUSPECTED   | SESSIONID |
      | 6~~  | 6        |          | SUSPECTED   | SESSIONID |
      | 7~~  | 7        |          | NOT_MATCHED | SESSIONID |
      | 8~~  | 8        |          | NOT_MATCHED | SESSIONID |
      | 9~~  | 9        |          | NOT_MATCHED | SESSIONID |
    When I delete some MAME config records with primary key as following
      | Data model             | Table  |
      | Publication: Genealogy | Person |
    And I delete the dataspace

  Scenario: UAT-RM05 Run Match(Active selection) with Import MAME_Configuration.ebx file with configure MatchingTable, Matching Policy Active = Yes and Decision Tree.
    And I permit to access matching table
    When I select "MAME_Configuration_Inline.ebx" file to import
    And I create a child of dataspace "Master Data - Reference" with information as following
      | Identifier     | Owner               | English Label |
      | childDataspace | admin admin (admin) |               |
    And I access table "Person" of dataset "genealogy" in dataspace "Master Data - Reference > childDataspace"
    Then the Run Match service is executed with the information as belows
      | Matching process | Records to match against |
      | SESSION          | Active selection         |
# Sample to verify Matching metadata. Should verify MatchingSession table first
    And I access table "RecordMetadata" of dataset "genealogy_person_MDS" in dataspace "Master Data - Reference > childDataspace"
    Then I will see table MatchingSession as below
      | id | executionDate | matchingProcessId | matchAgainst     | matchAgainstStates | phase         |
      | ID | DATE          |                   | ACTIVE_SELECTION |                    | DEDUPLICATION |
#    Then I will see table MatchingResult as below
#      | id    | sourceId | targetId | lastResult  | sessionId |
#      | 1*1~~ | 1*1      |          | NOT_MATCHED | SESSIONID |
#      | 2*2~~ | 2*2      |          | NOT_MATCHED | SESSIONID |
#      | 3*3~~ | 3*3      |          | NOT_MATCHED | SESSIONID |
#      | 4*4~~ | 4*4      |          | NOT_MATCHED | SESSIONID |
    Then I will see table MatchingResult as below
      | id   | sourceId | targetId | lastResult  | sessionId |
      | 1~2~ | 1        | 2        | NOT_MATCHED | SESSIONID |
      | 10~~ | 10       |          | NOT_MATCHED | SESSIONID |
      | 2~~  | 2        |          | NOT_MATCHED | SESSIONID |
      | 3~4~ | 3        | 4        | MATCHED     | SESSIONID |
      | 4~~  | 4        |          | NOT_MATCHED | SESSIONID |
      | 5~6~ | 5        | 6        | NOT_MATCHED | SESSIONID |
      | 6~~  | 6        |          | NOT_MATCHED | SESSIONID |
      | 7~~  | 7        |          | NOT_MATCHED | SESSIONID |
      | 8~~  | 8        |          | MATCHED     | SESSIONID |
      | 9~~  | 9        |          | MATCHED     | SESSIONID |
    When I delete some MAME config records with primary key as following
      | Data model             | Table  |
      | Publication: Genealogy | Person |
    And I delete the dataspace

  Scenario: UAT-RM06 Run Match with Import MAME_Configuration.ebx file with configure MatchingTable, Matching Process - Advanced Setting.
    And I permit to access matching table
    When I select "MAME_Configuration_Inline.ebx" file to import
    And I select matching table record of table "Person"
    Then I select matching process record with label "MPC1" in "Matching process" tab
    And the matching process is updated as the followings
      | Matching process code | Active | Matching execution on creation | Matching execution on update | Merge policy | Keep not matched records untouched | Merged record is recycled | Modify merged without match |
      | MPC1                  | Yes    | Inline matching                | Inline matching              |              | Yes                                | Yes                       | Yes                         |
    And I create a child of dataspace "Master Data - Reference" with information as following
      | Identifier     | Owner               | English Label |
      | childDataspace | admin admin (admin) |               |
    And I access table "Person" of dataset "genealogy" in dataspace "Master Data - Reference > childDataspace"
    Then the Run Match service is executed with the information as belows
      | Matching process | Records to match against |
      | SESSION          | Active selection         |
    When I complete Run Match process
    When I delete some MAME config records with primary key as following
      | Data model             | Table  |
      | Publication: Genealogy | Person |
    And I delete the dataspace

  Scenario: UAT-RM07 Run Match with Import MAME_Configuration.ebx file with configure MatchingTable, Matching Process - Both null values Won't match.
    And I permit to access matching table
    When I select "MAME_Configuration_Inline.ebx" file to import
    And I select matching table record of table "Person"
    Then I select matching process record with label "MPC1" in "Matching process" tab
    And I select matching field record with label "Residence" in "Matching fields" tab
    And the matching field is updated as the followings
      | Field | Both values are null | One of the values is null |
      |       | Won't match          | Won't match               |
    And I create a child of dataspace "Master Data - Reference" with information as following
      | Identifier     | Owner               | English Label |
      | childDataspace | admin admin (admin) |               |
    And I access table "Person" of dataset "genealogy" in dataspace "Master Data - Reference > childDataspace"
    Then the Run Match service is executed with the information as belows
      | Matching process | Records to match against |
      | SESSION          | Entire table             |
    When I complete Run Match process
    When I delete some MAME config records with primary key as following
      | Data model             | Table  |
      | Publication: Genealogy | Person |
    And I delete the dataspace
