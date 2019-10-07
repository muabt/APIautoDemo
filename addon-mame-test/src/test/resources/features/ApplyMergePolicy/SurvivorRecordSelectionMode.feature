@SYSTEM_TEST
Feature: Survivor record selection mode is defined

  Background:
    Given I login to EBX successfully

  Scenario: SC-MPMM01 Check pre-selected records at merge view screen when Used for manual merge is No
    And I access table "TableNotUsedforManualMerge" of dataset "Human_Resource" in dataspace "Master Data - Reference>Reference-child"
    When I select first "2" records in table
    And I select table service "Match and Merge>Merge"
    Then record view table will be displayed and highlighted as below
      | id | Owner | Employee |
      | 1  | Luna  | Davied   |
      | 2  | Alex  | Davied   |
    And preview table is displayed as below
      | id | Owner | Employee |
      |    |       |          |
    And the screen displays buttons as below
      | Name               | Status   |
      | Reset              |          |
      | Cancel last action | inactive |
    And I see the table name "1. TableNotUsedforManualMerge" in dropdown list

  Scenario: SC-MPMM02 Check pre-selected records at merge view screen when Survivor record selection mode is Most trusted source
    And I create a child of dataspace "Master Data - Reference>Reference-child" with information as following
      | Identifier | Owner               | English Label |
      |            | admin admin (admin) |               |
    Then I should see dataspace with information as following
      | Identifier | Type      | Status | Owner               | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
      |            | Dataspace | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
    And I select dataspace service "View or edit datasets"
    And I access table "NewEmployee" of dataset "Human_Resource"
    When I select first "2" records in table
    And I select table service "Match and Merge>Merge"
    Then record view table will be displayed and highlighted as below
      | Identifier | Supervisor | Date of birth | National | Phone Number  | Email         | Date and time created   | Name      |
      | {H}  1     | {H}Dava    | {H}04/02/2019 | {H}FR    | {H}    123456 | {H}[List] 1/1 | {H} 04/25/2019 16:35:52 | {H}Nguyen |
      | 2          |            | 04/18/2019    | UK       | 34555555      |               | 04/25/2019 16:36:10     | Vien      |
    And preview table is displayed as below
      | Identifier | Supervisor | Date of birth | National | Phone Number | Email      | Date and time created | Name   |
      | 1          | Dava       | 04/02/2019    | FR       | 123456       | [List] 1/1 | 04/25/2019 16:35:52   | Nguyen |
    And I see the table name "1. NewEmployee" in dropdown list
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |
    And I complete merging process
    And I access table "RecordMetadata" of dataset "Human_Resource_NewEmployee_MDS" in dataspace "Master Data - Reference>Reference-child>DATASPACE_IDENTIFIER"
    Then I will see table RecordMetadata as below
      | id | groupId  | state  | autoCreated | functionalId |
      |    | GROUP_ID | Golden | No          | 1            |
      |    | GROUP_ID | Merged | No          | 2            |
    Then I will see table MergingProcess as below
      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
      | KEY1 | 15            | Manual    | executionDate |            | GROUP_ID | admin | No         |
    Then I will see table MergeResult as below
      | id   | recordId     | goldenId      | mergingProcessId | isInterpolation |
      | KEY1 | Merge_record | Golden_record | mergingProcessId | No              |
    Then I will see table Decision as below
      | id   | sourceId     | targetId      | lastDecision        | user  | decisionDate | mergingProcessId |
      | KEY1 | Merge_record | Golden_record | Identified as match | admin | decisionDate | mergingProcessId |
    Then no records found in table "MergeValueLineage"
    And I delete the dataspace

  Scenario: SC-MPMM03 Check pre-selected records at merge view screen when Survivor record selection mode is Most trusted source and some records come from the same source
    And I create a child of dataspace "Master Data - Reference>Reference-child" with information as following
      | Identifier | Owner               | English Label |
      |            | admin admin (admin) |               |
    And I select dataspace service "View or edit datasets"
    And I access table "NewEmployee" of dataset "Human_Resource"
    When I select some records with primary key as following
      | ID |
      | 3  |
      | 4  |
    And I select table service "Match and Merge>Merge"
    Then record view table will be displayed and highlighted as below
      | Identifier | Supervisor   | Date of birth | National | Phone Number | Email | Date and time created | Name    |
      | {H}  3     | {H}Vien Pham | {H}           | {H}VN    | {H}          | {H}   | {H}                   | {H}Oanh |
      | 4          | Vien Pham    | 04/25/2019    | US       |              |       | 04/25/2019 16:36:50   | Canh    |
    And preview table is displayed as below
      | Identifier | Supervisor | Date of birth | National | Phone Number | Email | Date and time created | Name |
      | 3          | Vien Pham  |               | VN       |              |       |                       | Oanh |
    And I see the table name "1. NewEmployee" in dropdown list
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |
    And I complete merging process
    And I access table "RecordMetadata" of dataset "Human_Resource_NewEmployee_MDS" in dataspace "Master Data - Reference>Reference-child>DATASPACE_IDENTIFIER"
    Then I will see table RecordMetadata as below
      | id   | groupId  | state  | autoCreated | functionalId |
      | KEY1 | GROUP_ID | Golden | No          | 3            |
      | KEY2 | GROUP_ID | Merged | No          | 4            |
    Then I will see table MergingProcess as below
      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
      | KEY1 | 15            | Manual    | TODAY         |            | GROUP_ID | admin | No         |
    Then I will see table MergeResult as below
      | id   | recordId     | goldenId      | mergingProcessId | isInterpolation |
      | KEY1 | Merge_record | Golden_record | mergingProcessId | No              |
    Then I will see table Decision as below
      | id   | sourceId     | targetId      | lastDecision        | user  | decisionDate | mergingProcessId |
      | KEY1 | Merge_record | Golden_record | Identified as match | admin | decisionDate | mergingProcessId |
    Then no records found in table "MergeValueLineage"
    And I delete the dataspace

  Scenario: SC-MPMM05 Check pre-selected records at merge view screen when Survivor record selection mode is Most trusted source and Value of source field (of selected merged records)do not map with the code defined in Table trusted source
    Given I login to EBX successfully
    When I access "dataset" menu
    And I access dataspace "Master Data - Reference>Merge_save_tobackend"
    And I access dataset "Merge_save_tobackend"
    And I access table "Items"
    When I select first "2" records in table
    And I select table service "Match and Merge>Merge"
    Then record view table will be displayed and highlighted as below
      | Indentifiers | integer     | Category    | Brand | Name             | Available       | defaultPrice | Expire_date            | testSourceField |
      | 1            | 999,999,999 | {H}truongLE | {H}   | {H}Minh Tran     | {H}[List] 21/21 | {H}120,000   | {H}04/09/2019 17:29:55 | {H}2010         |
      | 2            | 999,999,999 | truongLE    |       | Minh Tran Tranhg | [List] 0/4      | 120          | 04/09/2019 17:04:24    | 2010            |
    And preview table is displayed as below
      | Indentifiers     | integer  | Category | Brand | Name      | Available    | defaultPrice | Expire_date         | testSourceField |
      | [auto generated] | Casumina | truongLE |       | Minh Tran | [List] 21/25 | 120,000      | 04/09/2019 17:29:55 | 2010            |
    And I see the table name "1. Items" in dropdown list
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |
#    And I see an exception error

  Scenario: SC-MPMM06 Check merging records if Survivor record selection mode is Most trusted source and all values of source field (of selected merged records) are null
    Given I login to EBX successfully
    And I create a child of dataspace "Master Data - Reference>Reference-child" with information as following
      | Identifier | Owner               | English Label |
      |            | admin admin (admin) |               |
    And I select dataspace service "View or edit datasets"
    And I access table "National" of dataset "Human_Resource"
    When I select some records with primary key as following
      | ID |
      | 8  |
      | 9  |
    And I select table service "Match and Merge>Merge"
    Then record view table will be displayed and highlighted as below
      | Identifier | Name | Employee  | Website     |
      | {H}8       | {H}  | {H}Davied | {H}  [html] |
      | 9          |      | Alice     | [html]      |
    And preview table is displayed as below
      | Identifier | Name | Employee | Website |
      | 8          |      | Davied   | [html]  |
    And I see the table name "1. National" in dropdown list
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |

