Feature: General

  Scenario: UAT-00 General all configurations
    Given I permit to access matching table
    And I create record with PK "Publication: Genealogy" is "Person" and the content followings
      | Data model:DDL         | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: Genealogy | Person    | Yes          |                              | First name       |                    |                       |
    And I select matching table record of table "Person"
    And the matching process is configured as the followings
      | Matching process code | Matching table | Active | Matching execution on creation | Matching execution on update | Merge policy | Advanced settings |
      | RANDOM                |                | No     | Inline matching                | Inline matching              |              |                   |
    When I set Merge policy configuration as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Mode     | Used for manual merge | Apply permission on merge view |
      | RANDOM            | Most trusted source            | Longest                | Disabled | Yes                   | Yes                            |
    And I create Survivorship field with selections as followings
      | Survivorship field code | Field     | Merge function      | Condition for field value survivorship | Execute only if empty |
      | RANDOM                  | Last name | Most trusted source |                                        | Yes                   |
    And the Source in Trusted source are
      | Name of source | Description     |
      | Pieter         | In Person table |
    And the Table trusted source with the followings
      | Matching table | Trusted source list |
      | Person         | Pieter              |
    And the Field trusted source with the followings
      | Matching table | Field     | Trusted source list |
      | Person         | Last name | Pieter              |
    And I create a child of dataspace "Master Data - Reference" with information as following
      | Identifier     | Owner               | English Label |
      | referenceChild | admin admin (admin) |               |
    And I access table "Person" of dataset "genealogy" in dataspace "Master Data - Reference > referenceChild"
    When I select first "2" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | Id                                       | First name   | Last name     | Gender | Residence | Age   | Birth date     | Birth place          |
      | 0157a930-7725-41d0-b1c4-281b794d38aa {H} | Huibregt     | Heijboer      | {H}    | {H}       | 0 {H} | 10/21/1847 {H} | Poortvliet           |
      | 06127a07-3d23-4fb1-bd55-f5044873b0f1     | Cornelia {H} | Wagemaker {H} |        |           | 0     | 10/28/1922     | Sint Philipsland {H} |
    And preview table is displayed as below
      | Id                                   | First name | Last name | Gender | Residence | Age | Birth date | Birth place      |
      | 00000435-cc4c-4a1c-9fe4-7690f559bc1c | Cornelia   | Wagemaker |        |           | 0   | 10/21/1847 | Sint Philipsland |
    And I complete merging process
    And I access table "RecordMetadata" of dataset "Human_Resource_NewEmployee_MDS" in dataspace "Master Data - Reference>Reference-child>Reference-child_child1"
    Then I will see table RecordMetadata as below
      | groupId  | state  | autoCreated | functionalId                         |
      | GROUP_ID | Golden | No          | 0157a930-7725-41d0-b1c4-281b794d38aa |
      | GROUP_ID | Merged | No          | 06127a07-3d23-4fb1-bd55-f5044873b0f1 |
    Then I will see table MergeResult as below
      | id   | recordId     | goldenId      | mergingProcessId | isInterpolation |
      | KEY1 | Merge_record | Golden_record | mergingProcessId | No              |
    Then I will see table Decision as below
      | id   | sourceId     | targetId      | lastDecision        | user  | decisionDate | mergingProcessId |
      | KEY1 | Merge_record | Golden_record | Identified as match | admin | decisionDate | mergingProcessId |
    Then I will see table MergeValueLineage as below
      | id | mergingProcessId | recordId | sourceIndex | fieldPath | goldenIndex |  |
      |    |                  |          |             |           |             |  |
    Then I will see table MergingProcess as below
      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
      | KEY1 | 15            | Manual    | executionDate |            | GROUP_ID | admin | no         |
    And I permit to access matching table
    When I delete some MAME config records with primary key as following
      | Data model             | Table    |
      | Publication: Genealogy | Person   |
      | Publication: Metadatas | Customer |
    And I delete the "referenceChild" dataspace

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
    Then I will see table MatchingResult as below
      | id    | sourceId | targetId | lastResult  | sessionId |
      | 1*1~~ | 1*1      |          | NOT_MATCHED | SESSIONID |
      | 2*2~~ | 2*2      |          | NOT_MATCHED | SESSIONID |
      | 3*3~~ | 3*3      |          | NOT_MATCHED | SESSIONID |
      | 4*4~~ | 4*4      |          | NOT_MATCHED | SESSIONID |
    When I delete some MAME config records with primary key as following
      | Data model             | Table  |
      | Publication: Genealogy | Person |
    And I delete the dataspace

    When I select some records are filtered with primary key as following
      | Data model                        | Table  |
      | Publication: genealogyForRunMatch | Person |