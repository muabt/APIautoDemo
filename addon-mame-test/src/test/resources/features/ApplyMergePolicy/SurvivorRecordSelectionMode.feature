@SYSTEM_TEST @Survivor_record
Feature: Survivor record selection mode is defined

  Background:
    Given I login to EBX successfully

  Scenario: SC-MPMM01 Check pre-selected records at merge view screen when Used for manual merge is No
    And I access table "TableNotUsedforManualMerge" of dataset "Human_Resource" in dataspace "Master Data - Reference>Reference-child"
    When I select some records with primary key as following
      | id |
      | 1  |
      | 2  |
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
      | SC-MPMM02  | admin admin (admin) |               |
    And I select dataspace service "View or edit datasets"
    And I access table "NewEmployee" of dataset "Human_Resource"
    When I select some records with primary key as following
      | Identifier |
      | 1          |
      | 2          |
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
    And I access table "RecordMetadata" of dataset "Human_Resource_NewEmployee_MDS" in dataspace "Master Data - Reference>Reference-child>SC-MPMM02"
    Then I will see table RecordMetadata as below
      | functionalId | groupId  | state  | autoCreated | isolated |
      | 1            | GROUP_ID | Golden | No          | No       |
      | 2            | GROUP_ID | Merged | No          | No       |
    Then I will see table MergingProcess as below
      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
      | KEY1 | 15            | Manual    | TODAY         |            | GROUP_ID | admin | No         |
    Then I will see table MergeResult as below
      | id   | recordId | goldenId | mergingProcessId | isInterpolation |
      | KEY1 | 2        | 1        | 900              | No              |
    Then I will see table Decision as below
      | id   | sourceId | targetId | lastDecision        | user  | decisionDate | mergingProcessId |
      | KEY1 | 2        | 1        | Identified as match | admin | TODAY        | 900              |
    Then no records found in table "MergeValueLineage"
      | id   | mergingProcessId | recordId | sourceIndex | fieldPath | goldenIndex |
      | KEY1 | AUTO_GENARATED   | 1        | 0           | /Name     | 0           |
    And I delete the dataspace

  Scenario: SC-MPMM03 Check pre-selected records at merge view screen when Survivor record selection mode is Most trusted source and some records come from the same source
    And I create a child of dataspace "Master Data - Reference>Reference-child" with information as following
      | Identifier | Owner               | English Label |
      | SC-MPMM03  | admin admin (admin) |               |
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
    And I access table "RecordMetadata" of dataset "Human_Resource_NewEmployee_MDS" in dataspace "Master Data - Reference>Reference-child>SC-MPMM03"
    Then I will see table RecordMetadata as below
      | functionalId | groupId  | state  | autoCreated | isolated |
      | 3            | GROUP_ID | Golden | No          | No       |
      | 4            | GROUP_ID | Merged | No          | No       |
    Then I will see table MergingProcess as below
      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
      | KEY1 | 15            | Manual    | TODAY         |            | GROUP_ID | admin | No         |
    Then I will see table MergeResult as below
      | id   | recordId | goldenId | mergingProcessId | isInterpolation |
      | KEY1 | 4        | 3        | mergingProcessId | No              |
    Then I will see table Decision as below
      | id   | sourceId | targetId | lastDecision        | user  | decisionDate | mergingProcessId |
      | KEY1 | 4        | 3        | Identified as match | admin | TODAY        | mergingProcessId |
    Then I will see table MergeValueLineage as below
      | id   | mergingProcessId | recordId | sourceIndex | fieldPath | goldenIndex |
      | KEY1 | AUTO_GENARATED   | 1        | 0           | /email    | 0           |
    And I delete the dataspace

  Scenario: SC-MPMM05 Check pre-selected records at merge view screen when Survivor record selection mode is Most trusted source and Value of source field (of selected merged records)do not map with the code defined in Table trusted source
    When I access "dataset" menu
    And I access dataspace "Master Data - Reference>Merge_save_tobackend"
    And I access dataset "Merge_save_tobackend"
    And I access table "Items"
    When I select some records with primary key as following
      | Indentifiers |
      | 1            |
      | 2            |
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
    And I complete merging process
    And I see an exception error popup "java.lang.IllegalArgumentException: [/root/Item[*]/integer]: Incompatible value class java.lang.String of type /root/Item/integer"

  Scenario: SC-MPMM06 Check merging records if Survivor record selection mode is Most trusted source and all values of source field (of selected merged records) are null
    And I create a child of dataspace "Master Data - Reference>Reference-child" with information as following
      | Identifier | Owner               | English Label |
      | SC-MPMM06  | admin admin (admin) |               |
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
    And I complete merging process
    And I access table "RecordMetadata" of dataset "Human_Resource_national_MDS" in dataspace "Master Data - Reference>Reference-child>SC-MPMM06"
    Then I will see table RecordMetadata as below
      | functionalId | groupId  | state  | autoCreated | isolated |
      | 8            | GROUP_ID | Golden | No          | No       |
      | 9            | GROUP_ID | Merged | No          | No       |
    Then I will see table MergingProcess as below
      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
      | KEY1 | 14            | Manual    | TODAY         |            | GROUP_ID | admin | No         |
    Then I will see table MergeResult as below
      | id   | recordId | goldenId | mergingProcessId | isInterpolation |
      | KEY1 | 9        | 8        | AUTO_GENARATED   | No              |
    Then I will see table Decision as below
      | id   | sourceId | targetId | lastDecision        | user  | decisionDate | mergingProcessId |
      | KEY1 | 9        | 8        | Identified as match | admin | TODAY        | AUTO_GENARATED   |
    Then no record found in table "MergeValueLineage" with following information
      | mergingProcessId |
      | AUTO_GENARATED   |
    And I delete the dataspace

  Scenario: SC-MPMM08 Check merging records when Survivor field is defined and Default merge function is not defined
    And I create a child of dataspace "Master Data - Reference>Apply_merge_policy" with information as following
      | Identifier | Owner               | English Label |
      | SC-MPMM08  | admin admin (admin) |               |
    And I select dataspace service "View or edit datasets"
    And I access table "Company" of dataset "Merge_save_tobackend"
    When I select some records with primary key as following
      | ID        |
      | A         |
      | company_A |
      | company_B |
    And I select table service "Match and Merge>Merge"
    Then record view table will be displayed and highlighted as below
      | ID        | Company                                                                                         | Email                       | Text            | Integer | Decimal | Company_name | website | Boolean | Date_time | Date | Time |
      | {H}A      | {H}                                                                                             | vien@hm.com                 | {H}             | {H}     | {H}     | 1   {H}      | {H}     | {H}     | {H}       | {H}  | {H}  |
      | company_A | https://stackoverflow.com/questions/176264/what-is-the-difference-between-a-uri-a-url-and-a-urn | vienptphamthi@gmail.com {H} | Text is context | 3       | -6      | 3            |         |         |           |      |      |
      | company_B | https://tibco-connect.tibco.com/tibco-connect/login?r=%2Ftibco-connect%2F&error=NEED_LOGIN      | vienpt@gmail.com            | Text is context | 3       | -6      | 2            |         |         |           |      |      |
    And preview table is displayed as below
      | ID | Company | Email                   | Text | Integer | Decimal | Company_name | website | Boolean | Date_time | Date | Time |
      | A  |         | vienptphamthi@gmail.com |      |         |         | 1            |         |         |           |      |      |
    And I see the table name "1. Company" in dropdown list
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |
    And I complete merging process
    And I access table "RecordMetadata" of dataset "Merge_save_tobackend_Company_MDS" in dataspace "Master Data - Reference>>Apply_merge_policy>SC-MPMM08"
    Then I will see table RecordMetadata as below
      | functionalId | groupId  | state  | autoCreated | isolated |
      | A            | GROUP_ID | Golden | No          | No       |
      | company_A    | GROUP_ID | Merged | No          | No       |
      | company_B    | GROUP_ID | Merged | No          | No       |
    Then I will see table MergingProcess as below
      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
      | KEY1 | 261           | Manual    | TODAY         |            | GROUP_ID | admin | No         |
    Then I will see table MergeResult as below
      | id   | recordId  | goldenId | mergingProcessId | isInterpolation |
      | KEY1 | company_A | A        | AUTO_GENARATED   | No              |
      | KEY1 | company_B | A        | AUTO_GENARATED   | No              |
    Then I will see table Decision as below
      | id   | sourceId  | targetId | lastDecision        | user  | decisionDate | mergingProcessId |
      | KEY1 | company_A | A        | Identified as match | admin | TODAY        | AUTO_GENARATED   |
      | KEY1 | company_B | A        | Identified as match | admin | TODAY        | AUTO_GENARATED   |
    Then I will see table MergeValueLineage as below
      | id  | mergingProcessId | recordId  | sourceIndex | fieldPath | goldenIndex |
      | KEY | MERGE_PROCESS_ID | company_A |             | /Email    |             |
    And I delete the dataspace

  Scenario: SC-MPMM09 Check merging records when Survivor field is not defined, default merge function is defined
    And I create a child of dataspace "Master Data - Reference>Reference-child" with information as following
      | Identifier | Owner               | English Label |
      | SC-MPMM09  | admin admin (admin) |               |
    And I select dataspace service "View or edit datasets"
    And I access table "Suvivor" of dataset "Human_Resource"
    When I select some records with primary key as following
      | ID |
      | 1  |
      | 2  |
      | 3  |
    And I select table service "Match and Merge>Merge"
    Then record view table will be displayed and highlighted as below
      | Identifier | Name      | Phone Number  | Email         |
      | 1          | {H}Nguyen | {H}0985623264 | [List] 0/1    |
      | 2          | Hai       | 065812308     | [List] 0/1    |
      | 3{H}       | Manh      | 025989622     | [List] 1/1{H} |
    And preview table is displayed as below
      | Identifier | Name   | Phone Number | Email      |
      | 3          | Nguyen | 0985623264   | [List] 1/3 |
    And I see the table name "1. Suvivor" in dropdown list
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |
    And I complete merging process
    And I access table "RecordMetadata" of dataset "Human_Resource_Suvivor_MDS" in dataspace "Master Data - Reference>Reference-child>SC-MPMM09"
    Then I will see table RecordMetadata as below
      | functionalId | groupId  | state  | autoCreated | isolated |
      | 1            | GROUP_ID | Merged | No          | No       |
      | 2            | GROUP_ID | Merged | No          | No       |
      | 3            | GROUP_ID | Golden | No          | No       |
    Then I will see table MergingProcess as below
      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
      | KEY1 | 16            | Manual    | TODAY         |            | GROUP_ID | admin | No         |
    Then I will see table MergeResult as below
      | id   | recordId | goldenId | mergingProcessId | isInterpolation |
      | KEY1 | 1        | 3        | AUTO_GENARATED   | No              |
      | KEY1 | 2        | 3        | AUTO_GENARATED   | No              |
    Then I will see table Decision as below
      | id   | sourceId | targetId | lastDecision        | user  | decisionDate | mergingProcessId |
      | KEY1 | 1        | 3        | Identified as match | admin | TODAY        | AUTO_GENARATED   |
      | KEY1 | 2        | 3        | Identified as match | admin | TODAY        | AUTO_GENARATED   |
    Then I will see table MergeValueLineage as below
      | id   | mergingProcessId | recordId | sourceIndex | fieldPath | goldenIndex |
      | KEY1 | AUTO_GENARATED   | 1        |             | /Name     |             |
      | KEY1 | AUTO_GENARATED   | 1        |             | /Phone    |             |
      | KEY1 | AUTO_GENARATED   | 3        | 0           | /email    | 0           |
    And I delete the "SC-MPMM09" dataspace

  Scenario: SC-MPMM11 Check merging records when Survivor record selection mode: Most trusted source and Table trusted source is not defined and Source field is defined
    And I create a child of dataspace "Master Data - Reference>Reference-child" with information as following
      | Identifier | Owner               | English Label |
      | SC-MPMM11  | admin admin (admin) |               |
    And I select dataspace service "View or edit datasets"
    And I access table "Rank" of dataset "Human_Resource"
    When I select some records with primary key as following
      | ID |
      | 3  |
      | 2  |
    And I select table service "Match and Merge>Merge"
    Then record view table will be displayed and highlighted as below
      | Identifer | Team  | Rank | Employee |
      | 2     {H} | {H}ON | {H}1 | {H}      |
      | 3         | UI    | 1.5  |          |
    And preview table is displayed as below
      | Identifer | Team | Rank | Employee |
      | 2         | ON   | 1    |          |
    And I see the table name "1. Rank" in dropdown list
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |
    And I complete merging process
    And I access table "RecordMetadata" of dataset "Human_Resource_rank_MDS" in dataspace "Master Data - Reference>Reference-child>SC-MPMM11"
    Then I will see table RecordMetadata as below
      | functionalId | groupId  | state  | autoCreated | isolated |
      | 2            | GROUP_ID | Golden | No          | No       |
      | 3            | GROUP_ID | Merged | No          | No       |
    Then I will see table MergingProcess as below
      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
      | KEY1 | 153           | Manual    | TODAY         |            | GROUP_ID | admin | No         |
    Then I will see table MergeResult as below
      | id   | recordId | goldenId | mergingProcessId | isInterpolation |
      | KEY1 | 3        | 2        | AUTO_GENARATED   | No              |
    Then I will see table Decision as below
      | id   | sourceId | targetId | lastDecision        | user  | decisionDate | mergingProcessId |
      | KEY1 | 3        | 2        | Identified as match | admin | TODAY        | AUTO_GENARATED   |
    Then no records found in table "MergeValueLineage"
    And I delete the dataspace

  Scenario: SC-MPMM12 Check merging records when Survivor record selection mode: Most trusted source and Table trusted source is not defined and Source field is not defined
    And I create a child of dataspace "Master Data - Reference > Reference-child" with information as following
      | Identifier | Owner               | English Label |
      | SC-MPMM12  | admin admin (admin) |               |
    And I select dataspace service "View or edit datasets"
    And I access table "rank2" of dataset "Human_Resource"
    When I select some records with primary key as following
      | Identifer |
      | 1         |
      | 2         |
    And I select table service "Match and Merge>Merge"
    Then record view table will be displayed and highlighted as below
      | Identifer | Rank | Employee | Team   |
      | 1     {H} | {H}1 | {H}Alice | {H}IOS |
      | 2         | 2    | Alice    | IOS    |
    And preview table is displayed as below
      | Identifer | Rank | Employee | Team |
      | 1         | 1    | Alice    | IOS  |
    And I see the table name "1. rank2" in dropdown list
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |
    And I complete merging process
    And I access table "RecordMetadata" of dataset "Human_Resource_rank2_MDS" in dataspace "Master Data - Reference > Reference-child > SC-MPMM12"
    Then I will see table RecordMetadata as below
      | functionalId | groupId  | state  | autoCreated | isolated |
      | 1            | GROUP_ID | Golden | No          | No       |
      | 2            | GROUP_ID | Merged | No          | No       |
    Then I will see table MergingProcess as below
      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
      | KEY1 | 18            | Manual    | TODAY         |            | GROUP_ID | admin | No         |
    Then I will see table MergeResult as below
      | id   | recordId | goldenId | mergingProcessId | isInterpolation |
      | KEY1 | 2        | 1        | AUTO_GENARATED   | No              |
    Then I will see table Decision as below
      | id   | sourceId | targetId | lastDecision        | user  | decisionDate | mergingProcessId |
      | KEY1 | 2        | 1        | Identified as match | admin | TODAY        | AUTO_GENARATED   |
    Then no records found in table "MergeValueLineage"
    And I delete the dataspace

  Scenario: SC-MPMM21 Check merging records when Survivor record selection mode: Was golden
    And I create a child of dataspace "Master Data - Reference>Reference-child" with information as following
      | Identifier | Owner               | English Label |
      | SC-MPMM21  | admin admin (admin) |               |
    And I select dataspace service "View or edit datasets"
    And I access table "Table 1" of dataset "Functions"
    When I select some records with primary key as following
      | identifier |
      | 1          |
      | 2          |
    And I select table service "Match and Merge>Merge"
    Then record view table will be displayed and highlighted as below
      | identifier | Name        | Phone         | National |
      | 1          | Rose        | 123,466       | 1        |
      | 2  {H}     | Lavender{H} | 789,456   {H} | 2{H}     |
    And preview table is displayed as below
      | identifier | Name     | Phone   | National |
      | 2          | Lavender | 789,456 | 2        |
    And I see the table name "1. Table 1" in dropdown list
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |
    And I complete merging process
    And I access table "RecordMetadata" of dataset "Functions_Table1_MDS" in dataspace "Master Data - Reference>Reference-child>SC-MPMM21"
    Then I will see table RecordMetadata as below
      | functionalId | groupId  | state  | autoCreated | isolated |
      | 1            | GROUP_ID | Merged | No          | No       |
      | 2            | GROUP_ID | Golden | No          | No       |
    Then I will see table MergingProcess as below
      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
      | KEY1 | 25            | Manual    | TODAY         |            | GROUP_ID | admin | No         |
    Then I will see table MergeResult as below
      | id   | recordId | goldenId | mergingProcessId | isInterpolation |
      | KEY1 | 1        | 2        | AUTO_GENARATED   | No              |
    Then I will see table Decision as below
      | id   | sourceId | targetId | lastDecision        | user  | decisionDate | mergingProcessId |
      | KEY1 | 1        | 2        | Identified as match | admin | TODAY        | AUTO_GENARATED   |
    Then no records found in table "MergeValueLineage"
    And I delete the dataspace

  Scenario: SC-MPMM23 Check merging records when Survivor record selection mode: Was golden and Survivor field is defined
    And I create a child of dataspace "Master Data - Reference>Reference-child" with information as following
      | Identifier | Owner               | English Label |
      | SC-MPMM23  | admin admin (admin) |               |
    And I select dataspace service "View or edit datasets"
    And I access table "National" of dataset "Functions"
    When I select some records with primary key as following
      | id |
      | 1  |
      | 2  |
      | 3  |
    And I select table service "Match and Merge>Merge"
    Then record view table will be displayed and highlighted as below
      | id     | Name    |
      | 1      | US      |
      | 2  {H} | UK      |
      | 3      | FR  {H} |
    And preview table is displayed as below
      | id | Name |
      | 2  | FR   |
    And I see the table name "1. National" in dropdown list
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |
    And I complete merging process
    And I access table "RecordMetadata" of dataset "Functions_National_MDS" in dataspace "Master Data - Reference>Reference-child>SC-MPMM23"
    Then I will see table RecordMetadata as below
      | functionalId | groupId  | state  | autoCreated | isolated |
      | 1            | GROUP_ID | Merged | No          | No       |
      | 2            | GROUP_ID | Golden | No          | No       |
      | 3            | GROUP_ID | Merged | No          | No       |
    Then I will see table MergingProcess as below
      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
      | KEY1 | 692           | Manual    | TODAY         |            | GROUP_ID | admin | No         |
    Then I will see table MergeResult as below
      | id   | recordId | goldenId | mergingProcessId | isInterpolation |
      | KEY1 | 1        | 2        | AUTO_GENARATED   | No              |
      | KEY1 | 3        | 2        | AUTO_GENARATED   | No              |
    Then I will see table Decision as below
      | id   | sourceId | targetId | lastDecision        | user  | decisionDate | mergingProcessId |
      | KEY1 | 1        | 2        | Identified as match | admin | TODAY        | AUTO_GENARATED   |
      | KEY1 | 3        | 2        | Identified as match | admin | TODAY        | AUTO_GENARATED   |
    Then I will see table MergeValueLineage as below
      | id   | mergingProcessId | recordId | sourceIndex | fieldPath | goldenIndex |
      | KEY1 | AUTO_GENARATED   | 3        |             | /Name     |             |
    And I delete the dataspace

  Scenario: SC-MPMM24 Check merging records when Survivor record selection mode: Was golden and Survivor field is not defined, default merge function is defined
    And I create a child of dataspace "Master Data - Reference>Reference-child" with information as following
      | Identifier | Owner               | English Label |
      | SC-MPMM24  | admin admin (admin) |               |
    And I select dataspace service "View or edit datasets"
    And I access table "National 2" of dataset "Functions"
    When I select some records with primary key as following
      | id |
      | 1  |
      | 2  |
      | 3  |
    And I select table service "Match and Merge>Merge"
    Then record view table will be displayed and highlighted as below
      | id    | Name       |
      | 1     | Nguyen     |
      | 2 {H} | Vien       |
      | 3     | NguynLe{H} |
    And preview table is displayed as below
      | id | Name    |
      | 2  | NguynLe |
    And I see the table name "1. National 2" in dropdown list
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |
    And I complete merging process
    And I access table "RecordMetadata" of dataset "Functions_national2_MDS" in dataspace "Master Data - Reference>Reference-child>SC-MPMM24"
    Then I will see table RecordMetadata as below
      | functionalId | groupId  | state  | autoCreated | isolated |
      | 1            | GROUP_ID | Merged | No          | No       |
      | 2            | GROUP_ID | Golden | No          | No       |
      | 3            | GROUP_ID | Merged | No          | No       |
    Then I will see table MergingProcess as below
      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
      | KEY1 | 693           | Manual    | TODAY         |            | GROUP_ID | admin | No         |
    Then I will see table MergeResult as below
      | id   | recordId | goldenId | mergingProcessId | isInterpolation |
      | KEY1 | 1        | 2        | AUTO_GENARATED   | No              |
      | KEY1 | 3        | 2        | AUTO_GENARATED   | No              |
    Then I will see table Decision as below
      | id   | sourceId | targetId | lastDecision        | user  | decisionDate | mergingProcessId |
      | KEY1 | 1        | 2        | Identified as match | admin | TODAY        | AUTO_GENARATED   |
      | KEY1 | 3        | 2        | Identified as match | admin | TODAY        | AUTO_GENARATED   |
    Then I will see table MergeValueLineage as below
      | id   | mergingProcessId | recordId | sourceIndex | fieldPath | goldenIndex |
      | KEY1 | AUTO_GENARATED   | 3        |             | /Name     |             |
    And I delete the dataspace

  Scenario: SC-MPMM26 Check merging records when Survivor record selection mode: Was golden and all fields are defined as Survivor field , default merge function is defined
    And I create a child of dataspace "Master Data - Reference>Reference-child" with information as following
      | Identifier | Owner               | English Label |
      | SC-MPMM26  | admin admin (admin) |               |
    And I select dataspace service "View or edit datasets"
    And I access table "Table 10" of dataset "Functions"
    When I select some records with primary key as following
      | identifier |
      | 1          |
      | 2          |
      | 3          |
    And I select table service "Match and Merge>Merge"
    Then record view table will be displayed and highlighted as below
      | identifier | Name     | Phone       | National |
      | 1  {H}     | Momo     | 789,456 {H} | UK       |
      | 2          | Kenny{H} | 123,456     | UK       |
      | 3          | Kenny    | 213,456     | FR{H}    |
    And preview table is displayed as below
      | identifier | Name  | Phone   | National |
      | 1          | Kenny | 789,456 | FR       |
    And I see the table name "1. Table 10" in dropdown list
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |
    And I complete merging process
    And I access table "RecordMetadata" of dataset "Functions_Table10_MDS" in dataspace "Master Data - Reference>Reference-child>SC-MPMM26"
    Then I will see table RecordMetadata as below
      | functionalId | groupId  | state  | autoCreated | isolated |
      | 1            | GROUP_ID | Golden | No          | No       |
      | 2            | GROUP_ID | Merged | No          | No       |
      | 3            | GROUP_ID | Merged | No          | No       |
    Then I will see table MergingProcess as below
      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
      | KEY1 | 38            | Manual    | TODAY         |            | GROUP_ID | admin | No         |
    Then I will see table MergeResult as below
      | id   | recordId | goldenId | mergingProcessId | isInterpolation |
      | KEY1 | 2        | 1        | AUTO_GENARATED   | No              |
      | KEY1 | 3        | 1        | AUTO_GENARATED   | No              |
    Then I will see table Decision as below
      | id   | sourceId | targetId | lastDecision        | user  | decisionDate | mergingProcessId |
      | KEY1 | 2        | 1        | Identified as match | admin | TODAY        | AUTO_GENARATED   |
      | KEY1 | 3        | 1        | Identified as match | admin | TODAY        | AUTO_GENARATED   |
    Then I will see table MergeValueLineage as below
      | id   | mergingProcessId | recordId | sourceIndex | fieldPath | goldenIndex |
      | KEY1 | AUTO_GENARATED   | 2        |             | /Name     |             |
      | KEY1 | AUTO_GENARATED   | 3        |             | /National |             |
    And I delete the dataspace

  Scenario: SC-MPMM27 Check merging records when Survivor record selection mode: Was golden and no record with state is golden, Default merge function is defined
    And I create a child of dataspace "Master Data - Reference>Reference-child" with information as following
      | Identifier | Owner               | English Label |
      | SC-MPMM27  | admin admin (admin) |               |
    And I select dataspace service "View or edit datasets"
    And I access table "Table 11" of dataset "Functions"
    When I select some records with primary key as following
      | identifier |
      | 1          |
      | 2          |
      | 3          |
    And I select table service "Match and Merge>Merge"
    Then record view table will be displayed and highlighted as below
      | identifier | Name   | Phone    | National |
      | 1  {H}     | Peo    | 123,456  | FR       |
      | 2          | Slim   | 4,679    | Singapor |
      | 3          | Que{H} | 2,356{H} | UK{H}    |
    And preview table is displayed as below
      | identifier | Name | Phone | National |
      | 1          | Que  | 2,356 | UK       |
    And I see the table name "1. Table 11" in dropdown list
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |
    And I complete merging process
