#Author: tbui@tibco.com
@DMDV110
Feature: US06-Dynamic labels for link
  As a user, I want to add labels for the link.

  Background: 
    Given I login to EBX succesfully

  @US06_model
  Scenario Outline: Check that link label with Default label and Localize label.
    Given I access dataspace "Master Data - Reference>DMDV1.1.0"
    Given I access dataset "US06"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "<configuration-name>"
    Then the graph should be displayed
    Then the label of node "0" equal "AName1"
    When user expands source on node "0"
    Then the label of link from node "1" to "0" equal "<label>"

    Examples: 
      | configuration-name | label                                                                                                                                                                                            |
      | US06-03            | Link 123                                                                                                                                                                                         |
      | US06-04            | !@#$%-^&*(){}                                                                                                                                                                                    |
      | US06-05            | table employee                                                                                                                                                                                   |
      | US06-06            | <body></body>                                                                                                                                                                                    |
      | US06-07            | We should add a new group ‘Label’ in the ‘Table configuration’ table, after the Color field. This group would contain fields similar to the ones used to define a label for a table in the day1. |
      | US06-08            |                                                                                                                                                                                                  |
      | US06-10            |                                                                                                                                                                                                1 |
      | US06-11            | DName1                                                                                                                                                                                           |
      | US06-12            | des1                                                                                                                                                                                             |
      | US06-13            | 1-DName1-AName1                                                                                                                                                                                  |
      | US06-16            | ${/Name                                                                                                                                                                                          |
      | US06-17            | DName1 DName1                                                                                                                                                                                    |
      | US06-18            | !$*@&^$* AName1                                                                                                                                                                                  |
      | US06-19            | Table company                                                                                                                                                                                    |
      | US06-20            | !@#$%^&*(){}                                                                                                                                                                                     |
      | US06-21            | table employee                                                                                                                                                                                   |
      | US06-22            | <body></body>                                                                                                                                                                                    |
      | US06-23            | We should add a new group ‘Label’ in the ‘Table configuration’ table, after the Color field. This group would contain fields similar to the ones used to define a label for a table in the day1  |
      | US06-24            |                                                                                                                                                                                                  |
      | US06-26            |                                                                                                                                                                                                1 |
      | US06-27            | DName1                                                                                                                                                                                           |
      | US06-28            | des1                                                                                                                                                                                             |
      | US06-29            | CName1-des1                                                                                                                                                                                      |
      | US06-32            | {/Name}                                                                                                                                                                                          |
      | US06-33            | DName1  EName1                                                                                                                                                                                   |
      | US06-34            | !$*@&^$*AName1                                                                                                                                                                                   |
      | US06-39            | CName1-AName1                                                                                                                                                                                    |
      | US06-40            | CName1-BName1-AName1                                                                                                                                                                             |
      | US06-41            | Local                                                                                                                                                                                            |
      | US06-42            |                                                                                                                                                                                                  |
      | US06-43            | CName1-AName1                                                                                                                                                                                    |
      | US06-44            |                                                                                                                                                                                                  |
      | US06-45            | name2                                                                                                                                                                                            |
      | US06-46            |                                                                                                                                                                                                  |
      | US06-48            |                                                                                                                                                                                                  |
      | US06-49            |                                                                                                                                                                                                  |
      | US06-50            |                                                                                                                                                                                                  |

  @VA_model
  Scenario Outline: Check that link label with Field name contains Table name.
    Given I access dataspace "Master Data - Reference>DMDV1.1.0"
    Given I access dataset "V110_US06_2"
    And  I access table "Distribute"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "<configuration-name>"
    Then the graph should be displayed
    Then the label of node "0" equal "Separate"
    When user expands source on node "0"
    Then the label of link from node "1" to "0" equal "<label>"

    Examples: 
      | configuration-name | label                     |
      | US06-51            | PositionTop - PositionTop |
      | US06-52            | PositionTop               |

  Scenario: US06-09 Verify wizard of Default label in Link configuration.
    Given open configuration with name "US06-08"
    Given open Default label wizard list of link
    Then verify list field of table in Default label ensure not include association and selection node
      | Association1 |
      | Selection    |

  Scenario: US06-25 Verify wizard of Localize label in Link configuration.
    Given open configuration with name "US06-08"
    Given open Localize label wizard list of link
    Then verify list field of table in Localize label ensure not include association and selection node
      | Association1 |
      | Selection    |
