@SYSTEM_TEST
Feature: Title of your feature
  I want to use this template for my feature file

@Ignore
  Scenario: SC-ME001 Check Matching engine execution when two records are identified as matched and both records already have a group
    Given I login to EBX successfully
    And I access dataspace "Master Data - Reference>Reference-child"
    And I create a child of dataspace "Reference-child" with information as following
      | Identifier | Owner              | English Label |
      | SC-ME001   | John Smith (admin) | Store         |
    And I select dataspace service "View or edit datasets"
    And I access table "Customer" of dataset "Master Data - Reference>Reference-child>SC-ME001"
    When I select some records with primary key as following
      | ID |
      | 2  |
      | 4  |
    And I select table service "Match and Merge>Merge"
    Then I access dataset "Master Data - Reference>Reference-child>Store>matchingEngine_Algorithm_Customer_MDS"
    And I access table "RecordMetadata"
    Then I will see table RecordMetadata as below
      | id   | groupId               | state  | autoCreated | FunctionalID |
      | KEY1 | 1,600,435,494,945,792 | Merged | No          |              |
      | KEY2 | 1,600,435,494,945,792 | Golden | No          |              |
      | KEY3 | 1,600,435,506,971,648 | Merged | No          |              |
      | KEY4 | 1,600,435,506,971,648 | Golden | No          |              |
    #And I access table "MatchingResult"
    #Then user will see table MatchingResult as below
      #| id   | sourceId | targetId | lastResult | sessionNumber |
      #| KEY1 | x        | x        | Matched    |            63 |
