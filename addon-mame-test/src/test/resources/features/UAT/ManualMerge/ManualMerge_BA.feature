Feature: Manual Merge
  A data steward identifies some duplicates,
  so that he wants to merge them. However, he was not sucessful to do it due to some errors.


  Background:
    Given I login to EBX successfully

  Scenario: UC01 Merge unsuccessful - verify how the add-on handles error - Entry condition
    And I permit to access matching table
    And I create record in Matching table with the content followings
      | Data model:DDL     | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: Store | Items     | Yes          |                              |                  |                    |                       |
    When I set Merge policy configuration as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Mode                      | Used for manual merge | Apply permission on merge view |
      | RANDOM            | Most trusted source            | Most trusted source    | Duplicates and singletons | Yes                   | Yes                            |
    And I create a child of dataspace "Master Data - Reference>UAT" with information as following
      | Identifier | Owner               | English Label |
      | UAT-Child  | admin admin (admin) |               |
    And I access table "Items" of dataset "Stores" in dataspace "UAT-Child"
    When I want to merge some records with primary key as following
      | Identifier |
      | 3          |
      | 4          |
    Then records should be merged successful
    When I want to merge some records with primary key as following
      | Identifier |
      | 1          |
      | 2          |
    Then records should be merged successful
    And I unmerge successful record has primary key as below
      | Identifier |
      | 1          |
    And I access table "Items" of dataset "Stores" in dataspace "UAT-Child"
    When I want to merge some records with primary key as following
      | Identifier |
      | 2          |
      | 3          |
      | [Last]     |
    Then I should see dialog box with title is "Merge" and content is "At least two records, different from 'Merged' or 'Deleted', must be selected."

  Scenario: UC02 Merge unsuccessful - To verify how the add-on handles error - Merge failed due to blocking errors
    And I permit to access matching table
    And I create record in Matching table with the content followings
      | Data model:DDL          | Table:DDL   | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: StoreModel | Inventories | Yes          |                              |                  |                    |                       |
    When I set Merge policy configuration as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Mode                      | Used for manual merge | Apply permission on merge view |
      | RANDOM            | Most trusted source            | Most trusted source    | Duplicates and singletons | Yes                   | Yes                            |
    And I create a child of dataspace "Master Data - Reference>UAT" with information as following
      | Identifier | Owner               | English Label |
      | UAT-Child  | admin admin (admin) |               |
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
    And I create a child of dataspace "Master Data - Reference>UAT" with information as following
      | Identifier | Owner               | English Label |
      | UAT-Child  | admin admin (admin) |               |
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
      | id   | mergePolicyId    | mergeMode | executionDate | snapshotId | user  | isUnmerged |
      | KEY1 | [AUTO_GENERATED] | Manual    | TODAY         |            | admin | No         |
    Then I will see table Decision as below
      | id   | sourceId | targetId | lastDecision        | user  | decisionDate | mergingProcessId |
      | KEY1 | 2        | 1        | Identified as match | admin | TODAY        | [AUTO_GENERATED] |
    Then no records found in table "MergeValueLineage"

  Scenario: UC04 Auto create will always be prioritized & pre-selected to be a Golden even no merge policy is defined
    Given I permit to access matching table
    And I create record in Matching table with the content followings
      | Data model:DDL          | Table:DDL  | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: StoreModel | Categories | Yes          |                              |                  |                    |                       |
    When I set Merge policy configuration as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Mode                      | Used for manual merge | Apply permission on merge view |
      | UC04              | Most trusted source            | Most trusted source    | Duplicates and singletons | Yes                   | Yes                            |
    And I create a child of dataspace "Master Data - Reference>UAT" with information as following
      | Identifier | Owner               | English Label |
      | UAT-Child  | admin admin (admin) |               |
    And I access table "Categories" of dataset "Stores" in dataspace "UAT-Child"
    When I want to merge some records with primary key as following
      | Identifier |
      | 5          |
      | 6          |
    And records should be merged successful
    Given I permit to access matching table
    And I select matching table record of table "Categories" of "Publication: StoreModel"
    And all merge policy should be deleted
    And I access table "Categories" of dataset "Stores" in dataspace "UAT-Child"
    When I want to merge some records with primary key as following
      | Identifier |
      | 1          |
      | [Last]     |
    Then record view table will be displayed and highlighted as below
      | Identifier | Parent         | Name        | Comment |
      | 1          |                | Electronics |         |
      | [Last]{H}  | Appliances {H} | Cooking {H} | {H}     |
    And preview table which has auto created PK is displayed as below
      | Identifier | Parent     | Name    | Comment |
      | [Last]     | Appliances | Cooking |         |
    And records should be merged successful
    And I access table "RecordMetadata" of dataset "StoreModel_Category_MDS" in dataspace "UAT > UAT-Child"
    Then I will see table RecordMetadata as below
      | functionalId | groupId  | state  | autoCreated |
      | 1            | GROUP_ID | Merged | No          |
      | 5            | GROUP_ID | Merged | No          |
      | 6            | GROUP_ID | Merged | No          |
      | [Last]       | GROUP_ID | Golden | Yes         |
    Then I will see table MergeResult as below
      | recordId | goldenId | mergingProcessId | isInterpolation |
      | 1        | [Last]   | [AUTO_GENERATED] | Yes             |
      | 5        | [Last]   | [AUTO_GENERATED] | Yes             |
      | 6        | [Last]   | [AUTO_GENERATED] | Yes             |
    Then I will see table MergingProcess as below
      | mergePolicyId    | mergeMode | executionDate | snapshotId | user  | isUnmerged |
      | [AUTO_GENERATED] | Manual    | TODAY         |            | admin | No         |
    Then I will see table Decision as below
      | id   | sourceId | targetId | lastDecision        | user  | decisionDate | mergingProcessId |
      | KEY1 | 1        | [Last]   | Identified as match | admin | TODAY        | [AUTO_GENERATED] |