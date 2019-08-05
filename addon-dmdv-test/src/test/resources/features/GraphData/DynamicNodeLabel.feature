#Author: tbui@tibco.com
@DMDV110
Feature: US03-Dynamic labels for nodes
As a user, I want to add labels for the nodes.
  Background: 
    Given I login to EBX succesfully

  Scenario Outline: Check that label node with Default label and Localize label.
    Given I access dataspace "Master Data - Reference>DMDV1.1.0"
    Given I access dataset "US03"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "<configuration-name>"
    Then the graph should be displayed
    Then the label of node "0" equal "<label>"

    Examples: 
      | configuration-name | label                                                                                                                                                                                            |
      | US03-03            | Table company                                                                                                                                                                                    |
      | US03-04            | !@#$%^&*(){}                                                                                                                                                                                     |
      | US03-05            | table employee                                                                                                                                                                                   |
      | US03-06            | <body></body>                                                                                                                                                                                    |
      | US03-07            | We should add a new group ‘Label’ in the ‘Table configuration’ table, after the Color field. This group would contain fields similar to the ones used to define a label for a table in the day1. |
      | US03-08            | AName1                                                                                                                                                                                           |
      | US03-10            |                                                                                                                                                                                                1 |
      | US03-11            | DName1                                                                                                                                                                                           |
      | US03-12            | Description1                                                                                                                                                                                     |
      | US03-13            | 1-AName1-Description1                                                                                                                                                                            |
      | US03-16            | ${/Name                                                                                                                                                                                          |
      | US03-17            | DName1   DName1                                                                                                                                                                                  |
      | US03-18            | !$*@&^$*AName1                                                                                                                                                                                   |
      | US03-23            | Table company                                                                                                                                                                                    |
      | US03-24            | !@#$%^&*(){}                                                                                                                                                                                     |
      | US03-25            | table employee                                                                                                                                                                                   |
      | US03-26            | <body></body>                                                                                                                                                                                    |
      | US03-27            | We should add a new group ‘Label’ in the ‘Table configuration’ table, after the Color field. This group would contain fields similar to the ones used to define a label for a table in the day1. |
      | US03-28            | AName1                                                                                                                                                                                           |
      | US03-30            |                                                                                                                                                                                                1 |
      | US03-31            | DName1                                                                                                                                                                                           |
      | US03-32            | Description1                                                                                                                                                                                     |
      | US03-33            | 1-AName1-Description1                                                                                                                                                                            |
      | US03-36            | ${/Name                                                                                                                                                                                          |
      | US03-37            | DName1   DName1                                                                                                                                                                                  |
      | US03-38            | !$*@&^$* AName1                                                                                                                                                                                  |
      | US03-45            | name2                                                                                                                                                                                            |
      | US03-46            | AName1                                                                                                                                                                                           |

  Scenario Outline: Check that label node with Programmatic label.
    Given I access dataspace "Master Data - Reference>DMDV1.1.0"
    Given I access dataset "US03"
    And I access table "TableC"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "<configuration-name>"
    Then the graph should be displayed
    Then the label of node "0" equal "<label>"

    Examples: 
      | configuration-name | label                              |
      | US03-39            | AName1-CName1                      |
      | US03-40            | AName1-BName1-CName1               |
      | US03-41            | AName1-BName1-CName1-EName1-CName1 |
      | US03-42            | CName1                             |
      | US03-43            | CName1                             |
      | US03-44            | AName1-CName1                      |
      | US03-49            | CName1                             |
      | US03-50            | CName1                             |

  Scenario: US03-09 Verify wizard of Default label in Table configuration.
    Given open table configuration with configuration name "US03-08" and table name "TableA"
    Given open Default label wizard list
    Then verify list field of table in Default label ensure not include association and selection node
      | Association1 |
      | Selection    |

  Scenario: US03-29 Verify wizard of Localize label in Table configuration.
    Given open table configuration with configuration name "US03-28" and table name "TableA"
    Given open Localize label wizard list
    Then verify list field of table in Localize label ensure not include association and selection node
      | Association1 |
      | Selection    |
