@tag
Feature: Manual Merge
  I want to use this template for Manual merge feature

  @Survivor_Field_MostTrustedSource
  Scenario: Check merging process after validate merge view screen
    Given I login to EBX succesfully
    And I access "dataspace" menu
    And I access dataspace "Master Data - Reference>Resource"
    And I create child Dataspace with information as following
      | Identifier       | Owner               | English Label |
      | Resource-child22 | admin admin (admin) |               |
    Then I should see Dataspace with information as following
      | Identifier       | Type      | Creation | Status | Owner               | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
      | Resource-child22 | Dataspace |          | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
    When I access "dataset" menu
    And I access dataspace "Master Data - Reference>Resource>Resource-child22"
    And I access dataset "Updater"
    And I access table "Table 19"
    When I select first "5" records in table
    And I select table service "Match and Merge>Merge"
    Then record view table will be displayed and highlighted as below
      | ID    | Company                        | Rank  | Country/Territory | Sales     |
      | {H} 1 | ICBC                           | {H} 1 | {H} China         | {H} 175.9 |
      |     2 | JPMorgan Chase                 |     2 | United States     |     132.9 |
      |     3 | {H} Agricultural Bank of China |     3 | China             |     150.3 |
      |     4 | Agricultural Bank of China     |     4 | China             |     137.5 |
      |     5 | Bank of America                |     5 | United States     |    111.91 |
    And preview table is displayed as below
      | ID | Company                    | Rank | Country/Territory | Sales |
      |  1 | Agricultural Bank of China |    1 | China             | 175.9 |
    When I complete merging process
    Then I access dataset "Master Data - Reference>Resource>Resource-child>Updater_Table19_MDS"
    And I access table "RecordMetadata"
    Then record view table will be displayed and highlighted as below
      | recordId | groupId  | state  | autoCreated |
      | KEY1     | GROUP_ID | Golden | No          |
      | KEY2     | GROUP_ID | Merged | No          |
      | KEY3     | GROUP_ID | Merged | No          |
      | KEY4     | GROUP_ID | Merged | No          |
      | KEY5     | GROUP_ID | Merged | No          |
    #And I close dataspace with service "Resource-child22"
    #And I access "administration" menu
    #And I access to administration service "Dataspaces"
    #And I access table "Dataspaces/snapshots" service
    #And I select filter by text with keyword and field below
      #| Field contains:  | In fields |
      #| Resource-child20 |           |
    #And I delete the dataspace "Dataspace Store (Store)" with service "Delete dataspaces and snapshots recursively"
