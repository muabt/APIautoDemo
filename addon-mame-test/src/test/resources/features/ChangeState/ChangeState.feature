#Author: onguyent@tibco.com
@SYSTEM_TEST
Feature: Change state

  Background:
    Given I login to EBX successfully

  #Change state for bulk table
  Scenario: SC-CS08 Check results when user changes state to "Golden" with no selection record & there are auto-created records in table
    And I create a child of dataspace "ChangeState" with information as following
      | Identifier  | Owner              | English Label |
      | SC-CS08     | admin admin(admin) |               |
    And I select dataspace service "View or edit datasets"
    And I access table "Change_state" of dataset "Metadatas"
    And I select table service "Match and Merge > Change state"
    When I select target state is Golden
    And I complete change state process
    And I access table "RecordMetadata" of dataset "Metadatas_Change_state_MDS_" in dataspace "ChangeState>SC-CS08"
    Then I will verify the group id of table Recordmetadata as below
      | Group  | functionalId |
      | GROUP1 | 22, 23       |
      | GROUP2 | 2            |
      | GROUP3 | 3            |
      | GROUP4 | 11           |
      | GROUP5 | 12           |
      | GROUP6 | 13           |
      | GROUP7 | 14           |
      | GROUP8 | 15           |
      | GROUP9 | 16           |
      | GROUP10 | 17           |
    And I will verify other data of the table Recordmetadata as below
      | functionalId | state      | autoCreated | isolated |
      | 22           | Deleted    | Yes          |     No     |
      | 23           | Deleted    | Yes          |      No    |
      | 2            | Golden     | No          |      Yes    |
      | 3            | Golden     | No          |      Yes    |
      | 11           | Golden     | No          |      Yes    |
      | 12           | Golden     | No          |      Yes    |
      | 13            | Golden    | No          |      Yes    |
      | 14            | Golden    | No          |      Yes    |
      | 15            | Golden    | No          |       Yes   |
      | 16            | Golden    | No          |       Yes   |
      | 17            | Golden    | No          |      Yes    |
    Then no records found in table "MergingProcess"
    Then no records found in table "MergeResult"
    Then no records found in table "Decision"
    Then no records found in table "MergeValueLineage"
    Then no records found in table "MatchingResult"
    Then no records found in table "MatchingSession"
    And I delete the dataspace

  Scenario: SC-CS09 Check results when user changes state to "<Unset>" with no selection record &  there are no auto-created records in table
    And I create a child of dataspace "ChangeState" with information as following
      | Identifier               | Owner              | English Label |
      | SC-CS09 | admin admin(admin) |               |
    And I select dataspace service "View or edit datasets"
#    And I access table "RecordMetadata" of dataset "Metadatas_Hidden_pk_MDS"
#    Then I will verify the group id of table Recordmetadata as below
#      | Group  | functionalId |
#      | GROUP1 | 1, 2         |
#      | GROUP2 | 3, 4         |
#      | GROUP3 | 5, 6, 7      |
#    And I will verify other data of the table Recordmetadata as below
#      | functionalId | state            | autoCreated | isolated |
#      | 1            | Golden           | No          |          |
#      | 2            | Merged           | No          |          |
#      | 3            | Pending approval | No          |          |
#      | 4            | Pending approval | No          |          |
#      | 5            | Deleted          | No          |          |
#      | 6            |                  | No          |          |
#      | 7            | Unset            | No          |          |
#    Then I will see table MergingProcess as below
#      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
#      | KEY1 |               | Manual    | TODAY         |            | GROUP_ID | admin | No         |
#      | KEY1 |               | Manual    | TODAY         |            | GROUP_ID | admin | Yes        |
#    Then I will see table MergeResult as below
#      | id   | recordId | goldenId | mergingProcessId | isInterpolation |
#      | KEY1 | 2        | 1        | 11               | No              |
##    Then I will see table MergeResult as below
##      | id   | recordId     | goldenId      | mergingProcessId | isInterpolation |
##      | KEY1 | Merge_record | Golden_record | mergingProcessId | No              |
#    Then I will see table Decision as below
#      | id   | sourceId | targetId | lastDecision        | user  | decisionDate | mergingProcessId |
#      | KEY1 | 2        | 1        | Identified as match | admin | decisionDate | mergingProcessId |
##    Then I will see table Decision as below
##      | id   | sourceId     | targetId      | lastDecision        | user  | decisionDate | mergingProcessId |
##      | KEY1 | Merge_record | Golden_record | Identified as match | admin | decisionDate | mergingProcessId |
#    Then no records found in table "MergeValueLineage"
#    Then I will see table MatchingSession as below
#      | id | executionDate | matchingProcessId | matchAgainst | matchAgainstStates | phase |
#      |    |               |                   |              |                    |       |
#    Then I will see table MatchingResult as below
#      | id | sourceId | targetId | lastResult | sessionId |
#      | 32 | 4        | 6        | SUSPECTED  | 0         |
    And I access table "Hidden_pk" of dataset "Metadatas"
    And I select table service "Match and Merge > Change state"
    Then change state screen will be displayed with the title "Please select the target state value of your selected records from below."
    When I select target state is Unset
    And I complete change state process
    And I access table "RecordMetadata" of dataset "Metadatas_Hidden_pk_MDS_" in dataspace "ChangeState>SC-CS09"
    Then no records found in table "RecordMetadata"
    Then no records found in table "MergingProcess"
    Then no records found in table "MergeResult"
    Then no records found in table "Decision"
    Then no records found in table "MergeValueLineage"
    Then no records found in table "MatchingResult"
    Then no records found in table "MatchingSession"
    And I delete the dataspace



