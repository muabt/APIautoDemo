#Author: onguyent@tibco.com
@SYSTEM_TEST
Feature: Change state

  Background: 
    Given I login to EBX successfully

  #Change state for bulk table
#  Scenario: SC-CS08 Check results when user changes state to "Golden" with no selection record & there are auto-created records in table
#    And I create a child of dataspace "ChangeState" with information as following
#      | Identifier | Owner              | English Label |
#      |            | admin admin(admin) |               |
#    Then I should see dataspace with information as following
#      | Identifier | Type      | Creation | Status | Owner               | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
#      |            | Dataspace |          | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
#    And I select dataspace service "View or edit datasets"
#    And I access table "Change_state" of dataset "Metadatas"
#    #And I access table "Categories" of dataset "Store Item"
#    And I select table service "Match and Merge > Change state"
#    Then Change state screen will be displayed
#    When I select target state
#    And I complete change state process
#    And I access table "RecordMetadata" of dataset "Metadatas_Change_state_MDS_" in dataspace ""
#    Then I will see table RecordMetadata as below
#      | id | groupId  | state  | autoCreated | functionalId |isolated|
#      |    | GROUP_ID | Golden | No          | 14          |     Yes   |
#    Then I will see table MergingProcess as below
#      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
#      | KEY1 | 15            | Manual    | executionDate |            | GROUP_ID | admin | No         |
#    Then I will see table MergeResult as below
#      | id   | recordId     | goldenId      | mergingProcessId | isInterpolation |
#      | KEY1 | Merge_record | Golden_record | mergingProcessId | No              |
#    Then I will see table Decision as below
#      | id   | sourceId     | targetId      | lastDecision        | user  | decisionDate | mergingProcessId |
#      | KEY1 | Merge_record | Golden_record | Identified as match | admin | decisionDate | mergingProcessId |
#    Then I will see table MergeValueLineage as below
#      | id   | mergingProcessId | recordId      | sourceIndex | fieldPath | goldenIndex |   |
#      | KEY1 | mergingProcessId | Golden_record | 0           | admin     | /email      | 0 |
#
#    And I delete the dataspace

  Scenario: SC-CS09 Check results when user changes state to "<Unset>"  with no selection record &  there are no auto-created records in table
    And I create a child of dataspace "ChangeState" with information as following
      | Identifier | Owner              | English Label |
      |            | admin admin(admin) |               |
    Then I should see dataspace with information as following
      | Identifier | Type      | Creation | Status | Owner               | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
      |            | Dataspace |          | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
    And I select dataspace service "View or edit datasets"
#    And I access table "RecordMetadata" of dataset "Metadatas_Hidden_pk_MDS"
#    Then I will see table RecordMetadata as below
#      | id | groupId  | state            | autoCreated | functionalId |isolated|
#      |    | GROUP_ID | Golden           | No          | 1            |        |
#      |    | GROUP_ID | Merged           | No          | 2            |        |
#      |    | GROUP_ID | Pending approval | No          | 3            |        |
#      |    | GROUP_ID | Pending approval | No          | 4            |        |
#      |    |          | Deleted          | No          | 5            |        |
#      |    |          |                  | No          | 6            |        |
#      |    |          | Unset            | No          | 7            |        |
#    Then I will see table MergingProcess as below
#      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
#      | KEY1 |               | Manual    | executionDate |            | GROUP_ID | admin | No         |
#      | KEY2 |               | Manual    | executionDate |            | GROUP_ID | admin | Yes         |
#    Then I will see table MergeResult as below
#      | id   | recordId     | goldenId      | mergingProcessId | isInterpolation |
#      | KEY1 | Merge_record | Golden_record | mergingProcessId |               |
#    Then I will see table Decision as below
#      | id   | sourceId     | targetId      | lastDecision        | user  | decisionDate | mergingProcessId |
#      | KEY1 | Merge_record | Golden_record | Identified as match | admin | decisionDate | mergingProcessId |
#    Then I will see table MergeValueLineage as below
    And I access table "Hidden_pk" of dataset "Metadatas"
    And I select table service "Match and Merge > Change state"
    Then Change state screen will be displayed
    When I select target state
    And I complete change state process
#    And I access table "RecordMetadata" of dataset "Metadatas_Hidden_pk_MDS"
#    Then I will see table RecordMetadata as below
#      | id | groupId  | state            | autoCreated | functionalId |isolated|
#      |    | GROUP_ID | Golden           | No          | 1          |        |
#      |    | GROUP_ID | Merged           | No          | 2          |        |
#      |    | GROUP_ID | Pending approval | No          | 3          |        |
#      |    | GROUP_ID | Pending approval | No          | 4          |        |
#      |    | GROUP_ID | Deleted          | No          | 5          |        |
#      |    | GROUP_ID |                  | No          | 6          |        |
#      |    | GROUP_ID | Unset             | No          | 7         |        |
#    Then I will see table MergingProcess as below
#      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
#
#    Then I will see table MergeResult as below
#      | id   | recordId     | goldenId      | mergingProcessId | isInterpolation |
#    Then I will see table Decision as below
#      | id   | sourceId     | targetId      | lastDecision        | user  | decisionDate | mergingProcessId |
#    Then I will see table MergeValueLineage as below
#      | id   | mergingProcessId | recordId      | sourceIndex | fieldPath | goldenIndex |   |
    And I delete the dataspace



