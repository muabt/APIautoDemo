Feature: Run Unmerge service

  Background:
    Given I login to EBX successfully

  Scenario: SC-UM09 Check service availability when selecting a record with the state <unset>
    And I create a child of dataspace "Enhance Unmerge Service" with information as following
      | Identifier   | Owner              | English Label |
      | childUnmerge | admin admin(admin) |               |
    And I access table "Stores" of dataset "Unmerge Service" in dataspace "childUnmerge"
    And I select some records with primary key as following
      | ID |
      | 20 |
    And I select table service "Match and Merge > Unmerge"
    Then the popup message will be shown "This service is only available for 'Golden' and 'Merged' records."
    And I delete the "childUnmerge" dataspace

  Scenario:  SC-UM10 Check service availability when selecting a record with the status "Pending Approval"
    And I create a child of dataspace "Enhance Unmerge Service" with information as following
      | Identifier   | Owner              | English Label |
      | childUnmerge | admin admin(admin) |               |
    And I access table "Stores" of dataset "Unmerge Service" in dataspace "childUnmerge"
    And I select some records with primary key as following
      | ID |
      | 21 |
    And I select table service "Match and Merge > Unmerge"
    Then the popup message will be shown "This service is only available for 'Golden' and 'Merged' records."
    And I delete the "childUnmerge" dataspace

  Scenario: SC-UM11 Check service availability when selecting a record with the status "Deleted"
    And I create a child of dataspace "Enhance Unmerge Service" with information as following
      | Identifier   | Owner              | English Label |
      | childUnmerge | admin admin(admin) |               |
    And I access table "Stores" of dataset "Unmerge Service" in dataspace "childUnmerge"
    And I select some records with primary key as following
      | ID |
      | 23 |
    And I select table service "Match and Merge > Unmerge"
    Then the popup message will be shown "This service is only available for 'Golden' and 'Merged' records."
    And I delete the "childUnmerge" dataspace

  Scenario: SC-UM12 Check service availability when selecting a record that is single golden
    And I create a child of dataspace "Enhance Unmerge Service" with information as following
      | Identifier   | Owner              | English Label |
      | childUnmerge | admin admin(admin) |               |
    And I access table "Stores" of dataset "Unmerge Service" in dataspace "childUnmerge"
    And I select some records with primary key as following
      | ID |
      | 22 |
    And I select table service "Match and Merge > Unmerge"
    Then the popup message will be shown "Unmerge can't be executed on a single golden."
    And I delete the "childUnmerge" dataspace

  Scenario: SC-UM13 Check service availability when selecting a record with state golden without any merged records targeted
    And I create a child of dataspace "Enhance Unmerge Service" with information as following
      | Identifier   | Owner              | English Label |
      | childUnmerge | admin admin(admin) |               |
    And I access table "Stores" of dataset "Unmerge Service" in dataspace "childUnmerge"
    And I select some records with primary key as following
      | ID |
      | 24 |
    And I select table service "Match and Merge > Unmerge"
    Then the popup message will be shown "Unmerge can't be executed on a single golden."
    And I delete the "childUnmerge" dataspace

  Scenario: SC-uM14 Check Metadata & Value of records in group after running Unmerge successfully for Golden was an auto-created record and there is not any interpolation merged (MI) record target to this Golden
    And I create a child of dataspace "Enhance Unmerge Service" with information as following
      | Identifier   | Owner              | English Label |
      | childUnmerge | admin admin(admin) |               |
    And I select dataspace service "View or edit datasets"
    And I access table "RecordMetadata" of dataset "Unmerge_Service_Audience_MDS"
    Then I will see table RecordMetadata before changing as below
      | id   | groupId               | state  | autoCreated | functionalId | isolated |
      | KEY1 | 1,604,146,145,501,184 | Merged | No          | 10           |          |
      | KEY1 | 1,604,146,145,501,184 | Merged | No          | 11           |          |
      | KEY1 | 1,604,146,145,501,184 | Golden | Yes         | 12           |          |
    Then I will see table MergingProcess before changing as below
      | id  | mergePolicyId | mergeMode | executionDate       | snapshotId                      | groupId               | user  | isUnmerged |
      | 172 |               | Manual    | 08/23/2019 15:29:30 | V1566548970216_BUnmerge_Service | 1,604,146,145,501,184 | admin | No         |
    And I access table "Audience" of dataset "Unmerge Service" in dataspace "childUnmerge"
    And I select some records with primary key as following
      | ID |
      | 12 |
    And I select table service "Match and Merge > Unmerge"
    And I access table "RecordMetadata" of dataset "Unmerge_Service_Audience_MDS" in dataspace "childUnmerge"
    Then I will see table RecordMetadata after changing as below
      | functionalId | groupId  | state            | autoCreated | isolated |
      | 10           | GROUP_ID | Pending approval | No          | No       |
      | 11           | GROUP_ID | Pending approval | No          | No       |
      | 12           |          | Deleted          | Yes         | No       |
    Then I will see table MergingProcess after changing as below
      | id  | mergePolicyId | mergeMode | executionDate | snapshotId                      | groupId               | user  | isUnmerged |
      | 172 |               | Manual    | TODAY         | V1566548970216_BUnmerge_Service | 1,604,146,145,501,184 | admin | Yes        |
    Then no records found in table "MergeResult" with filter
      | recordId | goldenId |
      | 11       | 12       |
      | 10       | 12       |
    And no records found in table "Decision" with filter
      | sourceId | targetId |
      | 11       | 12       |
      | 10       | 12       |
    And no records found in table "MergeValueLineage" with filter
      | mergingProcessId |
      | 172              |
#
#    And I will see table MergingProcess as below
#      | id  | mergePolicyId | mergeMode | executionDate       | snapshotId                      | groupId  | user  | isUnmerged |
#      | 172 | 173           | Manual    | 08/23/2019 15:29:30 | V1566548970216_BUnmerge_Service | GROUP_ID | admin | Yes        |
#      | 173 | 173           | Manual    | 08/23/2019 15:56:24 | V1566550584685_BUnmerge_Service | GROUP_ID | admin | No         |
    And I delete the "childUnmerge" dataspace
