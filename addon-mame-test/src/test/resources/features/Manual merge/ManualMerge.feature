@tag
Feature: Title of your feature
  I want to use this template for my feature file

  @Survivor_MostTrustedSource
  Scenario: Check merging process after validate merge view screen
    Given the user is on the EBX home page
    And user login to EBX succesfully
    And user accesses "Dataspaces" menu
    And user accesses dataspace "Master Data - Reference>Resource"
    And user creates child Dataspace with information as following
      | Identifier | Owner               | English Label |
      |            | admin admin (admin) |               |
    Then user should see Dataspace with information as following
      | Identifier     | Type      | Creation | Status | Owner               | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
      | Resource-child | Dataspace |          | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
    When user accesses "dataset" menu
    And user accesses dataspace "Master Data - Reference>Resource>{Default}"
    And user accesses dataset "Updater"
    And user accesses table "Table 19"
    When user selects first "5" records in table
    And user select table service "Match and Merge>Merge"
    Then record view table will be displayed and highlighted as below
      | ID    | Company                        | Rank  | Country/Territory | Sales     |
      | 1 {H} | Agricultural Bank of China     | 1 {H} | China {H}         | 175.9 {H} |
      |     2 | JPMorgan Chase                 |     2 | United States     |     132.9 |
      |     3 | Agricultural Bank of China {H} |     3 | China             |     150.3 |
      |     4 | Agricultural Bank of China     |     4 | China             |     137.5 |
      |     5 | Bank of America                |     5 | United States     |    111.91 |
    And preview table is displayed as below
      | ID | Company                    | Rank | Country/Territory | Sales |
      |  1 | Agricultural Bank of China |    1 | China             | 175.9 |
    When user completes merging process
    Then user accesses dataset "Master Data - Reference>Resource>{Default}>Updater_Table19_MDS"
    And user selects table "RecordMetadata"
    Then user will see table RecordMetadata as below
      | recordId | groupId | state  | autoCreated | functionalId |
      |          | GROUPID | Golden | No          |            1 |
      |          | GROUPID | Merged | No          |              |
      |          | GROUPID | Merged | No          |              |
      |          | GROUPID | Merged | No          |              |
      |          | GROUPID | Merged | No          |              |
    And user close child dataspace "Resource-child"
