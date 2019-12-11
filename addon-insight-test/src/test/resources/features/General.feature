@SYSTEM_TEST
Feature: Dashboard creation
  I want to use this template for Dashboard creation

  Scenario: SC-DPRA-DC12- Create new a dashboard successfully
    Given I login to EBX successfully
    And I access table "Brands" of dataset "FirstDataset" in dataspace "Primary"
    And I select dataspace service "Insight > Dashboard creation"
    And I create record with the followings
      | Dashboard name:TXT | Description:TXT       | Design template:DDL | Owner:DDL | Share with:  |
      | Dashboard 1        | Dashboard for testing |                     | admin     | jessie, luna |
    Then I should see the dashboard configuration pane

  Scenario: SC-DPRA-DC05 Validate "Dashboard name" field on dashboard creation form when leave blank field
    Given I login to EBX successfully
    And I access table "Brands" of dataset "FirstDataset" in dataspace "Primary"
    And I select dataspace service "Insight > Dashboard creation"
    And I create record with the followings
      | Dashboard name:TXT | Description:TXT       | Design template:DDL | Owner:DDL | Share with: |
      |                    | Dashboard for testing |                     | admin     |             |
    Then errors message are raised with the followings
      | Field          | Message                              |
      | Dashboard name | Field 'Dashboard name' is mandatory. |
    And block of error messages are displayed like below
      | Block          | Message                              |
      | Dashboard name | Field 'Dashboard name' is mandatory. |

  Scenario: Validate tootips of all tabs in configuration pane
    Given I login to EBX successfully
    And I access table "Brands" of dataset "FirstDataset" in dataspace "Primary"
    And I select dataspace service "Insight > Dashboard creation"
    And I create record with the followings
      | Dashboard name:TXT | Description:TXT       | Design template:DDL | Owner:DDL | Share with:  |
      | Dashboard 2        | Dashboard for testing |                     |           | jessie, luna |
    And I should see tooltip of all tabs as following
      | Tabs              | Tooltip |
      | Dashboard setting |         |
      | Indicators        |         |
      | Assets            |         |
      | Function          |         |
      | Charts            |         |
      | Options           |         |
