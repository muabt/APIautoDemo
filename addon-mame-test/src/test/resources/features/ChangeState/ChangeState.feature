#Author: onguyent@tibco.com
@SYSTEM
Feature: As a datasteward
  I want to launch the Change state service
  so I set state value of records to a specific state & reset the list of suspect.

  Background: 
    Given I login to EBX successfully

  #Change state for bulk table
  Scenario Outline: SC-CS08 Check results when user changes state to "Golden" with no selection record & there are auto-created records in table
    When I access "Dataspaces" menu
    And I access dataspace "ChangeState"
    And I create child Dataspace with information as following
      | Identifier | Owner              | English Label |
      | $ID$       | admin admin(admin) |               |
    Then I should see Dataspace with information as following
      | Identifier | Type      | Creation | Status | Owner               | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
      |            | Dataspace |          | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
    And I select dataspace service "View or edit datasets"
    And I access metadata set "Metadatas_Change_state_MDS"
    And I access table as following "<KEY>"
      | KEY | Table             |
      |  01 | RecordMetadata    |
      |  02 | MatchingResult    |
      |  03 | MergeResult       |
      |  04 | Decision          |
      |  05 | MergeValueLineage |
      |  06 | MergeValueLineage |
    Then I want to verify default metadatas of RecordMetadata table as following "<KEY>"
      | KEY | id  | groupId               | state            | autoCreated | functionalId |
      |  01 |  92 | 1,602,893,970,142,208 | Pending approval | No          |            2 |
      |  01 |  93 | 1,602,893,970,142,208 | Pending approval | No          |            3 |
      |  01 |  94 |                       | Deleted          | Yes         |           16 |
      |  01 |  95 | 1,602,894,007,854,080 | Merged           | No          |           11 |
      |  01 |  96 | 1,602,894,007,854,080 | Merged           | No          |           12 |
      |  01 |  97 | 1,602,894,011,879,424 | Golden           | Yes         |           17 |
      |  01 |  98 | 1,602,895,161,896,960 | Golden           | No          |           13 |
      |  01 |  99 |                       | Unset            | No          |           14 |
      |  01 | 100 |                       | Unset            | No          |           15 |
      |  01 | 347 | 1,603,177,938,232,320 | Golden           | No          |           18 |
      |  01 | 350 | 1,603,178,266,835,968 | Deleted          | No          |           19 |
    And I want to verify default metadatas of MatchingResult table as following "<KEY>"
      | KEY | id | sourceId | targetId | lastResult | matchingProcessId | executionDate       |
      |  02 | 30 |       98 |       99 | Suspect    |                 1 | 08/09/2019 12:09:46 |
      |  02 | 31 |       98 |      100 | Suspect    |                 1 | 08/09/2019 12:09:58 |
    And I want to verify default metadatas of MergeResult table as following "<KEY>"
      | KEY | id | recordId | goldenId | matchingProcessId | isInterpolation |
      |  03 | 96 |       97 |        8 |                   |                 |
      |  03 | 95 |       97 |        8 |                   |                 |
    And I want to verify default metadatas of Decision table as following "<KEY>"
      | KEY | id | sourceId | targetId | lastDecision        | user  | decisionDate        | mergingProcessId |
      |  04 | 26 |       96 |       97 | Identified as match | admin | 08/09/2019 11:49:39 |                8 |
      |  04 | 27 |       95 |       97 | Identified as match | admin | 08/09/2019 11:49:39 |                8 |
    And I want to verify default metadatas of MergeValueLineage table as following "<KEY>"
      | KEY | id | mergingProcessId | recordId | sourceIndex | fieldPath | goldenIdex |
      |  05 | 13 |                8 |       95 |             | /PK       |            |
      |  05 | 14 |                8 |       96 |             | /Name     |            |
    And I want to verify default metadatas of MergingProcess table as following "<KEY>"
      | KEY | id | mergePolicyId | mergeMode | executionDate       | snapshotId                  | groupId               | user  | isUnmerged |
      |  06 |  7 |           155 | Manual    | 08/09/2019 11:49:03 | VBChangeState_1565326142717 | 1,602,893,970,142,208 | admin | Yes        |
      |  06 |  8 |           155 | Manual    | 08/09/2019 11:49:03 | VBChangeState_1565326142717 | 1,602,893,970,142,208 | admin | No         |
    When I access dataset "Metadatas"
    And I access table "Change_state"
    And I select table service "Match and Merge > Change state"
    Then I should see the Change state screen
    When I select "Golden" target state
    And I click "Launch service" button
    Then Ican execute the change state operation successfully and should back to the table view screen
    When I access metadata set "Metadatas_Change_state_MDS"
    And I access table as following "<KEY>"
      | KEY | Table             |
      |  01 | RecordMetadata    |
      |  02 | MatchingResult    |
      |  03 | MergeResult       |
      |  04 | Decision          |
      |  05 | MergeValueLineage |
      |  06 | MergeValueLineage |
    Then I want to verify default metadatas of RecordMetadata table as following "<KEY>"
      | KEY | id  | groupId               | state            | autoCreated | functionalId |
      |  01 |  92 | 1,602,893,970,142,208 | Pending approval | No          |            2 |
      |  01 |  93 | 1,602,893,970,142,208 | Pending approval | No          |            3 |
      |  01 |  94 |                       | Deleted          | Yes         |           16 |
      |  01 |  95 | 1,602,894,007,854,080 | Merged           | No          |           11 |
      |  01 |  96 | 1,602,894,007,854,080 | Merged           | No          |           12 |
      |  01 |  97 | 1,602,894,011,879,424 | Golden           | Yes         |           17 |
      |  01 |  98 | 1,602,895,161,896,960 | Golden           | No          |           13 |
      |  01 |  99 |                       | Unset            | No          |           14 |
      |  01 | 100 |                       | Unset            | No          |           15 |
      |  01 | 347 | 1,603,177,938,232,320 | Golden           | No          |           18 |
      |  01 | 350 | 1,603,178,266,835,968 | Deleted          | No          |           19 |
    And I want to verify metadatas of MatchingResult table as following "<KEY>"
      | KEY | id | sourceId | targetId | lastResult | matchingProcessId | executionDate  |
      
    And I want to verify metadatas of MergeResult table as following "<KEY>"
      | KEY | id | recordId | goldenId | matchingProcessId | isInterpolation |
      
    And I want to verify metadatas of Decision table as following "<KEY>"
      | KEY | id | sourceId | targetId | lastDecision | user  | decisionDate | mergingProcessId |
      
    And I want to verify metadatas of MergeValueLineage table as following "<KEY>"
      | KEY | id | mergingProcessId | recordId | sourceIndex | fieldPath | goldenIdex |
     
    And I want to verify metadatas of MergingProcess table as following "<KEY>"
      | KEY | id | mergePolicyId | mergeMode | executionDate       | snapshotId  | groupId  | user  | isUnmerged |
      

    Examples: 
      | KEY |
      |  01 |
