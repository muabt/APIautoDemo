#Author: onguyent@tibco.com
@SYSTEM_TEST
Feature: Change state

  Background:
    Given I login to EBX successfully

  #Change state for bulk table
  Scenario: SC-CS08 Check results when user changes state to "Golden" with no selection record & there are auto-created records in table
    And I create a child of dataspace "ChangeState" with information as following
      | Identifier | Owner              | English Label |
      | SC-CS08    | admin admin(admin) |               |
    And I select dataspace service "View or edit datasets"
    And I access table "Change_state" of dataset "Metadatas"
    And I select table service "Match and Merge > Change state"
    When I select target state is Golden
    And I complete change state process
    And I access table "RecordMetadata" of dataset "Metadatas_Change_state_MDS_" in dataspace "ChangeState>SC-CS08"
    Then I will verify the group id of table Recordmetadata as below
      | Group   | functionalId |
      | GROUP1  | 22           |
      | GROUP2  | 2            |
      | GROUP3  | 3            |
      | GROUP4  | 11           |
      | GROUP5  | 12           |
      | GROUP6  | 13           |
      | GROUP7  | 14           |
      | GROUP8  | 15           |
      | GROUP9  | 16           |
      | GROUP10 | 17           |
      | GROUP11 | 23           |
    And I will verify other data of the table Recordmetadata as below
      | functionalId | state  | autoCreated | isolated |
      | 22           | Golden | No          | Yes      |
      | 23           | Golden | No          | Yes      |
      | 2            | Golden | No          | Yes      |
      | 3            | Golden | No          | Yes      |
      | 11           | Golden | No          | Yes      |
      | 12           | Golden | No          | Yes      |
      | 13           | Golden | No          | Yes      |
      | 14           | Golden | No          | Yes      |
      | 15           | Golden | No          | Yes      |
      | 16           | Golden | No          | Yes      |
      | 17           | Golden | No          | Yes      |
    Then no records found in table "MergingProcess"
    Then no records found in table "MergeResult"
    Then no records found in table "Decision"
    Then no records found in table "MergeValueLineage"
    Then no records found in table "MatchingResult"
    Then no records found in table "MatchingSession"
    And I delete the dataspace

  Scenario: SC-CS09 Check results when user changes state to "<Unset>" with no selection record &  there are auto-created records in table
    And I create a child of dataspace "ChangeState" with information as following
      | Identifier | Owner              | English Label |
      | SC-CS09    | admin admin(admin) |               |
    And I select dataspace service "View or edit datasets"
    And I access table "Hidden_pk" of dataset "Metadatas"
    And I select table service "Match and Merge > Change state"
    Then change state screen will be displayed with the title "Please select the target state value of your selected records from below."
    When I select target state is Unset
    And I complete change state process
    And I access dataspace "ChangeState>SC-CS09"
    Then the "Metadatas_Hidden_pk_MDS" dataset is not created under this dataspaces
    And I delete the dataspace

  Scenario: SC-CS12 Check results when user changes state to "<Unset>" with selecting all records in the table
  & This table has no metadatas dataset
    And I create a child of dataspace "ChangeState" with information as following
      | Identifier | Owner              | English Label |
      | SC-CS12    | admin admin(admin) |               |
    And I select dataspace service "View or edit datasets"
    And I access table "Special_table" of dataset "Metadatas"
    And I select table service "Match and Merge > Change state"
    When I select target state is Unset
    And I complete change state process
    And I access dataspace "ChangeState>SC-CS12"
    Then the "Metadatas_Special_table_MDS" dataset is not created under this dataspaces
    And I delete the dataspace

  Scenario: SC-CS13 Check results when user changes state to "Golden" with no selecting records in the table
  & This table has no metadatas dataset
    And I create a child of dataspace "ChangeState" with information as following
      | Identifier | Owner              | English Label |
      | SC-CS13    | admin admin(admin) |               |
    And I select dataspace service "View or edit datasets"
    And I access table "Special_table" of dataset "Metadatas"
    And I select table service "Match and Merge > Change state"
    When I select target state is Golden
    And I complete change state process
    And I access table "RecordMetadata" of dataset "Metadatas_Special_table_MDS" in dataspace "ChangeState>SC-CS13"
    Then I will verify the group id of table Recordmetadata as below
      | Group  | functionalId |
      | GROUP1 | 1            |
      | GROUP2 | 2            |
      | GROUP3 | 3            |
      | GROUP3 | 4            |
      | GROUP3 | 5            |
      | GROUP3 | 6            |
      | GROUP3 | 7            |
      | GROUP3 | 8            |
      | GROUP3 | 9            |
      | GROUP3 | 10           |
      | GROUP4 | 11           |
      | GROUP5 | 12           |
      | GROUP6 | 13           |
      | GROUP7 | 14           |
      | GROUP8 | 15           |
      | GROUP9 | 16           |
    And I will verify other data of the table Recordmetadata as below
      | functionalId | state  | autoCreated | isolated |
      | 1            | Golden | No          | Yes      |
      | 2            | Golden | No          | Yes      |
      | 3            | Golden | No          | Yes      |
      | 4            | Golden | No          | Yes      |
      | 5            | Golden | No          | Yes      |
      | 6            | Golden | No          | Yes      |
      | 7            | Golden | No          | Yes      |
      | 8            | Golden | No          | Yes      |
      | 9            | Golden | No          | Yes      |
      | 10           | Golden | No          | Yes      |
      | 11           | Golden | No          | Yes      |
      | 12           | Golden | No          | Yes      |
      | 13           | Golden | No          | Yes      |
      | 14           | Golden | No          | Yes      |
      | 15           | Golden | No          | Yes      |
      | 16           | Golden | No          | Yes      |
    Then no records found in table "MergingProcess"
    Then no records found in table "MergeResult"
    Then no records found in table "Decision"
    Then no records found in table "MergeValueLineage"
    Then no records found in table "MatchingResult"
    Then no records found in table "MatchingSession"

    And I delete the dataspace

  Scenario: SC-CS14 Check results when user changes state to "Golden" with selecting all records of a group
  & there are auto-created records in table
