
Feature: Dashboard creation
  I want to use this template for Dashboard creation

  Scenario: Create new a dashboard successfully
    Given I login to EBX successfully
    And I access table "Brands" of dataset "FirstDataset" in dataspace "Primary"
    And I select table service "Insight > Dashboard creation"
#    And I create record with the followings
#      | Dashboard name:TXT | Description:TXT       | Design template:DDL | Owner:DDL | Share with: |
#      | Dashboard 1        | Dashboard for testing |                     | admin     |             |
#    Then I should see the dashboard configuration pane

  Scenario: Validate "Dashboard name" field on dashboard creation form when leave blank field
    Given I login to EBX successfully
    And I access table "Brands" of dataset "FirstDataset" in dataspace "Primary"
    And I select table service "Insight > Dashboard creation"
#    And I create record with the followings
#      | Dashboard name:TXT | Description:TXT       | Design template:DDL | Owner:DDL | Share with: |
#      |                    | Dashboard for testing |                     | admin     |             |
    Then errors message are raised with the followings
      | Field          | Message                              |
      | Dashboard name | Field 'Dashboard name' is mandatory. |
    And block of error messages are displayed like below
      | Block          | Message                              |
      | Dashboard name | Field 'Dashboard name' is mandatory. |

  Scenario: Validate "Owner" field on dashboard creation form when leave blank field
    Given I login to EBX successfully
    And I access table "Brands" of dataset "FirstDataset" in dataspace "Primary"
    And I select table service "Insight > Dashboard creation"
#    And I create record with the followings
#      | Dashboard name:TXT | Description:TXT       | Design template:DDL | Owner:DDL | Share with: |
#      | Dashboard 2        | Dashboard for testing |                     |           |             |
    Then errors message are raised with the followings
      | Field | Message                     |
      | Owner | Field 'Owner' is mandatory. |
    And block of error messages are displayed like below
      | Block | Message                     |
      | Owner | Field 'Owner' is mandatory. |