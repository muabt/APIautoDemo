@SYSTEM_TEST
Feature: Manual Merge
  I want to use this template for Manual merge feature

  @Survivor_Field_MostTrustedSource
  Scenario: Check merging process after validate merge view screen
    Given I login to EBX successfully
    And I create a child of dataspace "Master Data - Reference > Resource" with information as following
      | Identifier | Owner               | English Label |
      |            | admin admin (admin) |               |
    When I select dataspace service "View or edit datasets"
    When I access table "Table 19" of dataset "Updater"
    When I select some records with primary key as following
      | ID |
      | 1  |
      | 2  |
      | 3  |
      | 4  |
      | 5  |
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | ID    | Company                             | Rank  | Country/Territory | Sales     |
      | 1     | ICBC                                |       | {H} England       | 175.9     |
      | 2     | Cultrure                            |       | France            | 132.9     |
      | {H} 3 | Singapore                           | {H} 2 | China             | {H} 150.3 |
      | 4     | {H} Agricultural Bank of China 3456 |       | China             | 137.5     |
      | 5     | Bank of America                     |       | United States     | 111.9     |
    And preview table is displayed as below
      | ID | Company                         | Rank | Country/Territory | Sales |
      | 3  | Agricultural Bank of China 3456 | 2    | England           | 150.3 |
    When I complete merging process
    Then I access dataset "Master Data - Reference > Resource > Resource-child28 > Updater_Table19_MDS"
    And I access table "RecordMetadata"
    Then I will see table RecordMetadata as below
      | recordId | groupId  | state  | autoCreated | functionalId |
      | KEY1     | GROUP_ID | Merged | No          | 1            |
      | KEY2     | GROUP_ID | Merged | No          | 2            |
      | KEY3     | GROUP_ID | Golden | No          | 3            |
      | KEY4     | GROUP_ID | Merged | No          | 4            |
      | KEY5     | GROUP_ID | Merged | No          | 5            |
    And I delete the dataspace
