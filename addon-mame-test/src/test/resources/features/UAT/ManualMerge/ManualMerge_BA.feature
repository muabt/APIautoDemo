@UAT_BA
Feature: Manual Merge
  A data steward identifies some duplicates,
  so that he wants to merge them. However, he was not sucessful to do it due to some errors.

  Background:
    Given I login to EBX successfully
    And I create a child of dataspace "Master Data - Reference>UAT" with information as following
      | Identifier | Owner               | English Label |
      | UAT-Child  | admin admin (admin) |               |

  Scenario: UC01 Merge unsuccessful - verify how the add-on handles error - Entry condition
    And I permit to access matching table
    And I create record in Matching table with the content followings
      | Data model:DDL          | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: StoreModel | Items     | Yes          |                              |                  |                    |                       |
    When I set Merge policy configuration as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Mode                      | Used for manual merge | Apply permission on merge view |
      | RANDOM            | Most trusted source            | Most trusted source    | Duplicates and singletons | Yes                   | Yes                            |
    And I access table "Items" of dataset "Stores" in dataspace "UAT-Child"
    When I want to merge some records with primary key as following
      | Identifier |
      | 2          |
      | 3          |
      | 48         |
    Then I should see dialog box with title is "Merge" and content is "At least two records, different from 'Merged' or 'Deleted', must be selected."

  Scenario: UC02 Merge unsuccessful to verify how the add-on handles error merge failed due to blocking errors
    And I permit to access matching table
    And I create record in Matching table with the content followings
      | Data model:DDL          | Table:DDL   | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: StoreModel | Inventories | Yes          |                              |                  |                    |                       |
    When I set Merge policy configuration as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Mode                      | Used for manual merge | Apply permission on merge view |
      | RANDOM            | Most trusted source            | Most trusted source    | Duplicates and singletons | Yes                   | Yes                            |
    And I access table "Inventories" of dataset "Stores" in dataspace "UAT-Child"
    When I want to merge some records with primary key as following
      | Item         | Store       |
      | Star Cooker  | Cook Store  |
      | Pocket Handy | Phone Depot |
    Then merge process will be blocked with exception message "Cannot create a new occurrence because primary key has undefined elements: osd:is-null(./item) and osd:is-null(./store)."

  Scenario: UC03 Able to merge successful without merge policy defined for manual merge
    Given I permit to access matching table
    And I create record in Matching table with the content followings
      | Data model:DDL          | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: StoreModel | Stores    | Yes          |                              |                  |                    |                       |
    And I access table "Stores" of dataset "Stores" in dataspace "UAT-Child"
    When I want to merge some records with primary key as following
      | Identifier |
      | 1          |
      | 2          |
    Then record view table will be displayed and highlighted as below
      | Identifier | Name            | Type | Street              | City   | State | Postcode | Country       |
      | 1          | Computer Market |      | 56 Kendall Square   | Boston | MA    | 12870    | United States |
      | 2          | Phone Depot     |      | 19 Brookline Avenue | Austin | TX    | 84743    | United States |
    And preview table is displayed as below
      | Identifier | Name | Type | Street | City | State | Postcode | Country |
      |            |      |      |        |      |       |          |         |
    When I decide to select value for golden record as following
      | Identifier |
      | 1          |
    And records should be merged successful
    And I access table "RecordMetadata" of dataset "StoreModel_Store_MDS" in dataspace "UAT > UAT-Child"
    Then I will see table RecordMetadata as below
      | functionalId | groupId  | state  | autoCreated |
      | 1            | GROUP_ID | Golden | No          |
      | 2            | GROUP_ID | Merged | No          |
    Then I will see table MergeResult as below
      | recordId | goldenId | mergingProcessId | isInterpolation |
      | 2        | 1        | [AUTO_GENERATED] | No              |
    Then I will see table MergingProcess as below
      | id   | mergePolicyId | mergeMode | executionDate | snapshotId | user  | isUnmerged |
      | KEY1 |               | Manual    | TODAY         |            | admin | No         |
    Then I will see table Decision as below
      | id   | sourceId | targetId | lastDecision        | user  | decisionDate | mergingProcessId |
      | KEY1 | 2        | 1        | Identified as match | admin | TODAY        | [AUTO_GENERATED] |
    Then no records found in table "MergeValueLineage"

  Scenario: UC04 Auto create will always be prioritized & pre-selected to be a Golden even no merge policy is defined
    Given I permit to access matching table
    And I create record in Matching table with the content followings
      | Data model:DDL          | Table:DDL  | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: StoreModel | Categories | Yes          |                              |                  |                    |                       |
    And I access table "Categories" of dataset "Stores" in dataspace "UAT-Child"
    When I want to merge some records with primary key as following
      | Identifier |
      | 1          |
      | 55         |
    Then record view table will be displayed and highlighted as below
      | Identifier | Parent         | Name        | Comment |
      | 1          |                | Electronics |         |
      | 55{H}      | Appliances {H} | Cooking {H} | {H}     |
    And preview table which has auto created PK is displayed as below
      | Identifier | Parent     | Name    | Comment |
      | 55         | Appliances | Cooking |         |
    And records should be merged successful
    And I access table "RecordMetadata" of dataset "StoreModel_Category_MDS" in dataspace "UAT > UAT-Child"
    Then I will see table RecordMetadata as below
      | functionalId | groupId  | state  | autoCreated |
      | 1            | GROUP_ID | Merged | No          |
      | 5            | GROUP_ID | Merged | No          |
      | 6            | GROUP_ID | Merged | No          |
      | 55           | GROUP_ID | Golden | Yes         |
    Then I will see table MergeResult as below
      | recordId | goldenId | mergingProcessId | isInterpolation |
      | 1        | 55       | [AUTO_GENERATED] | No              |
      | 5        | 55       | [AUTO_GENERATED] | Yes             |
      | 6        | 55       | [AUTO_GENERATED] | Yes             |
    Then I will see table MergingProcess as below
      | Id               | mergePolicyId | mergeMode | executionDate | snapshotId | user  | isUnmerged |
      | [AUTO_GENERATED] |               | Manual    | TODAY         |            | admin | No         |
    Then I will see table Decision as below
      | id   | sourceId | targetId | lastDecision        | user  | decisionDate | mergingProcessId |
      | KEY1 | 1        | 55       | Identified as match | admin | TODAY        | [AUTO_GENERATED] |
    And no records found in table "MergeValueLineage"

  @issue:MAME-3467
  Scenario: UC05 Data is merged successful following merge policy defined for manual merge
    Given I permit to access matching table
    And I create record in Matching table with the content followings
      | Data model:DDL              | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: Human_Resource | Employee  | Yes          |                              |                  |                    |                       |
    When I set Merge policy configuration as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Mode     | Used for manual merge | Apply permission on merge view |
      | UC05              | Most complete                  | [not defined]          | Disabled | Yes                   | Yes                            |
    And I create Survivorship field with selections as followings
      | Survivorship field code | Field                 | Merge function | Condition for field value survivorship               | Execute only if empty |
      | F1                      | Date of birth         | Max            | osd:is-null(./phone) and osd:is-not-null(./National) | No                    |
      | F2                      | Supervisor            | Longest        |                                                      | Yes                   |
      | F3                      | Date and time created | Min            |                                                      | Yes                   |
    And I access table "Employee" of dataset "Human_Resource" in dataspace "UAT > UAT-Child"
    When I want to merge some records with primary key as following
      | Identifier |
      | 1          |
      | 2          |
      | 3          |
      | 19         |
    Then record view table will be displayed and highlighted as below
      | Identifier | Date of birth   | National | Phone Number    | Email          | Rank     | Supervisor    | Date and time created    | Name   | Comments | PIT            | Assurance number | Employee |
      | 1          | 04/11/1987      | US       |                 |                | 1        | Jasmine   {H} |                          | Davied |          | 54354410564036 | 4204365065063    |          |
      | 2    {H}   | 04/03/1989      | VN  {H}  | 54565326654 {H} | [List] 0/1 {H} | 1    {H} |               | 04/11/2019 17:15:40  {H} | {H}    | {H}      | 556652387  {H} | 5317485785   {H} | {H}      |
      | 3          | 02/07/1995  {H} | FR       |                 |                | 1.5      | OP            | 04/11/2018 17:20:59      |        |          | 85789685625    | 7871998439671    |          |
    And preview table which has auto created PK is displayed as below
      | Identifier | Date of birth | National | Phone Number | Email      | Rank | Supervisor | Date and time created | Name | Comments | PIT       | Assurance number | Employee |
      | 2          | 02/07/1995    | VN       | 54565326654  | [List] 0/1 | 1    | Jasmine    | 04/11/2019 17:15:40   |      |          | 556652387 | 5317485785       |          |
    And records should be merged successful
    And I access table "RecordMetadata" of dataset "StoreModel_Category_MDS" in dataspace "UAT > UAT-Child"
    Then I will see table RecordMetadata as below
      | functionalId | groupId  | state   | autoCreated |
      | 1            | GROUP_ID | Merged  | No          |
      | 2            | GROUP_ID | Golden  | No          |
      | 3            | GROUP_ID | Merged  | No          |
      | 19           | GROUP_ID | Deleted | Yes         |
    Then I will see table MergeResult as below
      | recordId | goldenId | mergingProcessId | isInterpolation |
      | 1        | 2        | [AUTO_GENERATED] | No              |
      | 3        | 2        | [AUTO_GENERATED] | No              |
    Then I will see table MergingProcess as below
      | Id               | mergePolicyId    | mergeMode | executionDate | snapshotId | user  | isUnmerged |
      | [AUTO_GENERATED] | [AUTO_GENERATED] | Manual    | TODAY         |            | admin | No         |
    Then I will see table Decision as below
      | id               | sourceId | targetId | lastDecision        | user  | decisionDate | mergingProcessId |
      | [AUTO_GENERATED] | 1        | 2        | Identified as match | admin | TODAY        | [AUTO_GENERATED] |
      | [AUTO_GENERATED] | 3        | 2        | Identified as match | admin | TODAY        | [AUTO_GENERATED] |
    And no records found in table "MergeValueLineage"

  Scenario: UC06 Merged records is not participated in the manual merge process but it will follow its Golden to move to a new group after mergeing
    Given I permit to access matching table
    And I create record in Matching table with the content followings
      | Data model:DDL         | Table:DDL | Active:RADIO |
      | Publication: Genealogy | Person    | Yes          |
    When I set Merge policy configuration as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Mode     | Used for manual merge | Apply permission on merge view |
      | UC06              | Last update                    | Longest                | Disabled | Yes                   | Yes                            |
    And I create Survivorship field with selections as followings
      | Survivorship field code | Field      | Merge function | Condition for field value survivorship | Execute only if empty |
      | UC06                    | First name | Most frequent  |                                        | Yes                   |
    And I access table "Person" of dataset "genealogy" in dataspace "UAT-Child"
    When I want to merge some records with primary key is filtered as following
      | Id                                   |
      | d495ceb9-e2fe-4350-8e0e-3f630ade2ee9 |
      | 13847121-e45d-46d4-b061-8440cfc187ff |
      | 73f646d9-f2de-43a5-acef-69b5547b3f4a |
    Then record view table will be displayed and highlighted as below
      | Id                                       | First name         | Last name       | Gender | Residence | Age    | Birth date     | Birth place       |
      | 13847121-e45d-46d4-b061-8440cfc187ff     | Marinus Pieter {H} | Lindhoudt       |        |           | 0      | 08/10/1933     | Oud-Vossemeer {H} |
      | 73f646d9-f2de-43a5-acef-69b5547b3f4a     | Marinus            | Heijboer        |        |           | 0      | 01/27/1857     | Poortvliet        |
      | d495ceb9-e2fe-4350-8e0e-3f630ade2ee9 {H} | Maris              | Goudzwaard  {H} | {H}    | {H}       | 0  {H} | 08/16/1895 {H} | Poortvliet        |
    And preview table is displayed as below
      | Id                                   | First name     | Last name  | Gender | Residence | Age | Birth date | Birth place   |
      | d495ceb9-e2fe-4350-8e0e-3f630ade2ee9 | Marinus Pieter | Goudzwaard |        |           | 0   | 08/16/1895 | Oud-Vossemeer |
    And records should be merged successful
    When I want to merge some records with primary key is filtered as following
      | Id                                   |
      | c633d1a0-74ae-4e65-9efd-378e27682683 |
      | 9f842bd5-2935-40ba-ad41-ccd7634fb28c |
      | d495ceb9-e2fe-4350-8e0e-3f630ade2ee9 |
      | 13847121-e45d-46d4-b061-8440cfc187ff |
      | 73f646d9-f2de-43a5-acef-69b5547b3f4a |
    Then record view table will be displayed and highlighted as below
      | Id                                       | First name         | Last name      | Gender | Residence | Age   | Birth date     | Birth place       |
      | 9f842bd5-2935-40ba-ad41-ccd7634fb28c     | Marinis            | Kerpel         |        |           | 11    |                | Fijnaart          |
      | c633d1a0-74ae-4e65-9efd-378e27682683     | Marinus            | Kunst          |        |           | 0     | 04/18/1804     | Oud-Vossemeer     |
      | d495ceb9-e2fe-4350-8e0e-3f630ade2ee9 {H} | Marinus Pieter {H} | Goudzwaard {H} | {H}    | {H}       | 0 {H} | 08/16/1895 {H} | Oud-Vossemeer {H} |
    And preview table is displayed as below
      | Id                                   | First name     | Last name  | Gender | Residence | Age | Birth date | Birth place   |
      | d495ceb9-e2fe-4350-8e0e-3f630ade2ee9 | Marinus Pieter | Goudzwaard |        |           | 0   | 08/16/1895 | Oud-Vossemeer |
    And records should be merged successful
    And I access table "RecordMetadata" of dataset "genealogy_person_MDS" in dataspace "UAT > UAT-Child"
    Then I will see table RecordMetadata as below
      | functionalId                         | groupId  | state  | autoCreated |
      | 13847121-e45d-46d4-b061-8440cfc187ff | GROUP_ID | Merged | No          |
      | 73f646d9-f2de-43a5-acef-69b5547b3f4a | GROUP_ID | Merged | No          |
      | 9f842bd5-2935-40ba-ad41-ccd7634fb28c | GROUP_ID | Merged | No          |
      | c633d1a0-74ae-4e65-9efd-378e27682683 | GROUP_ID | Merged | No          |
      | d495ceb9-e2fe-4350-8e0e-3f630ade2ee9 | GROUP_ID | Golden | No          |
    Then I will see table MergeResult as below
      | recordId                             | goldenId                             | mergingProcessId | isInterpolation |
      | 13847121-e45d-46d4-b061-8440cfc187ff | d495ceb9-e2fe-4350-8e0e-3f630ade2ee9 | [AUTO_GENERATED] | Yes             |
      | 73f646d9-f2de-43a5-acef-69b5547b3f4a | d495ceb9-e2fe-4350-8e0e-3f630ade2ee9 | [AUTO_GENERATED] | Yes             |
      | 9f842bd5-2935-40ba-ad41-ccd7634fb28c | d495ceb9-e2fe-4350-8e0e-3f630ade2ee9 | [AUTO_GENERATED] | No              |
      | c633d1a0-74ae-4e65-9efd-378e27682683 | d495ceb9-e2fe-4350-8e0e-3f630ade2ee9 | [AUTO_GENERATED] | No              |
    Then I will see table MergingProcess as below
      | Id               | mergePolicyId    | mergeMode | executionDate | snapshotId | user  | isUnmerged |
      | [AUTO_GENERATED] | [AUTO_GENERATED] | Manual    | TODAY         |            | admin | No         |
    Then I will see table Decision as below
      | id   | sourceId                             | targetId                             | lastDecision        | user  | decisionDate | mergingProcessId |
      | KEY1 | 9f842bd5-2935-40ba-ad41-ccd7634fb28c | d495ceb9-e2fe-4350-8e0e-3f630ade2ee9 | Identified as match | admin | TODAY        | [AUTO_GENERATED] |
      | KEY1 | c633d1a0-74ae-4e65-9efd-378e27682683 | d495ceb9-e2fe-4350-8e0e-3f630ade2ee9 | Identified as match | admin | TODAY        | [AUTO_GENERATED] |
    And no records found in table "MergeValueLineage"

  Scenario: UC07 Merge successful with a new auto golden created after the merge
    Given I permit to access matching table
    And the Source in Trusted source are
      | Name of source | Description |
      | Source         | Source      |
      | Field          | Field       |
      | Lily           | Lily        |
    Given I permit to access matching table
    And I create record in Matching table with the content followings
      | Data model:DDL              | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: Human_Resource | Employee  | Yes          |                              | Name             |                    |                       |
    When I set Merge policy configuration as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Mode                      | Used for manual merge | Apply permission on merge view | Customize source value for new golden |
      | UC08              | Most trusted source            | Most trusted source    | Duplicates and singletons | Yes                   | Yes                            | Lily                                  |
    And the Table trusted source with the followings
      | Matching table | Trusted source list |
      | Employee       | Source              |
    And the Field trusted source with the followings
      | Matching table | Field    | Trusted source list |
      | Employee       | Comments | Field               |
    And I access table "Employee" of dataset "Human_Resource" in dataspace "UAT>UAT-Child"
    When I want to merge some records with primary key as following
      | Identifier |
      | 29         |
      | 30         |
    Then record view table will be displayed and highlighted as below
      | Identifier | Name   | Date of birth    | National | Phone Number   | Email          | Rank   | Supervisor | Date and time created    | Comments                    | PIT        | Assurance number | Employee |
      | 29         | Source | 05/02/2019   {H} | FR  {H}  | 0962555823 {H} | [List] 1/1 {H} | 5  {H} | Thanh {H}  | 05/02/2019 10:44:49  {H} | nothing                     | 1255999{H} | 5555555    {H}   | {H}      |
      | 30         | Field  | 05/12/1992       | US       | 0965478965     |                | 1.5    | Steve      | 06/05/2019 00:00:00      | Check for trusted field {H} |            |                  |          |
    Then preview table is displayed as below
      | Identifier       | Name | Date of birth | National | Phone Number | Email      | Rank | Supervisor | Date and time created | Comments                | PIT     | Assurance number | Employee |
      | [auto generated] | Lily | 05/02/2019    | FR       | 0962555823   | [List] 1/1 | 5    | Thanh      | 05/02/2019 10:44:49   | Check for trusted field | 1255999 | 5555555          |          |
    And records should be merged successful
    And I access table "RecordMetadata" of dataset "Human_Resource_employee_MDS" in dataspace "UAT > UAT-Child"
    Then I will see table RecordMetadata as below
      | functionalId | groupId  | state  | autoCreated |
      | 29           | GROUP_ID | Merged | No          |
      | 30           | GROUP_ID | Merged | No          |
      |              | GROUP_ID | Golden | Yes         |
    Then I will see table MergeResult as below
      | recordId | goldenId         | mergingProcessId | isInterpolation |
      | 29       | [AUTO_GENERATED] | [AUTO_GENERATED] | No              |
      | 30       | [AUTO_GENERATED] | [AUTO_GENERATED] | No              |
    Then I will see table MergingProcess as below
      | Id               | mergePolicyId    | mergeMode | executionDate | snapshotId | user  | isUnmerged |
      | [AUTO_GENERATED] | [AUTO_GENERATED] | Manual    | TODAY         |            | admin | No         |
    Then I will see table Decision as below
      | id               | sourceId | targetId         | lastDecision        | user  | decisionDate | mergingProcessId |
      | [AUTO_GENERATED] | 29       | [AUTO_GENERATED] | Identified as match | admin | TODAY        | [AUTO_GENERATED] |
      | [AUTO_GENERATED] | 30       | [AUTO_GENERATED] | Identified as match | admin | TODAY        | [AUTO_GENERATED] |
    Then I will see table MergeValueLineage as below
      | id               | mergingProcessId | recordId | sourceIndex | fieldPath           | goldenIndex |
      | [AUTO_GENERATED] | [AUTO_GENERATED] | 29       |             | /birth              |             |
      | [AUTO_GENERATED] | [AUTO_GENERATED] | 29       |             | /National           |             |
      | [AUTO_GENERATED] | [AUTO_GENERATED] | 29       |             | /phone              |             |
      | [AUTO_GENERATED] | [AUTO_GENERATED] | 29       | 0           | /email              | 0           |
      | [AUTO_GENERATED] | [AUTO_GENERATED] | 29       |             | /rank               |             |
      | [AUTO_GENERATED] | [AUTO_GENERATED] | 29       |             | /supervisor         |             |
      | [AUTO_GENERATED] | [AUTO_GENERATED] | 29       |             | /dateNtime          |             |
      | [AUTO_GENERATED] | [AUTO_GENERATED] | 30       |             | /Comments           |             |
      | [AUTO_GENERATED] | [AUTO_GENERATED] | 29       |             | /Personal/pit       |             |
      | [AUTO_GENERATED] | [AUTO_GENERATED] | 29       |             | /Personal/assurance |             |
      | [AUTO_GENERATED] | [AUTO_GENERATED] | 29       |             | /Personal/employee  |             |

  Scenario: UC08 Merge successful several existing auto create records
    Given I permit to access matching table
    And I create record in Matching table with the content followings
      | Data model:DDL              | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: Human_Resource | Employee  | Yes          |                              |                  |                    |                       |
    When I set Merge policy configuration as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Mode                      | Used for manual merge | Apply permission on merge view |
      | UC08              | Most complete                  | [not defined]          | Duplicates and singletons | Yes                   | Yes                            |
    And I access table "Employee" of dataset "Human_Resource" in dataspace "UAT>UAT-Child"
    When I want to merge some records with primary key as following
      | Identifier |
      | 25         |
      | 26         |
      | 11         |
    Then record view table will be displayed and highlighted as below
      | Identifier | Date of birth  | National | Phone Number   | Email          | Rank     | Supervisor  | Date and time created    | Name      | Comments                      | PIT           | Assurance number | Employee |
      | 11         | 04/25/2019     | UK       | 45661895565556 | [List] 0/1     | 5        |             |                          |           |                               | 13757477      | 8578578878       |          |
      | 25    {H}  | 04/25/2019 {H} | UK  {H}  | {H}            | [List] 1/1 {H} | 5    {H} | Vincent {H} | 04/25/2019 11:25:09  {H} | Zoe.vu{H} | Auto Created, State=Golden{H} | 13757477  {H} | 8578578878   {H} | {H}      |
      | 26         | 05/02/2019     | FR       | 0962555823     | [List] 0/2     | 5        | Thanh       | 05/02/2019 10:44:49      | Lily      | Auto created. State=Golden    | 1255999       | 5555555          |          |
    When multi value field "Email" is defined as below
      | Field label | Selected value |
      | Lily        | lily@gmail.com |
      | Zoe.vu      | alex@mail.com  |
    Then preview table is displayed as below
      | Identifier | Date of birth | National | Phone Number | Email      | Rank | Supervisor | Date and time created | Name   | Comments                   | PIT      | Assurance number | Employee |
      | 25         | 04/25/2019    | UK       |              | [List] 2/4 | 5    | Vincent    | 04/25/2019 11:25:09   | Zoe.vu | Auto Created, State=Golden | 13757477 | 8578578878       |          |
    And records should be merged successful
    And I access table "RecordMetadata" of dataset "Human_Resource_employee_MDS" in dataspace "UAT > UAT-Child"
    Then I will see table RecordMetadata as below
      | functionalId | groupId  | state  | autoCreated |
      | 11           | GROUP_ID | Merged | No          |
      | 21           | GROUP_ID | Merged | No          |
      | 22           | GROUP_ID | Merged | No          |
      | 23           | GROUP_ID | Merged | No          |
      | 24           | GROUP_ID | Merged | No          |
      | 25           | GROUP_ID | Golden | Yes         |
      | 26           | GROUP_ID | Merged | Yes         |
    Then I will see table MergeResult as below
      | recordId | goldenId | mergingProcessId | isInterpolation |
      | 11       | 25       | [AUTO_GENERATED] | No              |
      | 21       | 25       | [AUTO_GENERATED] | Yes             |
      | 22       | 25       | [AUTO_GENERATED] | Yes             |
      | 23       | 25       | [AUTO_GENERATED] | Yes             |
      | 24       | 25       | [AUTO_GENERATED] | Yes             |
      | 26       | 25       | [AUTO_GENERATED] | No              |
    Then I will see table MergingProcess as below
      | Id               | mergePolicyId    | mergeMode | executionDate | snapshotId | user  | isUnmerged |
      | [AUTO_GENERATED] | [AUTO_GENERATED] | Manual    | TODAY         |            | admin | No         |
    Then I will see table Decision as below
      | id               | sourceId | targetId | lastDecision        | user  | decisionDate | mergingProcessId |
      | [AUTO_GENERATED] | 11       | 25       | Identified as match | admin | TODAY        | [AUTO_GENERATED] |
      | [AUTO_GENERATED] | 26       | 25       | Identified as match | admin | TODAY        | [AUTO_GENERATED] |
    Then I will see table MergeValueLineage as below
      | id               | mergingProcessId | recordId | sourceIndex | fieldPath | goldenIndex |
      | [AUTO_GENERATED] | MERGE_PROCESS_ID | 25       | 0           | /email    | 0           |
      | [AUTO_GENERATED] | MERGE_PROCESS_ID | 26       | 1           | /email    | 1           |


  Scenario: UC09 Merge successful several records belonging to some existing groups
    Given I permit to access matching table
    And I create record in Matching table with the content followings
      | Data model:DDL              | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: Human_Resource | Workers   | Yes          |                              |                  |                    |                       |
    When I set Merge policy configuration as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Mode     | Used for manual merge | Apply permission on merge view |
      | UC08              | Most complete                  | Last update            | Disabled | Yes                   | Yes                            |
    And I access table "Workers" of dataset "Human_Resource" in dataspace "UAT>UAT-Child"
    When I want to merge some records with primary key as following
      | Identifier |
      | 22         |
      | 25         |
      | 30         |
    Then record view table will be displayed and highlighted as below
      | Identifier | Date of birth  | National | Phone Number   | Email      | Rank      | Supervisor  | Date and time created     | Name      | Comments                    | PIT      | Assurance number | Employee |
      | 22 {H}     | 05/02/2019     | FR       | 09625558       | [List] 0/1 | 5         | Thanhh      | 05/02/2019 10:44:49       | Lily      |                             | 1255999  | 5555555          |          |
      | 25         | 04/25/2019     | UK       |                | [List] 0/1 | 5         | Vincent     | 04/25/2019 11:25:09       | Zoe.vu    | Auto Created, State=Golden  | 13757477 | 8578578878       |          |
      | 30         | 05/12/1992 {H} | US  {H}  | 0965478965 {H} | {H}        | 1.5   {H} | Steve   {H} | 06/05/2019 00:00:00   {H} | Field {H} | Check for trusted field {H} | {H}      | {H}              | {H}      |
    Then preview table is displayed as below
      | Identifier | Date of birth | National | Phone Number | Email      | Rank | Supervisor | Date and time created | Name  | Comments                | PIT | Assurance number | Employee |
      | 22         | 05/12/1992    | US       | 0965478965   | [List] 0/2 | 1.5  | Steve      | 06/05/2019 00:00:00   | Field | Check for trusted field |     |                  |          |
    And records should be merged successful
    And I access table "RecordMetadata" of dataset "Human_Resource_worker_MDS" in dataspace "UAT > UAT-Child"
    Then I will see table RecordMetadata as below
      | functionalId | groupId          | state  | autoCreated | isolated |
      | 22           | 1613435459694592 | Golden | No          | No       |
      | 25           | 1613435459694592 | Merged | No          | No       |
      | 30           | 1613435459694592 | Merged | No          | No       |
    Then I will see table MergeResult as below
      | recordId | goldenId | mergingProcessId | isInterpolation |
      | 25       | 22       | [AUTO_GENERATED] | No              |
      | 30       | 22       | [AUTO_GENERATED] | No              |
    Then I will see table MergingProcess as below
      | Id               | mergePolicyId    | mergeMode | executionDate | snapshotId | user  | isUnmerged |
      | [AUTO_GENERATED] | [AUTO_GENERATED] | Manual    | TODAY         |            | admin | No         |
    Then I will see table Decision as below
      | id               | sourceId | targetId | lastDecision        | user  | decisionDate | mergingProcessId |
      | [AUTO_GENERATED] | 25       | 22       | Identified as match | admin | TODAY        | [AUTO_GENERATED] |
      | [AUTO_GENERATED] | 30       | 22       | Identified as match | admin | TODAY        | [AUTO_GENERATED] |
    Then I will see table MergeValueLineage as below
      | id               | mergingProcessId | recordId | sourceIndex | fieldPath           | goldenIndex |
      | [AUTO_GENERATED] | MERGE_PROCESS_ID | 30       |             | /National           |             |
      | [AUTO_GENERATED] | MERGE_PROCESS_ID | 26       |             | /phone              |             |
      | [AUTO_GENERATED] | MERGE_PROCESS_ID | 26       |             | /rank               |             |
      | [AUTO_GENERATED] | MERGE_PROCESS_ID | 26       |             | /supervisor         |             |
      | [AUTO_GENERATED] | MERGE_PROCESS_ID | 26       |             | /dateNtime          |             |
      | [AUTO_GENERATED] | MERGE_PROCESS_ID | 26       |             | /Name               |             |
      | [AUTO_GENERATED] | MERGE_PROCESS_ID | 26       |             | /Comments           |             |
      | [AUTO_GENERATED] | MERGE_PROCESS_ID | 26       |             | /Personal/pit       |             |
      | [AUTO_GENERATED] | MERGE_PROCESS_ID | 26       |             | /Personal/assurance |             |
      | [AUTO_GENERATED] | MERGE_PROCESS_ID | 26       |             | /Personal/employee  |             |


  Scenario: UC10 Bypass EBX permission on Merge view
    Given I permit to access matching table
    And I create record in Matching table with the content followings
      | Data model:DDL                 | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: Run_match_service | Audience  | Yes          |                              |                  |                    |                       |
    When I set Merge policy configuration as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Mode     | Used for manual merge | Apply permission on merge view |
      | UC10              | Last update                    | Last update            | Disabled | Yes                   | No                             |
    And I access table "Audience" of dataset "Run match service" in dataspace "UAT>UAT-Child"
    When I want to merge some records with primary key as following
      | Identifier |
      | 1          |
      | 2          |
      | 3          |
      | 4          |
    Then record view table will be displayed and highlighted as below
      | Identifier | Name        | Comment | Age   | Marital status | Email               | Phone number |
      | 1          | Linda4      | KK      | 20    | Single         | linda@tibco.com     | true         |
      | 2          | Linda2      | KK      | 20    | Single         | linda@tibco.com     | true         |
      | 3          | Linda3      | KK      | 20    | Single         | linda@tibco.com     | true         |
      | 4   {H}    | Linda41 {H} | KK  {H} | 20{H} | Single     {H} | linda@tibco.com {H} | true    {H}  |
    And preview table is displayed as below
      | Identifier | Name    | Comment | Age | Marital status | Email           | Phone number |
      | 4          | Linda41 | KK      | 20  | Single         | linda@tibco.com | true         |
    And records should be merged successful

  Scenario: UC11 Align FK successful
    Given I permit to access matching table
    And I create record in Matching table with the content followings
      | Data model:DDL          | Table:DDL  | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: StoreModel | Categories | Yes          |                              |                  |                    |                       |
    When I set Merge policy configuration as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Mode     | Used for manual merge | Apply permission on merge view |
      | UC14F             | Was golden                     | [not defined]          | Disabled | Yes                   | No                             |
    And relation management should be defined as following
      | Relation path | Relation name | Relation management |
      | /root/Item    | Items         | Automatic           |
    Then the table "Items" of dataset "Stores" in dataspace "UAT>UAT-Child" should be displayed as bellow
      | Identifier | Category      | Brand          | Name           | Available | Default price |
      | 1          | Computers     | Apricot        | Laptop Pro     | Yes       | 720           |
      | 2          | Phones        | Sunny          | Pocket Handy   | Yes       | 240           |
      | 3          | Cooking       | Usual Electric | Star Cooker    | Yes       | 320           |
      | 4          | Refrigeration | Whitepool      | Energy Freezer | No        | 100           |
      | 47         | Cooking       | Whitepool      | Star Cooker    | No        | 320           |
      | 48         | Computers     | Sunny          | Laptop Pro     | Yes       | 720           |
      | 49         | Electronics   | Usual Electric | Star Cooker    | Yes       | 120           |
    And I access table "Categories" of dataset "Stores" in dataspace "UAT>UAT-Child"
    When I want to merge some records with primary key as following
      | Identifier |
      | 2          |
      | 3          |
    Then record view table will be displayed and highlighted as below
      | Identifier | Parent          | Name         | Comment |
      | 2    {H}   | Electronics {H} | Computers{H} | {H}     |
      | 3          | Electronics     | Phones       |         |
    And preview table is displayed as below
      | Identifier | Parent      | Name      | Comment |
      | 2          | Electronics | Computers |         |
    And records should be merged successful
    Then the table "Items" of dataset "Stores" in dataspace "UAT>UAT-Child" should be displayed as bellow
      | Identifier | Category      | Brand          | Name           | Available | Default price |
      | 1          | Computers     | Apricot        | Laptop Pro     | Yes       | 720           |
      | 2          | Computers     | Sunny          | Pocket Handy   | Yes       | 240           |
      | 3          | Cooking       | Usual Electric | Star Cooker    | Yes       | 320           |
      | 4          | Refrigeration | Whitepool      | Energy Freezer | No        | 100           |
      | 47         | Cooking       | Whitepool      | Star Cooker    | No        | 320           |
      | 48         | Computers     | Sunny          | Laptop Pro     | Yes       | 720           |
      | 49         | Electronics   | Usual Electric | Star Cooker    | Yes       | 120           |

  Scenario: UC12 Align FK succesfully -  FK is part of PK
    Given I permit to access matching table
    And I create record in Matching table with the content followings
      | Data model:DDL          | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: StoreModel | Items     | Yes          |                              |                  |                    |                       |
    When I set Merge policy configuration as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Mode     | Used for manual merge | Apply permission on merge view |
      | UC11              | Was golden                     | [not defined]          | Disabled | Yes                   | No                             |
    And relation management should be defined as following
      | Relation path   | Relation name | Relation management |
      | /root/Inventory | Inventories   | Manual              |
    Then the table "Inventories" of dataset "Stores" in dataspace "UAT>UAT-Child" should be displayed as bellow
      | Item           | Store           | Stock | Price | Modified            |
      | Laptop Pro     | Computer Market | 16    | 699   | 04/17/2012 17:27:38 |
      | Pocket Handy   | Phone Depot     | 7     | 299   | 04/17/2012 17:27:38 |
      | Star Cooker    | Cook Store      | 9     | 399   | 04/17/2012 17:27:38 |
      | Energy Freezer | Mister Freeze   | 0     | 100   | 04/17/2012 17:27:38 |
    And I access table "Items" of dataset "Stores" in dataspace "UAT>UAT-Child"
    When I want to merge some records with primary key as following
      | Identifier |
      | 1          |
      | 2          |
      | 49         |
    Then record view table will be displayed and highlighted as below
      | Identifier | Category      | Brand          | Name           | Available   | Default price |
      | 1    {H}   | Computers {H} | Apricot{H}     | Laptop Pro {H} | true    {H} | 720     {H}   |
      | 2          | Phones        | Sunny          | Pocket Handy   | true        | 240           |
      | 49         | Electronics   | Usual Electric | Star Cooker    | true        | 120           |
    And preview table is displayed as below
      | Identifier | Category  | Brand   | Name       | Available | Default price |
      | 1          | Computers | Apricot | Laptop Pro | true      | 720           |
    And all relation records should be updated
    And records should be merged successful
    And I access table "Inventories" of dataset "Stores" in dataspace "UAT>UAT-Child"
    Then the table "Inventories" of dataset "Stores" in dataspace "UAT>UAT-Child" should be displayed as bellow
      | Item           | Store           | Stock | Price | Modified            |
      | Laptop Pro     | Computer Market | 16    | 699   | 04/17/2012 17:27:38 |
      | Laptop Pro     | Phone Depot     | 7     | 299   | 04/17/2012 17:27:38 |
      | Pocket Handy   | Phone Depot     | 7     | 299   | 04/17/2012 17:27:38 |
      | Star Cooker    | Cook Store      | 9     | 399   | 04/17/2012 17:27:38 |
      | Energy Freezer | Mister Freeze   | 0     | 100   | 04/17/2012 17:27:38 |

  Scenario: UC13 Align FK failed - FK is also PK
    Given I permit to access matching table
    And I create record in Matching table with the content followings
      | Data model:DDL              | Table:DDL      | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: Human_Resource | Employee Areas | Yes          |                              |                  |                    |                       |
    When I set Merge policy configuration as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Mode     | Used for manual merge | Apply permission on merge view |
      | UC13              | Was golden                     | [not defined]          | Disabled | Yes                   | No                             |
    And relation management should be defined as following
      | Relation path   | Relation name | Relation management |
      | /root/Countries | Countries     | Manual              |
    Then the table "Countries" of dataset "Human_Resource" in dataspace "UAT>UAT-Child" should be displayed as bellow
      | Code  | Name           | Comment |
      | EMP01 | Vietnam        | 2 - VN  |
      | EMP02 | United Kingdom | 4 - UK  |
      | EMP03 | United States  | 1 - US  |
      | EMP04 | France         | 3 - FR  |
    And I access table "Employee Areas" of dataset "Human_Resource" in dataspace "UAT>UAT-Child"
    When I want to merge some records with primary key as following
      | Identifier |
      | EMP01      |
      | EMP02      |
    Then record view table will be displayed and highlighted as below
      | Identifier  | Name       | Date of birth   | Phone Number  | Email | Area Code |
      | EMP01   {H} | Lily {H}   | 05/11/1991  {H} | 962555823 {H} | {H}   | UK   {H}  |
      | EMP02       | Lily Hoang | 04/11/1992      | 966666555     |       | FR        |
    And preview table is displayed as below
      | Identifier | Name | Date of birth | Phone Number | Email | Area Code |
      | EMP01      | Lily | 05/11/1991    | 962555823    |       | UK        |
    And all relation records should be updated
    And records should be merged successful
    Then the table "Countries" of dataset "Human_Resource" in dataspace "UAT>UAT-Child" should be displayed as bellow
      | Code  | Name           | Comment |
      | EMP01 | Vietnam        | 2 - VN  |
      | EMP02 | United Kingdom | 4 - UK  |
      | EMP03 | United States  | 1 - US  |
      | EMP04 | France         | 3 - FR  |

  Scenario: UC14 Align FK failed - do not have 'Write' permission on the FK
    Given I permit to access matching table
    And I create record in Matching table with the content followings
      | Data model:DDL              | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: Human_Resource | National  | Yes          |                              |                  |                    |                       |
    When I set Merge policy configuration as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Mode     | Used for manual merge | Apply permission on merge view |
      | UC14              | Was golden                     | [not defined]          | Disabled | Yes                   | No                             |
    And relation management should be defined as following
      | Relation path   | Relation name | Relation management |
      | /root/Countries | Countries     | Manual              |
    Then the table "Countries" of dataset "Human_Resource" in dataspace "UAT>UAT-Child" should be displayed as bellow
      | Code  | Name           | Comment |
      | EMP01 | Vietnam        | 2 - VN  |
      | EMP02 | United Kingdom | 4 - UK  |
      | EMP03 | United States  | 1 - US  |
      | EMP04 | France         | 3 - FR  |
    And I access table "National" of dataset "Human_Resource" in dataspace "UAT>UAT-Child"
    When I want to merge some records with primary key as following
      | Identifier |
      | 1          |
      | 2          |
    Then record view table will be displayed and highlighted as below
      | Identifier | Name   | Employee | Website    |
      | 1   {H}    | US {H} | {H}      | [html] {H} |
      | 2          | VN     |          | [html]     |
    And preview table is displayed as below
      | Identifier | Name | Employee | Website |
      | 1          | US   |          | [html]  |
    And records should be merged successful
    Then the table "Countries" of dataset "Human_Resource" in dataspace "UAT>UAT-Child" should be displayed as bellow
      | Code  | Name           | Comment |
      | EMP01 | Vietnam        | 2 - VN  |
      | EMP02 | United Kingdom | 4 - UK  |
      | EMP03 | United States  | 1 - US  |
      | EMP04 | France         | 3 - FR  |