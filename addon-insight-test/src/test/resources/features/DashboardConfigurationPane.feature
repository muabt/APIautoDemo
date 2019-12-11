@SYSTEM_TEST
Feature: Dashboard configuration pane
  I want to use this template for Dashboard configuration pane

  Scenario: DCp03- Validate tootips of all tabs in configuration pane
    Given I login to EBX successfully
    And I access dataspace "Primary"
    And I access dataset "FirstDataset"
    And I select dataset service "Insight Rework > Dashboard creation"
    And I create dashboard with the followings
      | Dashboard name:TXT | Design template:DDL | Owner:DDL           | Share with:GROUP                    |
      | Dashboard 2        |                     | admin admin (admin) | lee jessie (jessie),luna kim (luna) |
    Then I should see tooltip of all tabs as following
      | Tabs              | Tooltip                                                                                                        |
      | Dashboard setting | Allow user update the dashboard information and dashboard permission.                                          |
      | Indicators        | List of ready-indicators, user can select a indicator and reuse it on another sections/dashboards.             |
      | Assets            | List of assets user can use to create a new indicator. The assets displays will base on the user's permission. |
      | Function          | List of build-in function user can use to create a new indicator.                                              |
      | Charts            | List of charts corresponding with the indicator.                                                               |
      | Options           | The options for a tile. User can select one/multiple options for one tile.                                     |

    Scenario: DCp15- Verify the accuracy of asset type and its order in the dropdown list
      Given I login to EBX successfully
      And I access dataspace "Primary"
      And I access dataset "FirstDataset"
      And I select dataset service "Insight Rework > Dashboard creation"
      And I create dashboard with the followings
        | Dashboard name:TXT | Design template:DDL | Owner:DDL           | Share with:GROUP                    |
        | Dashboard 2        |                     | admin admin (admin) | lee jessie (jessie),luna kim (luna) |
      And I access Assets tab
      And I verify the accuracy of asset type and its order in the dropdown list

    Scenario: DCp16- Verify list of data space and its default value when launching dashboard from data space
      Given I login to EBX successfully
      And I access dataspace "Primary"
      And I access dataset "FirstDataset"
      And I select dataset service "Insight Rework > Dashboard creation"
      And I create dashboard with the followings
        | Dashboard name:TXT | Design template:DDL | Owner:DDL           | Share with:GROUP                    |
        | Dashboard 2        |                     | admin admin (admin) | lee jessie (jessie),luna kim (luna) |
      And I access Assets tab
      And verify list of data space and its default value when launching dashboard from data space






