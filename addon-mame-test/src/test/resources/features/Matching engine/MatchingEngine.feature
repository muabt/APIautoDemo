@tag
Feature: Title of your feature
  I want to use this template for my feature file

  @tag1
  Scenario: Check Matching engine execution when two records are identified as matched and both records already have a group
    Given the user is on the EBX home page
    And user login to EBX succesfully
    And user accesses dataspace "Master Data - Reference>Reference_child"
    And create child dataspace "Reference_child_test" with owner is "admin admin (admin)"
    Then child dataspace "Reference_child_test" is created successfully
    And user accesses data set "Master Data - Reference>Reference_child>Reference_child_test>matchingEngine_Algorithm"
    And user selects table "Customer"
    When user select 2 records with "ID" is [2] and "ID" is [4]
    And user
    When user complete matching process
    Then user accesses data set "Master Data - Reference>Reference_child>Reference_child_test>matchingEngine_Algorithm_Customer_MDS"
    And user selects table "MappingKey"
    Then user will see table MappingKey as below
      | technicalId | functionalId |
      | KEY1        |            1 |
      | KEY2        |            2 |
      | KEY3        |            3 |
      | KEY4        |            4 |
    And user selects table "RecordMetadata"
    Then user will see table RecordMetadata as below
      | recordId | groupId               | state  | autoCreated |
      | KEY1     | 1,600,435,494,945,792 | Merged | No          |
      | KEY2     | 1,600,435,494,945,792 | Golden | No          |
      | KEY3     | 1,600,435,506,971,648 | Merged | No          |
      | KEY4     | 1,600,435,506,971,648 | Golden | No          |
    And user selects table "MatchingResult"
    Then user will see table MatchingResult as below
      | id   | sourceId | targetId | lastResult | matchingProcessId | executionDate |
      | KEY1 | x        | x        | Matched    |                63 | x             |
