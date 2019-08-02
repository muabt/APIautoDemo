@DMDV120-TestOnly
Feature: US07-Provide service for incremental tree (another table (Same dataset))

  Background: 
    Given I login to EBX succesfully
    
 Scenario: US07-106 Check expand & collapse node for a starting node when it have many incoming node on  external table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0>DMDV_v1.2.0Child"
    Given I access dataset "V120_US07-104"
    And I access table "TableC"
    And user views "TIBCO EBX™ Data Model and Data Visualization Add-on>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1 | MINUS_SIGN |
      | 1 | A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1 | MINUS_SIGN |
      | 1 | A1 | MINUS_SIGN |
      | 2 | B3 |            |
      | 3 | B4 |            |
      | 4 | B5 |            |
      | 5 | C2 |            |
      | 6 | B1 |            |
      | 7 | A1 |            |
      | 8 | B2 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 7 | 1 |
      | 5 | 1 |
      | 6 | 1 |
      | 2 | 1 |
      | 8 | 1 |
      | 4 | 1 |
      | 3 | 1 |
    When user collapses on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1 | MINUS_SIGN |
      | 1 | A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1 | MINUS_SIGN |
      | 1 | A1 | MINUS_SIGN |
      | 2 | B3 |            |
      | 3 | B4 |            |
      | 4 | B5 |            |
      | 5 | C2 |            |
      | 6 | B1 |            |
      | 7 | A1 |            |
      | 8 | B2 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 7 | 1 |
      | 5 | 1 |
      | 6 | 1 |
      | 2 | 1 |
      | 8 | 1 |
      | 4 | 1 |
      | 3 | 1 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1 | MINUS_SIGN |
      | 1 | A1 | MINUS_SIGN |
      | 2 | B3 |            |
      | 3 | B4 |            |
      | 4 | B5 |            |
      | 5 | C2 |            |
      | 6 | B1 |            |
      | 7 | A1 |            |
      | 8 | B2 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 7 | 1 |
      | 5 | 1 |
      | 6 | 1 |
      | 2 | 1 |
      | 8 | 1 |
      | 4 | 1 |
      | 3 | 1 |
