Feature: Administration workspace
  As user
  I want to use all service of Administration workspace

  Background: 
    Given I login to EBX succesfully

  Scenario: 
    And I access "administration" menu
    And I access to administration service "Dataspaces"
    And I access table "Dataspaces/snapshots" service
    And I select filter by text with keyword and field below
      | Field contains: | In fields |
      | Store           |           |
    And I delete the dataspace "Dataspace Store (Store)" with service "Delete dataspaces and snapshots recursively"
