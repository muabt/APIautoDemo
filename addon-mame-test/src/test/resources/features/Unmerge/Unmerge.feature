@SYSTEM_TEST
Feature: Run Unmerge service

  Background:
    Given I login to EBX successfully

  Scenario: SC-UM09 Check service availability when selecting a record with the state <unset>
    And I create a child of dataspace "Enhance_Unmerge_Service" with information as following
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
    And I create a child of dataspace "Enhance_Unmerge_Service" with information as following
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
    And I create a child of dataspace "Enhance_Unmerge_Service" with information as following
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
    And I create a child of dataspace "Enhance_Unmerge_Service" with information as following
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
    And I create a child of dataspace "Enhance_Unmerge_Service" with information as following
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
    And I create a child of dataspace "Master Data - Reference > Enhance_Unmerge_Service" with information as following
      | Identifier   | Owner              | English Label |
      | childUnmerge | admin admin(admin) |               |
    And I select dataspace service "View or edit datasets"
    And I access table "RecordMetadata" of dataset "Unmerge_Service_Audience_MDS"
    Then I will see table RecordMetadata before changing as below
      | id   | groupId               | state  | autoCreated | functionalId | isolated |
      | KEY1 | 1,609,640,740,111,360 | Merged | No          | 10           |          |
      | KEY2 | 1,609,640,740,111,360 | Merged | No          | 11           |          |
      | KEY3 | 1,609,640,740,111,360 | Golden | Yes         | 18           |          |
    Then I will see table MergingProcess before changing as below
      | id    | mergePolicyId | mergeMode | executionDate       | snapshotId        | groupId               | user  | isUnmerged |
      | 1,212 | 173           | Manual    | 10/24/2019 17:59:45 | V1609640739996672 | 1,609,640,740,111,360 | admin | No         |
    And I access table "Audience" of dataset "Unmerge Service" in dataspace "childUnmerge"
#    And I select filter by simple search with criterion
#      | Identifier |
#      | 10         |
#      | 11         |
#      | 18         |
    And I select filter by advanced search with criterion and logical "All criteria match"
      | Criterion  | Operation | Value | Field type |
      | Identifier | =         | 10    | INPUT      |
      | Identifier | =         | 11    | INPUT      |
      | Identifier | =         | 18    | INPUT      |
    And I verify business table before changing as below
      | Identifier | Name | Comment | Age | Marial status | Email          | Phone number |
      | 10         | Paul | hello   | 25  | Single        | paul@email.com | Yes          |
      | 11         | Paul | hello   | 25  | Married       | paul@email.com | Yes          |
      | 18         | Paul | hello   | 25  | Married       | paul@email.com | Yes          |
    And I select some records with primary key as following
      | ID |
      | 12 |
    And I select table service "Match and Merge > Unmerge"
    And I access table "Audience" of dataset "Unmerge Service" in dataspace "childUnmerge"
    And I select some records with primary key as following
      | Identifier |
      | 10         |
      | 11         |
      | 18         |
    Then I verify business table after changing as below
      | Identifier | Name | Comment | Age | Marial status | Email          | Phone number |
      | 10         | Paul | hello   | 25  | Single        | paul@email.com | Yes          |
      | 11         | Paul | hello   | 25  | Married       | paul@email.com | Yes          |
      | 18         | Paul | hello   | 25  | Married       | paul@email.com | Yes          |
    And I access table "RecordMetadata" of dataset "Unmerge_Service_Audience_MDS" in dataspace "childUnmerge"
    Then I will see table RecordMetadata after changing as below
      | functionalId | groupId  | state            | autoCreated | isolated |
      | 10           | GROUP_ID | Pending approval | No          | No       |
      | 11           | GROUP_ID | Pending approval | No          | No       |
      | 18           |          | Deleted          | Yes         | No       |
    Then I will see table MergingProcess after changing as below
      | id   | mergePolicyId | mergeMode | executionDate | snapshotId                      | groupId               | user  | isUnmerged |
      | 1212 | 173           | Manual    | TODAY         | V1566548970216_BUnmerge_Service | 1,609,640,740,111,360 | admin | Yes        |
    Then no records found in table "MergeResult" with filter
      | recordId | goldenId |
      | 11       | 18       |
      | 10       | 18       |
    And no records found in table "Decision" with filter
      | sourceId | targetId |
      | 11       | 18       |
      | 10       | 18       |
    And no records found in table "MergeValueLineage" with filter
      | RecordId |
      | 10       |
      | 11       |
    And I delete the "childUnmerge" dataspace