#    And I create a child of dataspace "ChangeState" with information as following
#      | Identifier | Owner              | English Label |
#      | SC-CS14    | admin admin(admin) |               |
#    And I select dataspace service "View or edit datasets"
#    And I access table "RecordMetadata" of dataset "Metadatas_Manual_merge_view_MDS"
#    Then I will see table RecordMetadata before changing as below
#      | id   | groupId  | state            | autoCreated | functionalId | isolated |
#      | KEY1 | GROUP_ID | Merged           | No          | 1*2*3*4      |          |
#      | KEY2 | GROUP_ID | Pending approval | No          | 1*2*3*5      |          |
#      | KEY3 | GROUP_ID | Unset            | No          | 1*5*3*5      |          |
#      | KEY4 |          | Golden           | Yes         | 3*1*3*9      |          |
#    Then I will see table MergingProcess before changing as below
#      | id | mergePolicyId | mergeMode | executionDate       | snapshotId                  | groupId               | user  | isUnmerged |
#      | 14 |               | Manual    | 08/09/2019 14:40:14 | VBChangeState_1565336414113 | 1,602,904,488,051,712 | admin | No         |
#      | 15 |               | Manual    | 08/09/2019 15:01:31 | VBChangeState_1565337691735 | 1,602,905,796,336,640 | admin | Yes        |
#    Then I will see table MergeResult with filter
#      | id | recordId | goldenId | mergingProcessId | isInterpolation |
#      | 28 | 1*2*3*4  | 1*2*3*5   | 14               | No              |
#    And I access table "Manual_merge_view" of dataset "Metadatas"
#    And I select some records with primary key as following
#      | pk1 | pk2 | ID | pk3 |
#      | 1   | 2   | 3  | 4   |
#      | 1   | 2   | 3  | 5   |
#      | 1   | 5   | 3  | 5   |
#      | 3   | 1   | 3  | 9   |
#    And I select table service "Match and Merge > Change state"
#    When I select target state is Golden
#    And I complete change state process
    And I access table "RecordMetadata" of dataset "Metadatas_Manual_merge_view_MDS" in dataspace "ChangeState>SC-CS14"
