Feature: Manual Merge For UAT
  In order to use Manual Merge
  As a user
  I want to specify the feature flow

  Background:
    Given I login to EBX successfully

#  Scenario: UAT-00 General all configurations
#    Given I permit to access matching table
#    And I create record with PK "Publication: Genealogy" is "Person" and the content followings
#      | Data model:DDL         | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
#      | Publication: genealogy | Person    | Yes          |                              | First name       |                    |                       |
#    And I create record with the followings
#      | Data model:DDL         | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
#      | Publication: genealogy | Person    | Yes          |                              | First name       |                    |                       |
#    And I select matching table record of table "Person"
#    And the matching process is configured as the followings
#      | Matching process code | Matching table | Active | Matching execution on creation | Matching execution on update | Merge policy | Advanced settings |
#      | RANDOM                |                | No     | Inline matching                | Inline matching              |              |                   |
#    When I set Merge policy configuration as belows
#      | Merge policy code | Survivor record selection mode | Default merge function | Mode     | Used for manual merge | Apply permission on merge view |
#      | RANDOM            | Most trusted source            | Longest                | Disabled | Yes                   | Yes                            |
#    And I create Survivorship field with selections as followings
#      | Survivorship field code | Field     | Merge function      | Condition for field value survivorship | Execute only if empty |
#      | RANDOM                  | Last name | Most trusted source |                                        | Yes                   |
#    And the Source in Trusted source are
#      | Name of source | Description     |
#      | Pieter         | In Person table |
#    And the Table trusted source with the followings
#      | Matching table | Trusted source list |
#      | Person         | Pieter              |
#    And the Field trusted source with the followings
#      | Matching table | Field     | Trusted source list |
#      | Person         | Last name | Pieter              |
#    And I create a child of dataspace "Master Data - Reference" with information as following
#      | Identifier     | Owner               | English Label |
#      | referenceChild | admin admin (admin) |               |
#    And I access table "Person" of dataset "genealogy" in dataspace "Master Data - Reference > referenceChild"
#    When I select first "2" records in table
#    And I select table service "Match and Merge > Merge"
#    Then record view table will be displayed and highlighted as below
#      | Id                                       | First name   | Last name     | Gender | Residence | Age   | Birth date     | Birth place          |
#      | 0157a930-7725-41d0-b1c4-281b794d38aa {H} | Huibregt     | Heijboer      | {H}    | {H}       | 0 {H} | 10/21/1847 {H} | Poortvliet           |
#      | 06127a07-3d23-4fb1-bd55-f5044873b0f1     | Cornelia {H} | Wagemaker {H} |        |           | 0     | 10/28/1922     | Sint Philipsland {H} |
#    And preview table is displayed as below
#      | Id                                   | First name | Last name | Gender | Residence | Age | Birth date | Birth place      |
#      | 00000435-cc4c-4a1c-9fe4-7690f559bc1c | Cornelia   | Wagemaker |        |           | 0   | 10/21/1847 | Sint Philipsland |
#    And I complete merging process
#    And I access table "RecordMetadata" of dataset "Human_Resource_NewEmployee_MDS" in dataspace "Master Data - Reference>Reference-child>Reference-child_child1"
#    Then I will see table RecordMetadata as below
#      | groupId  | state  | autoCreated | functionalId                         |
#      | GROUP_ID | Golden | No          | 0157a930-7725-41d0-b1c4-281b794d38aa |
#      | GROUP_ID | Merged | No          | 06127a07-3d23-4fb1-bd55-f5044873b0f1 |
#    Then I will see table MergeResult as below
#      | id   | recordId     | goldenId      | mergingProcessId | isInterpolation |
#      | KEY1 | Merge_record | Golden_record | mergingProcessId | No              |
#    Then I will see table Decision as below
#      | id   | sourceId     | targetId      | lastDecision        | user  | decisionDate | mergingProcessId |
#      | KEY1 | Merge_record | Golden_record | Identified as match | admin | decisionDate | mergingProcessId |
#    Then I will see table MergeValueLineage as below
#      | id | mergingProcessId | recordId | sourceIndex | fieldPath | goldenIndex |  |
#      |    |                  |          |             |           |             |  |
#    Then I will see table MergingProcess as below
#      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
#      | KEY1 | 15            | Manual    | executionDate |            | GROUP_ID | admin | no         |
#    And I permit to access matching table
#    And I select the record that contains "Place"
#    Then delete it
#    And delete all of Trusted source configurations
#    And I delete the dataspace

  Scenario: UAT-MM01 Default merge function = Last update
    Given I permit to access matching table
    And I create record with PK "Publication: Genealogy" is "Person" and the content followings
      | Data model:DDL         | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: genealogy | Person    | Yes          |                              |                  |                    |                       |
    And I select matching table record of table "Person"
    When I set Merge policy configuration as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Mode                      | Used for manual merge | Apply permission on merge view |
      | RANDOM            | Last update                    | Last update            | Duplicates and singletons | Yes                   | Yes                            |
    And I click button Save and close
    And I create a child of dataspace "Master Data - Reference" with information as following
      | Identifier     | Owner               | English Label |
      | referenceChild | admin admin (admin) |               |
    And I access table "Person" of dataset "genealogy" in dataspace "Master Data - Reference > referenceChild"
    When I select first "2" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | Id                                   | First name   | Last name     | Gender | Residence | Age   | Birth date     | Birth place          |
      | 0157a930-7725-41d0-b1c4-281b794d38aa | Huibregt     | Heijboer      |        |           | 0     | 10/21/1847     | Poortvliet           |
      | 06127a07-3d23-4fb1-bd55-f5044873b0f1 | Cornelia {H} | Wagemaker {H} | {H}    | {H}       | 0 {H} | 10/28/1922 {H} | Sint Philipsland {H} |
    And preview table is displayed as below
      | Id               | First name | Last name | Gender | Residence | Age | Birth date | Birth place      |
      | [auto generated] | Cornelia   | Wagemaker |        |           | 0   | 10/28/1922 | Sint Philipsland |
    And I complete merging process
    And I close the error popup
    And I delete the dataspace
    And I permit to access matching table
    And I select the record that contains "Person"
    Then delete it

  Scenario: UAT-MM02 Default merge function = Longest
    Given I permit to access matching table
    And I create record with PK "Publication: Genealogy" is "Person" and the content followings
      | Data model:DDL         | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: genealogy | Person    | Yes          |                              |                  |                    |                       |
    And I select matching table record of table "Person"
    When I set Merge policy configuration as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Mode     | Used for manual merge | Apply permission on merge view |
      | RANDOM            | Most complete                  | Longest                | Disabled | Yes                   | Yes                            |
    And I click button Save and close
    And I create a child of dataspace "Master Data - Reference" with information as following
      | Identifier     | Owner               | English Label |
      | referenceChild | admin admin (admin) |               |
    And I access table "Person" of dataset "genealogy" in dataspace "Master Data - Reference > referenceChild"
    When I select first "2" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | Id                                       | First name   | Last name     | Gender | Residence | Age   | Birth date     | Birth place          |
      | 0157a930-7725-41d0-b1c4-281b794d38aa {H} | Huibregt     | Heijboer      | {H}    | {H}       | 0 {H} | 10/21/1847 {H} | Poortvliet           |
      | 06127a07-3d23-4fb1-bd55-f5044873b0f1     | Cornelia {H} | Wagemaker {H} |        |           |       | 10/28/1922     | Sint Philipsland {H} |
    And preview table is displayed as below
      | Id                                   | First name | Last name | Gender | Residence | Age | Birth date | Birth place      |
      | 0157a930-7725-41d0-b1c4-281b794d38aa | Cornelia   | Wagemaker |        |           | 0   | 10/21/1847 | Sint Philipsland |
    And I complete merging process
    And I access table "RecordMetadata" of dataset "genealogy_person_MDS" in dataspace "Master Data - Reference > referenceChild"
    Then I will see table RecordMetadata as below
      | id   | groupId  | state  | autoCreated | functionalId                         |
      | KEY1 | GROUP_ID | Golden | No          | 0157a930-7725-41d0-b1c4-281b794d38aa |
      | KEY2 | GROUP_ID | Merged | No          | 06127a07-3d23-4fb1-bd55-f5044873b0f1 |
    Then I will see table MergingProcess as below
      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
      | KEY1 | 15            | Manual    | TODAY         |            | GROUP_ID | admin | No         |
    Then I will see table MergeResult as below
      | id   | recordId     | goldenId      | mergingProcessId | isInterpolation |
      | KEY1 | Merge_record | Golden_record | mergingProcessId | No              |
    Then I will see table Decision as below
      | id   | sourceId     | targetId      | lastDecision        | user  | decisionDate | mergingProcessId |
      | KEY1 | Merge_record | Golden_record | Identified as match | admin | decisionDate | mergingProcessId |
    Then I will see table MergeValueLineage as below
      | id | mergingProcessId | recordId | sourceIndex | fieldPath | goldenIndex |  |
      |    |                  |          |             |           |             |  |
    And I delete the dataspace
    And I permit to access matching table
    And I select the record that contains "Person"
    Then delete it

  Scenario: UAT-MM03 Default merge function = Max
    Given I permit to access matching table
    And I create record with PK "Publication: Genealogy" is "Place" and the content followings
      | Data model:DDL         | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: genealogy | Place     | Yes          |                              |                  |                    |                       |
    And I select matching table record of table "Place"
    When I set Merge policy configuration as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Mode            | Used for manual merge | Apply permission on merge view |
      | RANDOM            | Most recently acquired         | Max                    | Only duplicates | Yes                   | Yes                            |
    And I click button Save and close
    And I create a child of dataspace "Master Data - Reference" with information as following
      | Identifier     | Owner               | English Label |
      | referenceChild | admin admin (admin) |               |
    And I access table "Place" of dataset "genealogy" in dataspace "Master Data - Reference > referenceChild"
    When I select first "2" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | Id | Name              |
      | 1  | Poortvliet        |
      | 2  | Brouwershaven {H} |
    And preview table is displayed as below
      | Id               | Name          |
      | [auto generated] | Brouwershaven |
    And I complete merging process
    And I access table "RecordMetadata" of dataset "genealogy_place_MDS" in dataspace "Master Data - Reference > referenceChild"
    Then I will see table RecordMetadata as below
      | id   | groupId  | state  | autoCreated | functionalId |
      | KEY1 | GROUP_ID | Merged | No          | 1            |
      | KEY2 | GROUP_ID | Merged | No          | 2            |
