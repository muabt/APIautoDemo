Feature: Survivor record selection mode is defined

  Scenario: SC-MPMM01 Check pre-selected records at merge view screen when Used for manual merge is No
    Given I login to EBX succesfully
    When I access "dataset" menu
    And I access dataspace "Master Data - Reference>Reference-child"
    And I access dataset "Master Data - Reference>Reference-child>Human_Resource"
    And I access table "TableNotUsedforManualMerge"
    When I select first "2" records in table
    And I select table service "Match and Merge>Merge"
    Then record view table will be displayed and highlighted as below
      | id | Owner | Employee |
      |  1 | Luna  | Davied   |
      |  2 | Alex  | Davied   |
    And preview table is displayed as below
      | id | Owner | Employee |
      |    |       |          |
    And the screen displays buttons as below
      | Name               | Status   |
      | Reset              |          |
      | Cancel last action | inactive |
    And I see the table name "TableNotUsedforManualMerge" in dropdowlist
    #And the screen displays buttons as below
      #| Name               | Status  |
      #| Reset              | Enable |
      #| Cancel last action | Disable  |
      
  Scenario: SC-MPMM02 Check pre-selected records at merge view screen when Survivor record selection mode is Most trusted source
    Given I login to EBX succesfully
    And I access "dataspace" menu
    And I access dataspace "Master Data - Reference>Reference-child"
    And I create child Dataspace with information as following
      | Identifier             | Owner               | English Label |
      | Reference-child_child1 | admin admin (admin) |               |
    When I access "dataset" menu
    And I access dataspace "Master Data - Reference>Reference-child>Reference-child_child1"
    And I access dataset "Human_Resource"
    And I access table "NewEmployee"
    When I select first "2" records in table
    And I select table service "Match and Merge>Merge"
    Then record view table will be displayed and highlighted as below
      | Identifier | Supervisor | Date of birth | National | Phone Number  | Email         | Date and time created   | Name      |
      | {H}  1     | {H}Dava    | {H}04/02/2019 | {H}FR    | {H}    123456 | {H}[List] 1/1 | {H} 04/25/2019 16:35:52 | {H}Nguyen |
      |          2 |            | 04/18/2019    | UK       |      34555555 |               | 04/25/2019 16:36:10     | Vien      |
      | Identifier | Date of birth | National |Phone Number|Email|Rank|Supervisor|Date and time created|PIT|Assurance number|
      |  1         |               |          |            |     |    |          |                     |   |                |
      |  2         |               |          |            |     |    |          |                     |   |                |
    And preview table is displayed as below
      | Identifier | Supervisor | Date of birth | National | Phone Number | Email      | Date and time created | Name   |
      |          1 | Dava       | 04/02/2019    | FR       |       123456 | [List] 1/1 | 04/25/2019 16:35:52   | Nguyen |
    And I see the table name "NewEmployee" in dropdowlist
    | ID | Owner | Employee |
    | 1  | A     |  B       |
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |
    And I complete merging process
    When I access "dataset" menu
    And I access dataspace "Master Data - Reference>Reference-child>Reference-child_child1"
    And I access dataset "Human_Resource_NewEmployee_MDS"
    And I access table "RecordMetadata"
    Then I will see table RecordMetadata as below
      | recordId | groupId  | state  | autoCreated | functionalId |
      | KEY1     | GROUP_ID | Golden | No          |            1 |
      | KEY2     | GROUP_ID | Merged | No          |            2 |
    Then I will see table MergeResult as below
      | id   | recordId     | goldenId      | mergingProcessId | isInterpolation |
      | KEY1 | Merge_record | Golden_record | mergingProcessId | No              |
    Then I will see table Decision as below
      | id   | sourceId     | targetId      | lastDecision        | user  | decisionDate | mergingProcessId |
      | KEY1 | Merge_record | Golden_record | Identified as match | admin | decisionDate | mergingProcessId |
    Then I will see table MergeValueLineage as below
      | id   | mergingProcessId | recordId      | sourceIndex | fieldPath | goldenIndex |   |
      | KEY1 | mergingProcessId | Golden_record |           0 | admin     | /email      | 0 |
    Then I will see table MergingProcess as below
      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
      | KEY1 |            15 | Manual    | executionDate |            | GROUP_ID | admin | no         |
    And I close dataspace with service "Reference-child_child1"
    And I access "administration" menu
    And I access to administration service "Dataspaces"
    And I access table "Dataspaces/snapshots" service
    And I select filter by text with keyword and field below
      | Field contains:  | In fields |
      | Resource-child20 |           |
    And I delete the dataspace "Dataspace Store (Store)" with service "Delete dataspaces and snapshots recursively"

  Scenario: SC-MPMM03 Check pre-selected records at merge view screen when Survivor record selection mode is Most trusted source and some records come from the same source
    Given I login to EBX succesfully
    And I access "dataspace" menu
    And I access dataspace "Master Data - Reference>Reference-child"
    And I create child Dataspace with information as following
      | Identifier             | Owner               | English Label |
      | Reference-child_child1 | admin admin (admin) |               |
    When I access "dataset" menu
    And I access dataspace "Master Data - Reference>Reference-child>Reference-child_child1"
    And I access dataset "Human_Resource"
    And I access table "NewEmployee"
    When I select some records with primary key as following
      | ID |
      |  3 |
      |  4 |
    And I select table service "Match and Merge>Merge"
    Then record view table will be displayed and highlighted as below
      | Identifier | Supervisor   | Date of birth | National | Phone Number | Email | Date and time created | Name    |
      | {H}  3     | {H}Vien Pham | {H}           | {H}VN    | {H}          | {H}   | {H}                   | {H}Oanh |
      |          4 | Vien Pham    | 04/25/2019    | US       |              |       | 04/25/2019 16:36:50   | Canh    |
    And preview table is displayed as below
      | Identifier | Supervisor | Date of birth | National | Phone Number | Email | Date and time created | Name |
      |          3 | Vien Pham  |               | VN       |              |       |                       | Oanh |
    And I see the table name "NewEmployee" in dropdowlist
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |
    And I complete merging process
    When I access "dataset" menu
    And I access dataspace "Master Data - Reference>Reference-child>Reference-child_child1"
    And I access dataset "Human_Resource_NewEmployee_MDS"
    And I access table "RecordMetadata"
    Then I will see table RecordMetadata as below
      | recordId | groupId  | state  | autoCreated | functionalId |
      | KEY1     | GROUP_ID | Golden | No          |            3 |
      | KEY2     | GROUP_ID | Merged | No          |            4 |
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
      | KEY1 |            15 | Manual    | executionDate |            | GROUP_ID | admin | no         |
    And I close dataspace with service "Reference-child_child1"
    And I access "administration" menu
    And I access to administration service "Dataspaces"
    And I access table "Dataspaces/snapshots" service
    And I select filter by text with keyword and field below
      | Field contains:  | In fields |
      | Resource-child20 |           |
    And I delete the dataspace "Dataspace Store (Store)" with service "Delete dataspaces and snapshots recursively"

  Scenario: SC-MPMM05 Check pre-selected records at merge view screen when Survivor record selection mode is Most trusted source and Value of source field (of selected merged records)do not map with the code defined in Table trusted source
    Given I login to EBX succesfully
    When I access "dataset" menu
    And I access dataspace "Master Data - Reference>Merge_save_tobackend"
    And I access dataset "Merge_save_tobackend"
    And I access table "Items"
    When I select first "2" records in table
    And I select table service "Match and Merge>Merge"
    Then record view table will be displayed and highlighted as below
      | Identifiers | integer        | Category    | Brand | Name             | Available       | defaultPrice | Expire_date            | testSourceField |
      |           1 | {H}999,999,999 | {H}truongLE | {H}   | {H}Minh Tran     | {H}[List] 21/21 | {H}120,000   | {H}04/09/2019 17:29:55 |            2010 |
      |           2 |    999,999,999 | truongLE    |       | Minh Tran Tranhg | [List] 0/4      |          120 | 04/09/2019 17:04:24    |            2010 |
    And preview table is displayed as below
      | Identifiers      | integer  | Category | Brand | Name      | Available    | defaultPrice | Expire_date         | testSourceField |
      | [auto generated] | Casumina | truongLE |       | Minh Tran | [List] 21/25 |      120,000 | 04/09/2019 17:29:55 |            2010 |
    And I see the table name "Merge_save_tobackend" in dropdowlist
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |
    And I see an exception error
