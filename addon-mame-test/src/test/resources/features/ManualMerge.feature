@tag
Feature: Title of your feature
  I want to use this template for my feature file

  @Survivor_MostTrustedSource
  Scenario: Check merging process after validate merge view screen
    Given the user is on the EBX home page
    And user login to EBX succesfully
    #And user accesses "Dataspaces" menu
    #And user accesses dataspace "Master Data - Reference>Resource"
    #And user creates child Dataspace with information as following
    #| Identifier     | Owner               | English Label |
    #| Resource-child | admin admin (admin) |               |
    #Then user should see Dataspace with information as following
    #| Identifier     | Type      | Creation | Status | Owner               | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
    #| Resource-child | Dataspace |          | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
    When user accesses "dataset" menu
    And user accesses dataspace "Master Data - Reference>Resource>Resource-child16"
    And user accesses dataset "Updater"
    And user accesses table "Table 19"
    When user selects first "5" records in table
    And user select table service "Match and Merge>Merge"
    Then user will see the data as below
      | ID | Company                    | Rank | Country/Territory | Sales  |
      |  1 | ICBC                       |    1 | China             |  175.9 |
      |  2 | JPMorgan Chase             |    2 | United States     |  132.9 |
      |  3 | Agricultural Bank of China |    3 | China             |  150.3 |
      |  4 | Agricultural Bank of China |    4 | China             |  137.5 |
      |  5 | Bank of America            |    5 | United States     | 111.91 |
    And table is highlighted and displayed on Preview table as below
      | ID | Company                    | Rank | Country/Territory | Sales |
      |  1 | Agricultural Bank of China |    1 | China             | 175.9 |
    When user completes merging process
    Then user accesses dataset "Master Data - Reference>Resource>Resource-child>Updater_Table19_MDS"
    And user selects table "MappingKey"
    Then user will see table MappingKey as below
      | technicalId | functionalId |
      | KEY1        |            1 |
      | KEY2        |            2 |
      | KEY3        |            3 |
      | KEY4        |            4 |
      | KEY5        |            5 |
    And user selects table "RecordMetadata"
    Then user will see table RecordMetadata as below
      | recordId | groupId  | state  | autoCreated |
      | KEY1     | GROUP_ID | Golden | No          |
      | KEY2     | GROUP_ID | Merged | No          |
      | KEY3     | GROUP_ID | Merged | No          |
      | KEY4     | GROUP_ID | Merged | No          |
      | KEY5     | GROUP_ID | Merged | No          |
    And user deletes child dataspace "Resource-child"