#    And I access table "RecordMetadata" of dataset "Functions_Table11_MDS" in dataspace "Master Data - Reference>Reference-child>SC-MPMM26"
#    Then I will see table RecordMetadata as below
#      | functionalId | groupId  | state  | autoCreated | isolated |
#      | 1            | GROUP_ID | Golden | No          | No       |
#      | 2            | GROUP_ID | Merged | No          | No       |
#      | 3            | GROUP_ID | Merged | No          | No       |
#    Then I will see table MergingProcess as below
#      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
#      | KEY1 | 39            | Manual    | TODAY         |            | GROUP_ID | admin | No         |
#    Then I will see table MergeResult as below
#      | id   | recordId | goldenId | mergingProcessId | isInterpolation |
#      | KEY1 | 2        | 1        | AUTO_GENARATED   | No              |
#      | KEY1 | 3        | 1        | AUTO_GENARATED   | No              |
#    Then I will see table Decision as below
#      | id   | sourceId | targetId | lastDecision        | user  | decisionDate | mergingProcessId |
#      | KEY1 | 2        | 1        | Identified as match | admin | TODAY        | AUTO_GENARATED   |
#      | KEY1 | 3        | 1        | Identified as match | admin | TODAY        | AUTO_GENARATED   |
#    Then I will see table MergeValueLineage as below
#      | id   | mergingProcessId | recordId | sourceIndex | fieldPath | goldenIndex |
#      | KEY1 | AUTO_GENARATED   | 3        |             | /Name     |             |
#      | KEY1 | AUTO_GENARATED   | 3        |             | /Phone    |             |
#      | KEY1 | AUTO_GENARATED   | 3        |             | /National |             |
#    And I delete the dataspace