#    Then I will see table RecordMetadata after changing as below
#      | id   | groupId  | state   | autoCreated | functionalId | isolated |
#      | KEY1 | GROUP_ID | Golden  | No          | 1*2*3*4      | No       |
#      | KEY2 | GROUP_ID | Golden  | No          | 1*2*3*5      | No       |
#      | KEY3 | GROUP_ID | Golden  | No          | 1*5*3*5      | No       |
#      | KEY4 |          | Deleted | Yes         | 3*1*3*9      | No       |
#    Then I will see table MergingProcess after changing as below
#      | id | mergePolicyId | mergeMode | executionDate       | snapshotId                  | groupId               | user  | isUnmerged |
#      | 14 |               | Manual    | 08/09/2019 14:40:14 | VBChangeState_1565336414113 | 1,602,904,488,051,712 | admin | No         |
#      | 15 |               | Manual    | 08/09/2019 15:01:31 | VBChangeState_1565337691735 | 1,602,905,796,336,640 | admin | Yes        |
    Then no records found in table "MergeResult" with filter
      | recordId | goldenId |
      | 1*2*3*4  | 1*2*3*4  |
      | 1*2*3*5  | 1*2*3*5  |
      | 1*5*3*5  | 1*5*3*5  |
      | 3*1*3*9  | 3*1*3*9  |
 #   And I delete the dataspace