#      | KEY3 | GROUP_ID | Golden | Yes         | 50027        |
    Then I will see table MergingProcess as below
      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
      | KEY1 | 15            | Manual    | TODAY         |            | GROUP_ID | admin | No         |
#    Then I will see table MergeResult as below
#      | id   | recordId     | goldenId      | mergingProcessId | isInterpolation |
#      | KEY1 | Merge_record | Golden_record | mergingProcessId | No              |
    Then I will see table Decision as below
      | id   | sourceId     | targetId      | lastDecision        | user  | decisionDate | mergingProcessId |
      | KEY1 | Merge_record | Golden_record | Identified as match | admin | decisionDate | mergingProcessId |
    Then I will see table MergeValueLineage as below
      | id | mergingProcessId | recordId | sourceIndex | fieldPath | goldenIndex |  |
    And I delete the dataspace
    And I permit to access matching table
    And I select the record that contains "Place"
    Then delete it

  Scenario: UAT-MM04 Default merge function = Min
    Given I permit to access matching table
    And I create record with PK "Publication: Genealogy" is "Place" and the content followings
      | Data model:DDL         | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: genealogy | Place     | Yes          |                              |                  |                    |                       |
    And I select matching table record of table "Place"
    When I set Merge policy configuration as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Mode            | Used for manual merge | Apply permission on merge view |
      | RANDOM            | Most trust source              | Min                    | Only duplicates | Yes                   | Yes                            |
    And I click button Save and close
    And I create a child of dataspace "Master Data - Reference" with information as following
      | Identifier     | Owner               | English Label |
      | referenceChild | admin admin (admin) |               |
    And I access table "Place" of dataset "genealogy" in dataspace "Master Data - Reference > referenceChild"
    When I select first "2" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | Id | Name              |
      | 1  | Poortvliet    {H} |
      | 2  | Brouwershaven     |
    And preview table is displayed as below
      | Id               | Name       |
      | [auto generated] | Poortvliet |
    And I complete merging process
    And I access table "RecordMetadata" of dataset "genealogy_place_MDS" in dataspace "Master Data - Reference > referenceChild"
    Then I will see table RecordMetadata as below
      | id   | groupId  | state  | autoCreated | functionalId |
      | KEY1 | GROUP_ID | Merged | No          | 1            |
      | KEY2 | GROUP_ID | Merged | No          | 2            |
