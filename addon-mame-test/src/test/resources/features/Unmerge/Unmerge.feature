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

#  Scenario: Check Metadata & Value of records in group after running Unmerge successfully for Golden was an auto-created record and there is not any interpolation merged (MI) record target to this Golden
#    And I create a child of dataspace "Enhance Unmerge Service" with information as following
#      | Identifier   | Owner              | English Label |
#      | childUnmerge | admin admin(admin) |               |
#    And I access table "Audience" of dataset "Unmerge Service" in dataspace "childUnmerge"
#    And I select some records with primary key as following
#      | ID |
#      | 3  |
#    And I select table service "Match and Merge > Unmerge"
#    And I will see table RecordMetadata as below
#      | functionalId | groupId               | state            | autoCreated | isolated |
#      | 1            | 1,604,146,145,501,184 | Pending Approval | No          | No       |
#      | 2            | 1,604,146,145,501,184 | Pending Approval | No          | No       |
#      | 3            |                       | Deleted          | Yes         | No       |
#    And I will see table MergeResult as below
#      | id               | recordId | goldenId | mergingProcessId | isInterpolation |
#      | No records found |
#    And I will see table Decision as below
#
#    And I will see table MergeValueLineage as below
#
#    And I will see table MergingProcess as below
#      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
#      | KEY1 | 15            | Manual    | TODAY         |            | GROUP_ID | admin | Yes        |
#    And I delete the "childUnmerge" dataspace