#  Scenario: SC-CS15 Check results when user changes state to "<Unset>" with selecting all records of a group
#  & there are auto-created records in table
#    And I create a child of dataspace "ChangeState" with information as following
#      | Identifier | Owner              | English Label |
#      | SC-CS15    | admin admin(admin) |               |
#    And I select dataspace service "View or edit datasets"
#    And I access table "Manual_merge_view" of dataset "Metadatas"
#    And I select some records with primary key as following
#      | pk1 | pk2 | ID | pk3 |
#      | 1   | 2   | 3  | 4   |
#      | 1   | 2   | 3  | 5   |
#      | 1   | 5   | 3  | 5   |
#      | 3   | 1   | 3  | 9   |
#    And I select table service "Match and Merge > Change state"
#    When I select target state is Unset
#    And I complete change state process
#    And I access table "RecordMetadata" of dataset "Metadatas_Manual_merge_view_MDS_" in dataspace "ChangeState>SC-CS15"
#    Then I will verify the group id of table Recordmetadata as below
#      | Group  | functionalId |
#      | GROUP1 |              |
#      | GROUP2 |              |
#    And I will verify other data of the table Recordmetadata as below
#      | functionalId | state   | autoCreated | isolated |
#      |              |         | No          | Yes      |
#      |              |         | No          | Yes      |
#      |              |         | No          | Yes      |
#      |              | Deleted | Yes         | Yes      |
#      |              |         | No          | Yes      |
#      |              | Golden  | No          | Yes      |
#    Then no records found in table "MergingProcess"
#    Then I will see table MergingProcess as below
#      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
#      | KEY1 |               | Manual    | TODAY         |            | GROUP_ID | admin | No         |
#      | KEY1 |               | Manual    | TODAY         |            | GROUP_ID | admin | Yes        |
#    Then no records found in table "MergeResult"
#    Then no records found in table "Decision"
#    Then no records found in table "MergeValueLineage"
#    Then no records found in table "MatchingResult"
#    Then no records found in table "MatchingSession"
#    And I delete the dataspace
#
#  Scenario: SC-CS16 Check results when user changes state to "Golden'" with selecting all records that are in a group and one record is not apart of a group
#  & there are auto-created records in table
#    And I create a child of dataspace "ChangeState" with information as following
#      | Identifier | Owner              | English Label |
#      | SC-CS16    | admin admin(admin) |               |
#    And I select dataspace service "View or edit datasets"
#    And I access table "Manual_merge_view" of dataset "Metadatas"
#    And I select some records with primary key as following
#      | pk1 | pk2 | ID | pk3 |
#      | 1   | 2   | 3  | 4   |
#      | 1   | 2   | 3  | 5   |
#      | 1   | 5   | 3  | 5   |
#      | 3   | 1   | 3  | 9   |
#      | 4   | 4   | 4  | 8   |
#    And I select table service "Match and Merge > Change state"
#    When I select target state is Golden
#    And I complete change state process
#    And I access table "RecordMetadata" of dataset "Metadatas_Manual_merge_view_MDS_" in dataspace "ChangeState>SC-CS16"
#    Then I will verify the group id of table Recordmetadata as below
#    Then I will verify the group id of table Recordmetadata as below
#      | Group  | functionalId    |
#      | GROUP1 | 1*2*3*4         |
#      | GROUP2 | 1*2*3*5         |
#      | GROUP3 | 1*5*3*5         |
#      | GROUP4 | 3*1*3*9,4*4*4*8 |
#      | GROUP5 | 9*8*7*5         |
#    And I will verify other data of the table Recordmetadata as below
#      | functionalId | state   | autoCreated | isolated |
#      | 1*2*3*4      | Golden  | No          | No       |
#      | 1*2*3*5      | Golden  | No          | No       |
#      | 1*5*3*5      | Golden  | No          | No       |
#      | 3*1*3*9      | Deleted | Yes         | No       |
#      | 4*5*3*5      |         | No          |          |
#      | 4*5*3*5      | Golden  | No          |          |
#    Then I will see table MergingProcess as below
#      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
#      | KEY1 |               | Manual    | TODAY         |            | GROUP_ID | admin | No         |
#      | KEY1 |               | Manual    | TODAY         |            | GROUP_ID | admin | Yes        |
#    Then no records found in table "MergeResult"
#    Then no records found in table "Decision"
#    Then no records found in table "MergeValueLineage"
#    Then no records found in table "MatchingResult"
#    Then no records found in table "MatchingSession"
#    And I delete the dataspace
#
#  Scenario: SC-CS18 Check results when change state of record to "Golden", selecting record already has metadatas & state = null & there is only this record in the group
#    And I create a child of dataspace "ChangeState" with information as following
#      | Identifier               | Owner              | English Label |
#      | SC-CS18                  | admin admin(admin) |               |
#    And I select dataspace service "View or edit datasets"
#    And I access table "Company" of dataset "Metadatas"
#    And I select some records with primary key as following
#      | ID |
#      | 6  |
#    And I select table service "Match and Merge > Change state"
#    When I select target state is Golden
#    And I complete change state process
#    And I access table "RecordMetadata" of dataset "Metadatas_Company_MDS" in dataspace "ChangeState>SC-CS18"
#    Then I will see table RecordMetadata as below
#      | id     | groupId  | state  | autoCreated | functionalId       | isolated  |
#      | KEY1   | GROUP_ID | Golden | No          | 6                  | No        |
##    Then I will see table MergingProcess as below
##      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
##      | KEY1 | 15            | Manual    | executionDate |            | GROUP_ID | admin | No         |
#     Then I will see table MergeResult as below
#      | id   | recordId     | goldenId      | mergingProcessId | isInterpolation |
#      | KEY1 | Merge_record | Golden_record | mergingProcessId | No              |
#    Then I will see table Decision as below
#      | id   | sourceId     | targetId      | lastDecision        | user  | decisionDate | mergingProcessId |
#      | KEY1 | Merge_record | Golden_record | Identified as match | admin | decisionDate | mergingProcessId |
#
#  Scenario: SC-CS19 Check results when change state of record that have deleted/golden state to "Golden"
#    And I create a child of dataspace "ChangeState" with information as following
#      | Identifier               | Owner              | English Label |
#      | SC-CS19                  | admin admin(admin) |               |
#    And I select dataspace service "View or edit datasets"
#    And I access table "Mart" of dataset "Metadatas"
#    And I select some records with primary key as following
#      | ID |
#      | 15  |
#      | 14  |
#    And I select table service "Match and Merge > Change state"
#    When I select target state is Golden
#    And I complete change state process
#    And I access table "RecordMetadata" of dataset "Metadatas_Mart_MDS" in dataspace "ChangeState>SC-CS19"
#    Then I will see table RecordMetadata as below
#      | id     | groupId  | state   | autoCreated | functionalId       | isolated  |
#      | KEY1   | GROUP_ID | Golden  | No          | 14                 |         |
#      | KEY1   |          | Deleted | Yes         | 15                 |         |
#