#      | KEY3 | GROUP_ID | Golden | Yes         | 50027        |
    Then I will see table MergingProcess as below
      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
      | KEY1 | 15            | Manual    | TODAY         |            | GROUP_ID | admin | No         |
#    Then I will see table MergeResult as below
#      | id   | recordId     | goldenId      | mergingProcessId | isInterpolation |
#      | KEY1 | Merge_record | Golden_record | mergingProcessId | No              |
    Then I will see table Decision as below
      | id   | sourceId     | targetId      | lastDecision        | user  | decisionDate | mergingProcessId |
      | KEY1 | Merge_record | Golden_record | Identified as match | admin | decisionDate | mergingProcessId |
    And I delete the dataspace
    And I permit to access matching table
    And I select the record that contains "Place"
    Then delete it

  Scenario: UAT-MM05 Default merge function = Min
    Given I permit to access matching table
    And I create record with PK "Publication: Genealogy" is "Place" and the content followings
      | Data model:DDL         | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: genealogy | Place     | Yes          |                              |                  |                    |                       |
    And I select matching table record of table "Place"
    When I set Merge policy configuration as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Mode | Used for manual merge | Apply permission on merge view |
      | RANDOM            | Was golden                     | Most frequent          |      | Yes                   | No                             |
    And I click button Save and close
    And I create a child of dataspace "Master Data - Reference" with information as following
      | Identifier     | Owner               | English Label |
      | referenceChild | admin admin (admin) |               |
    And I access table "Place" of dataset "genealogy" in dataspace "Master Data - Reference > referenceChild"
    When I select first "2" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | Id    | Name              |
      | 1 {H} | Poortvliet    {H} |
      | 2     | Brouwershaven     |
    And preview table is displayed as below
      | Id | Name       |
      | 1  | Poortvliet |
    And I complete merging process
    And I delete the dataspace
    And I permit to access matching table
    And I select the record that contains "Place"
    Then delete it

  Scenario: UAT-MM06 Apply permission on merge view = No (Have a field is hidden in data model)
    Given I permit to access matching table
    And I create record with PK "Publication: Metadatas" is "Items" and the content followings
      | Data model:DDL         | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: Metadatas | Items     | Yes          |                              |                  |                    |                       |
    And I select matching table record of table "Items"
    When I set Merge policy configuration as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Mode                      | Used for manual merge | Apply permission on merge view |
      | mergeCodeMM06     | Last update                    | Last update            | Duplicates and singletons | Yes                   | No                             |
    And I create Survivorship field with selections as followings
      | Survivorship field code | Field    | Merge function | Condition for field value survivorship | Execute only if empty |
      | survivorCodeMM06        | Category | Last update    |                                        | Yes                   |
    And I create a child of dataspace "Master Data - Reference" with information as following
      | Identifier      | Owner               | English Label |
      | referenceChild1 | admin admin (admin) |               |
    And I access table "Items" of dataset "Metadatas" in dataspace "Master Data - Reference > referenceChild1"
    When I select first "2" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | Indentifiers | Category      | Brand       | Name             | Available         | defaultPrice | Expire_date             | testSourceField | integer | Hidden_fied |
      | 1            | name1 - 1 {H} | Branh 1 {H} | Minh Tran {H}    | [List] 20/20  {H} | 120,000 {H}  | 04/09/2019 17:29:55 {H} | 2010 {H}        | {H}     | {H}         |
      | 2            | name1 - 1     | Branh 1     | Minh Tran Tranhg | [List] 0/4        | 120          | 04/09/2019 17:04:24     | 2010            |         |             |
    And preview table is displayed as below
      | Indentifiers     | Category  | Brand   | Name      | Available    | defaultPrice | Expire_date         | testSourceField | integer | Hidden_fied |
      | [auto generated] | name1 - 1 | Branh 1 | Minh Tran | [List] 20/24 | 120,000      | 04/09/2019 17:29:55 | 2010            |         |             |
    And I complete merging process
    And I close the error popup
    And I permit to access matching table
    And I select first "1" records in table
    Then delete it

  Scenario: UAT-MM07
    Given I permit to access matching table
    And I create record with PK "Publication: StoreModel" is "Items" and the content followings
      | Data model:DDL          | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: StoreModel | Items     | Yes          |                              |                  |                    |                       |
    And I select matching table record of table "Items"
    When I set Merge policy configuration as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Mode     | Used for manual merge | Apply permission on merge view |
      | RANDOM            | Last update                    |                        | Disabled | Yes                   | Yes                            |
    And I create Survivorship field with selections as followings
      | Survivorship field code | Field         | Merge function | Condition for field value survivorship | Execute only if empty |
      | RANDOM                  | Default price | Max            |                                        | Yes                   |
    And I create a child of dataspace "Master Data - Reference" with information as following
      | Identifier     | Owner               | English Label |
      | referenceChild | admin admin (admin) |               |
    And I access table "Items" of dataset "Stores" in dataspace "Master Data - Reference > referenceChild"
    When I select first "2" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | Identifier | Category      | Brand       | Name           | Available | Default price |
      | 2          | Phones        | Sunny       | Pocket Handy   | true      | 240           |
      | 1 {H}      | Computers {H} | Apricot {H} | Laptop Pro {H} | true {H}  | 720 {H}       |
    And preview table is displayed as below
      | Identifier | Category | Brand | Name         | Available | Default price |
      | 2          | Phones   | Sunny | Pocket Handy | true      | 240           |
    And I complete merging process
    And I access table "RecordMetadata" of dataset "StoreModel_Item_MDS" in dataspace "Master Data - Reference > referenceChild"
    Then I will see table RecordMetadata as below
      | id   | groupId  | state  | autoCreated | functionalId |
      | KEY1 | GROUP_ID | Merged | No          | 1            |
      | KEY2 | GROUP_ID | Golden | No          | 2            |
    Then I will see table MergingProcess as below
      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
      | KEY1 | 15            | Manual    | TODAY         |            | GROUP_ID | admin | No         |
    Then I will see table MergeResult as below
      | id   | recordId     | goldenId      | mergingProcessId | isInterpolation |
      | KEY1 | Merge_record | Golden_record | mergingProcessId | No              |
    Then I will see table Decision as below
      | id   | sourceId     | targetId      | lastDecision        | user  | decisionDate | mergingProcessId |
      | KEY1 | Merge_record | Golden_record | Identified as match | admin | decisionDate | mergingProcessId |
    Then I will see table MergeValueLineage as below
      | id | mergingProcessId | recordId | sourceIndex | fieldPath | goldenIndex |  |
      |    |                  |          |             |           |             |  |
    And I delete the dataspace
    And I permit to access matching table
    And I select the record that contains "Place"
    Then delete it

  Scenario: UAT-MM08
    Given I permit to access matching table
    And I create record with PK "Publication: Genealogy" is "Person" and the content followings
      | Data model:DDL         | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: genealogy | Person    | Yes          |                              |                  |                    |                       |
    And I select matching table record of table "Person"
    When I set Merge policy configuration as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Mode     | Used for manual merge | Apply permission on merge view |
      | RANDOM            | Most recently acquired         |                        | Disabled | Yes                   | Yes                            |
    And I create Survivorship field with selections as followings
      | Survivorship field code | Field | Merge function | Condition for field value survivorship | Execute only if empty |
      | RANDOM                  | Age   | Min            |                                        | Yes                   |
    And I create a child of dataspace "Master Data - Reference" with information as following
      | Identifier     | Owner               | English Label |
      | referenceChild | admin admin (admin) |               |
    And I access table "Person" of dataset "genealogy" in dataspace "Master Data - Reference > referenceChild"
    When I select first "2" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | Id                                        | First name     | Last name     | Gender | Residence | Age | Birth date     | Birth place          |
      | 0157a930-7725-41d0-b1c4-281b794d38aa      | Huibregt       | Heijboer      |        |           | 0   | 10/21/1847     | Poortvliet           |
      | 06127a07-3d23-4fb1-bd55-f5044873b0f1  {H} | Cornelia   {H} | Wagemaker {H} | {H}    | {H}       | {H} | 10/28/1922 {H} | Sint Philipsland {H} |
    And preview table is displayed as below
      | Id                                   | First name | Last name | Gender | Residence | Age | Birth date | Birth place      |
      | 06127a07-3d23-4fb1-bd55-f5044873b0f1 | Cornelia   | Wagemaker |        |           | 0   | 10/28/1922 | Sint Philipsland |
    And I complete merging process
    And I access table "RecordMetadata" of dataset "genealogy_person_MDS" in dataspace "Master Data - Reference > referenceChild"
    Then I will see table RecordMetadata as below
      | id   | groupId  | state  | autoCreated | functionalId                         | isolated |
      | KEY1 | GROUP_ID | Merged | No          | 0157a930-7725-41d0-b1c4-281b794d38aa | No       |
      | KEY2 | GROUP_ID | Golden | No          | 06127a07-3d23-4fb1-bd55-f5044873b0f1 | No       |
    Then I will see table MergingProcess as below
      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
      | KEY1 | 15            | Manual    | TODAY         |            | GROUP_ID | admin | No         |
    Then I will see table MergeResult as below
      | id   | recordId     | goldenId      | mergingProcessId | isInterpolation |
      | KEY1 | Merge_record | Golden_record | mergingProcessId | No              |
    Then I will see table Decision as below
      | id   | sourceId     | targetId      | lastDecision        | user  | decisionDate | mergingProcessId |
      | KEY1 | Merge_record | Golden_record | Identified as match | admin | decisionDate | mergingProcessId |
    Then I will see table MergeValueLineage as below
      | id | mergingProcessId | recordId | sourceIndex | fieldPath | goldenIndex |  |
      |    |                  |          |             |           |             |  |
    And I delete the dataspace
    And I permit to access matching table
    And I select the record that contains "Place"
    Then delete it

  Scenario: UAT-MM09
    Given I permit to access matching table
    And I create record with PK "Publication: Genealogy" is "Person" and the content followings
      | Data model:DDL         | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: genealogy | Person    | Yes          |                              |                  |                    |                       |
    And I select matching table record of table "Person"
    When I set Merge policy configuration as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Mode | Used for manual merge | Apply permission on merge view |
      | RANDOM            | Most trust source              |                        |      | Yes                   | No                             |
    And I create Survivorship field with selections as followings
      | Survivorship field code | Field      | Merge function | Condition for field value survivorship | Execute only if empty |
      | RANDOM                  | First name | Most frequent  |                                        | Yes                   |
    And I create a child of dataspace "Master Data - Reference" with information as following
      | Identifier     | Owner               | English Label |
      | referenceChild | admin admin (admin) |               |
    And I access table "Person" of dataset "genealogy" in dataspace "Master Data - Reference > referenceChild"
    When I select first "2" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | Id                                         | First name   | Last name    | Gender | Residence | Age   | Birth date     | Birth place        |
      | 0157a930-7725-41d0-b1c4-281b794d38aa   {H} | Huibregt {H} | Heijboer {H} | {H}    | {H}       | 0 {H} | 10/21/1847 {H} | Poortvliet     {H} |
      | 06127a07-3d23-4fb1-bd55-f5044873b0f1       | Cornelia     | Wagemaker    |        |           |       | 10/28/1922     | Sint Philipsland   |
    And preview table is displayed as below
      | Id                                   | First name | Last name | Gender | Residence | Age | Birth date | Birth place |
      | 0157a930-7725-41d0-b1c4-281b794d38aa | Huibregt   | Heijboer  |        |           | 0   | 10/21/1847 | Poortvliet  |
    And I complete merging process
    And I access table "RecordMetadata" of dataset "genealogy_person_MDS" in dataspace "Master Data - Reference > referenceChild"
    Then I will see table RecordMetadata as below
      | id   | groupId  | state  | autoCreated | functionalId                         | isolated |
      | KEY1 | GROUP_ID | Golden | No          | 0157a930-7725-41d0-b1c4-281b794d38aa | No       |
      | KEY2 | GROUP_ID | Merged | No          | 06127a07-3d23-4fb1-bd55-f5044873b0f1 | No       |
    Then I will see table MergingProcess as below
      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |
      | KEY1 | 15            | Manual    | TODAY         |            | GROUP_ID | admin | No         |
    Then I will see table MergeResult as below
      | id   | recordId     | goldenId      | mergingProcessId | isInterpolation |
      | KEY1 | Merge_record | Golden_record | mergingProcessId | No              |
    Then I will see table Decision as below
      | id   | sourceId     | targetId      | lastDecision        | user  | decisionDate | mergingProcessId |
      | KEY1 | Merge_record | Golden_record | Identified as match | admin | decisionDate | mergingProcessId |
    Then I will see table MergeValueLineage as below
      | id | mergingProcessId | recordId | sourceIndex | fieldPath | goldenIndex |  |
      |    |                  |          |             |           |             |  |
    And I delete the dataspace
    And I permit to access matching table
    And I select the record that contains "Person"
    Then delete it

  Scenario: UAT-MM10
    Given I permit to access matching table
    And I create record with PK "Publication: Genealogy" is "Place" and the content followings
      | Data model:DDL         | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: genealogy | Place     | Yes          |                              |                  |                    |                       |
    And I select matching table record of table "Place"
    When I set Merge policy configuration as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Mode | Used for manual merge | Apply permission on merge view |
      | RANDOM            | Was golden                     |                        |      | Yes                   | No                             |
    And I create Survivorship field with selections as followings
      | Survivorship field code | Field | Merge function      | Condition for field value survivorship | Execute only if empty |
      | RANDOM                  | Name  | Most trusted source |                                        | Yes                   |
    And I create a child of dataspace "Master Data - Reference" with information as following
      | Identifier     | Owner               | English Label |
      | referenceChild | admin admin (admin) |               |
    And I access table "Place" of dataset "genealogy" in dataspace "Master Data - Reference > referenceChild"
    When I select first "2" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | Id    | Name              |
      | 1 {H} | Poortvliet    {H} |
      | 2     | Brouwershaven     |
    And preview table is displayed as below
      | Id | Name       |
      | 1  | Poortvliet |
    And I complete merging process
    And I delete the dataspace
    And I permit to access matching table
    And I select the record that contains "Place"
    Then delete it
