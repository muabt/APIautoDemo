#Author: tbui@tibco.com
@DMDV120
Feature: US07-Provide service for incremental tree (another table (Same dataset))

  Background: 
    Given I login to EBX succesfully

  Scenario: US07-101 Check expand collapse node when it has a incoming node on  external table by many FKs
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_externalTable"
    And I access table "TableA_101"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | B1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
      | 1 | 0 |
      | 1 | 0 |
      | 1 | 0 |
      | 1 | 0 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |

  #*********************************************
  Scenario: US07-102 Check expand collapse node when it has a outgoing node on external table by  many FKs
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_externalTable"
    And I access table "TableA_102"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | B1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 1 |
      | 0 | 1 |
      | 0 | 1 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |

  #**********************************************
  Scenario: US07-103 Check expand collapse node when it has a incoming & outgoing node on  external table by  many FKs
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_externalTable"
    And I access table "TableA_103"
    And user views "Visualization>Display selected data" of records have ID are
      | 2 |
      | 3 |
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A2 | PLUS_SIGN |
      | 1 | A3 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A2 | MINUS_SIGN |
      | 1 | A3 | PLUS_SIGN  |
      | 2 | B2 | PLUS_SIGN  |
      | 3 | B3 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 0 | 2 |
      | 0 | 3 |
      | 3 | 0 |
      | 2 | 0 |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A2 | MINUS_SIGN |
      | 1 | A3 | PLUS_SIGN  |
      | 2 | B2 | MINUS_SIGN |
      | 3 | B3 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 0 | 2 |
      | 0 | 3 |
      | 3 | 0 |
      | 2 | 0 |
      | 2 | 1 |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A2 | MINUS_SIGN |
      | 1 | A3 | MINUS_SIGN |
      | 2 | B2 | MINUS_SIGN |
      | 3 | B3 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 0 | 2 |
      | 0 | 3 |
      | 3 | 0 |
      | 2 | 0 |
      | 2 | 1 |
      | 3 | 1 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A2 | PLUS_SIGN |
      | 1 | A3 | PLUS_SIGN |
     
  #********************************************
  Scenario: US07-104 Check expand & collapse node for a starting node when it have many incoming node on  external table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_externalTable"
    And I access table "/root/GroupA/TableA_104" on group "/root/GroupA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | B3 |            |
      | 2 | B4 |            |
      | 3 | B5 |            |
      | 4 | C1 |            |
      | 5 | C2 |            |
      | 6 | B1 |            |
      | 7 | A1 |            |
      | 8 | B2 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 4 | 0 |
      | 7 | 0 |
      | 5 | 0 |
      | 6 | 0 |
      | 1 | 0 |
      | 8 | 0 |
      | 3 | 0 |
      | 2 | 0 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      # | Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |

  #*******************************************
  Scenario: US07-105 Check expand & collapse node for a starting node when it have many incoming node on  external table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_externalTable"
    And I access table "/root/GroupA/TableA_104" on group "/root/GroupA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | B3 |            |
      | 2 | B4 |            |
      | 3 | B5 |            |
      | 4 | C1 |            |
      | 5 | C2 |            |
      | 6 | B1 |            |
      | 7 | A1 |            |
      | 8 | B2 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 4 | 0 |
      | 7 | 0 |
      | 5 | 0 |
      | 6 | 0 |
      | 1 | 0 |
      | 8 | 0 |
      | 3 | 0 |
      | 2 | 0 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      # | Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | B3 |            |
      | 2 | B4 |            |
      | 3 | B5 |            |
      | 4 | C1 |            |
      | 5 | C2 |            |
      | 6 | B1 |            |
      | 7 | A1 |            |
      | 8 | B2 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 4 | 0 |
      | 7 | 0 |
      | 5 | 0 |
      | 6 | 0 |
      | 1 | 0 |
      | 8 | 0 |
      | 3 | 0 |
      | 2 | 0 |

  #********************************************
  Scenario: US07-106 Check expand & collapse node for a starting node when it have many incoming node on  external table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0>DMDV_v1.2.0Child"
    Given I access dataset "V120_US07-104"
    And I access table "TableC"
    And user views "Visualization>Display selected data" of record has ID is "1"
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

  #****************************************************
  Scenario: US07-107 Check expand & collapse node for many starting node when it have many incoming node on  external table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0>DMDV_v1.2.0Child"
    Given I access dataset "V120_US07-104"
    And I access table "TableB"
    And user views "Visualization>Display selected data" of records have ID are
      | 1 |
      | 2 |
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | PLUS_SIGN |
      | 1 | B2 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | MINUS_SIGN |
      | 1 | B2 | PLUS_SIGN  |
      | 2 | A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | MINUS_SIGN |
      | 1 | B2 |            |
      | 2 | A1 | MINUS_SIGN |
      | 3 | B3 |            |
      | 4 | B4 |            |
      | 5 | B5 |            |
      | 6 | C1 |            |
      | 7 | C2 |            |
      | 8 | A1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 6 | 2 |
      | 8 | 2 |
      | 7 | 2 |
      | 3 | 2 |
      | 1 | 2 |
      | 5 | 2 |
      | 4 | 2 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | PLUS_SIGN |
      | 1 | B2 | PLUS_SIGN |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | PLUS_SIGN  |
      | 1 | B2 | MINUS_SIGN |
      | 2 | A1 | PLUS_SIGN  |
      | 3 | B3 |            |
      | 4 | B4 |            |
      | 5 | B5 |            |
      | 6 | C1 |            |
      | 7 | C2 |            |
      | 8 | A1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 6 | 2 |
      | 8 | 2 |
      | 7 | 2 |
      | 3 | 2 |
      | 1 | 2 |
      | 5 | 2 |
      | 4 | 2 |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 |            |
      | 1 | B2 | MINUS_SIGN |
      | 2 | A1 | MINUS_SIGN |
      | 3 | B3 |            |
      | 4 | B4 |            |
      | 5 | B5 |            |
      | 6 | C1 |            |
      | 7 | C2 |            |
      | 8 | A1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 6 | 2 |
      | 8 | 2 |
      | 7 | 2 |
      | 3 | 2 |
      | 1 | 2 |
      | 5 | 2 |
      | 4 | 2 |
      | 0 | 2 |
    When user collapses on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | PLUS_SIGN |
      | 1 | B2 | PLUS_SIGN |

  #****************************************************
  Scenario: US07-108 Check expand & collapse node for many starting node when it have many incoming node on  external table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0>DMDV_v1.2.0Child"
    Given I access dataset "V120_US07-104"
    And I access table "TableB"
    And user views "Visualization>Display selected data" of records have ID are
      | 1 |
      | 2 |
      | 3 |
      | 4 |
      | 5 |
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B3 | PLUS_SIGN |
      | 1 | B4 | PLUS_SIGN |
      | 2 | B5 | PLUS_SIGN |
      | 3 | B1 | PLUS_SIGN |
      | 4 | B2 | PLUS_SIGN |
    When user expands on node "3"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B3 | PLUS_SIGN  |
      | 1 | B4 | PLUS_SIGN  |
      | 2 | B5 | PLUS_SIGN  |
      | 3 | B1 | MINUS_SIGN |
      | 4 | B2 | PLUS_SIGN  |
      | 5 | A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 3 | 5 |
    When user expands on node "5"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B3 |            |
      | 1 | B4 |            |
      | 2 | B5 |            |
      | 3 | B1 | MINUS_SIGN |
      | 4 | B2 |            |
      | 5 | A1 | MINUS_SIGN |
      | 6 | C1 |            |
      | 7 | C2 |            |
      | 8 | A1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 3 | 5 |
      | 6 | 5 |
      | 8 | 5 |
      | 7 | 5 |
      | 0 | 5 |
      | 4 | 5 |
      | 2 | 5 |
      | 1 | 5 |
    When user collapses on node "5"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B3 | PLUS_SIGN  |
      | 1 | B4 | PLUS_SIGN  |
      | 2 | B5 | PLUS_SIGN  |
      | 3 | B1 | MINUS_SIGN |
      | 4 | B2 | PLUS_SIGN  |
      | 5 | A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 3 | 5 |
    When user collapses on node "3"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B3 | PLUS_SIGN |
      | 1 | B4 | PLUS_SIGN |
      | 2 | B5 | PLUS_SIGN |
      | 3 | B1 | PLUS_SIGN |
      | 4 | B2 | PLUS_SIGN |
    When user expands on node "3"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B3 | PLUS_SIGN  |
      | 1 | B4 | PLUS_SIGN  |
      | 2 | B5 | PLUS_SIGN  |
      | 3 | B1 | MINUS_SIGN |
      | 4 | B2 | PLUS_SIGN  |
      | 5 | A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 3 | 5 |

  #******************************************
  Scenario: US07-109 Check expand & collapse node for a starting node when it have many outgoing node on  external table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_externalTable"
    And I access table "/root/GroupA/TableA_109" on group "/root/GroupA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | C1 |            |
      | 2 | B1 |            |
      | 3 | A1 |            |
      | 4 | B2 |            |
      | 5 | B3 |            |
      | 6 | B4 |            |
      | 7 | B5 |            |
      | 8 | B6 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 4 |
      | 0 | 2 |
      | 0 | 3 |
      | 0 | 8 |
      | 0 | 5 |
      | 0 | 6 |
      | 0 | 7 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |

  #*********************************************
  Scenario: US07-110 Check expand & collapse node for a starting node when it have many outgoing node on  external table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_externalTable"
    And I access table "/root/GroupA/TableA_109" on group "/root/GroupA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | C1 |            |
      | 2 | B1 |            |
      | 3 | A1 |            |
      | 4 | B2 |            |
      | 5 | B3 |            |
      | 6 | B4 |            |
      | 7 | B5 |            |
      | 8 | B6 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 4 |
      | 0 | 2 |
      | 0 | 3 |
      | 0 | 8 |
      | 0 | 5 |
      | 0 | 6 |
      | 0 | 7 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | C1 |            |
      | 2 | B1 |            |
      | 3 | A1 |            |
      | 4 | B2 |            |
      | 5 | B3 |            |
      | 6 | B4 |            |
      | 7 | B5 |            |
      | 8 | B6 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 4 |
      | 0 | 2 |
      | 0 | 3 |
      | 0 | 8 |
      | 0 | 5 |
      | 0 | 6 |
      | 0 | 7 |

  #*********************************************
  Scenario: US07-111 Check expand & collapse node for a starting node when it have many outgoing node on  external table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0>DMDV_v1.2.0Child"
    Given I access dataset "V120_US07-109"
    And I access table "TableC"
    And user views "Visualization>Display selected data" of record has ID is "1"
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
      | 1 | 0 |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1 | MINUS_SIGN |
      | 1 | A1 | MINUS_SIGN |
      | 2 | B1 |            |
      | 3 | A1 |            |
      | 4 | B2 |            |
      | 5 | B3 |            |
      | 6 | B4 |            |
      | 7 | B5 |            |
      | 8 | B6 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
      | 1 | 4 |
      | 1 | 2 |
      | 1 | 3 |
      | 1 | 8 |
      | 1 | 5 |
      | 1 | 6 |
      | 1 | 7 |
    When user collapses on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1 | MINUS_SIGN |
      | 1 | A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1 | MINUS_SIGN |
      | 1 | A1 | MINUS_SIGN |
      | 2 | B1 |            |
      | 3 | A1 |            |
      | 4 | B2 |            |
      | 5 | B3 |            |
      | 6 | B4 |            |
      | 7 | B5 |            |
      | 8 | B6 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
      | 1 | 4 |
      | 1 | 2 |
      | 1 | 3 |
      | 1 | 8 |
      | 1 | 5 |
      | 1 | 6 |
      | 1 | 7 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1 | MINUS_SIGN |
      | 1 | A1 | MINUS_SIGN |
      | 2 | B1 |            |
      | 3 | A1 |            |
      | 4 | B2 |            |
      | 5 | B3 |            |
      | 6 | B4 |            |
      | 7 | B5 |            |
      | 8 | B6 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
      | 1 | 4 |
      | 1 | 2 |
      | 1 | 3 |
      | 1 | 8 |
      | 1 | 5 |
      | 1 | 6 |
      | 1 | 7 |

  #*******************************************
  Scenario: US07-112 Check expand & collapse node for many starting node when it have many outgoing node  from external table (#DataModel#Space)
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0>DMDV_v1.2.0Child"
    Given I access dataset "V120_US07-109"
    And I access table "TableB"
    And user views "Visualization>Display selected data" of records have ID are
      | 1 |
      | 2 |
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | PLUS_SIGN |
      | 1 | B2 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | MINUS_SIGN |
      | 1 | B2 | PLUS_SIGN  |
      | 2 | A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 2 | 0 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | PLUS_SIGN |
      | 1 | B2 | PLUS_SIGN |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | PLUS_SIGN  |
      | 1 | B2 | MINUS_SIGN |
      | 2 | A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 2 | 1 |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 |            |
      | 1 | B2 | MINUS_SIGN |
      | 2 | A1 | MINUS_SIGN |
      | 3 | C1 |            |
      | 4 | A1 |            |
      | 5 | B3 |            |
      | 6 | B4 |            |
      | 7 | B5 |            |
      | 8 | B6 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 2 | 1 |
      | 2 | 3 |
      | 2 | 0 |
      | 2 | 4 |
      | 2 | 8 |
      | 2 | 5 |
      | 2 | 6 |
      | 2 | 7 |
    When user collapses on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | PLUS_SIGN |
      | 1 | B2 | PLUS_SIGN |

  #********************************************
  Scenario: US07-113 Check expand & collapse node for many starting node when it have many outgoing node  from external table (#DataModel#Space)
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0>DMDV_v1.2.0Child"
    Given I access dataset "V120_US07-109"
    And I access table "TableB"
    And user views "Visualization>Display selected data" of records have ID are
      | 1 |
      | 2 |
      | 3 |
      | 4 |
      | 5 |
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | PLUS_SIGN |
      | 1 | B2 | PLUS_SIGN |
      | 2 | B3 | PLUS_SIGN |
      | 3 | B4 | PLUS_SIGN |
      | 4 | B5 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | MINUS_SIGN |
      | 1 | B2 | PLUS_SIGN  |
      | 2 | B3 | PLUS_SIGN  |
      | 3 | B4 | PLUS_SIGN  |
      | 4 | B5 | PLUS_SIGN  |
      | 5 | A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 5 | 0 |
    When user expands on node "5"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | MINUS_SIGN |
      | 1 | B2 |            |
      | 2 | B3 |            |
      | 3 | B4 |            |
      | 4 | B5 |            |
      | 5 | A1 | MINUS_SIGN |
      | 6 | C1 |            |
      | 7 | A1 |            |
      | 8 | B6 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 5 | 0 |
      | 5 | 6 |
      | 5 | 1 |
      | 5 | 7 |
      | 5 | 8 |
      | 5 | 2 |
      | 5 | 3 |
      | 5 | 4 |
    When user collapses on node "5"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | MINUS_SIGN |
      | 1 | B2 | PLUS_SIGN  |
      | 2 | B3 | PLUS_SIGN  |
      | 3 | B4 | PLUS_SIGN  |
      | 4 | B5 | PLUS_SIGN  |
      | 5 | A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 5 | 0 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | PLUS_SIGN |
      | 1 | B2 | PLUS_SIGN |
      | 2 | B3 | PLUS_SIGN |
      | 3 | B4 | PLUS_SIGN |
      | 4 | B5 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | MINUS_SIGN |
      | 1 | B2 | PLUS_SIGN  |
      | 2 | B3 | PLUS_SIGN  |
      | 3 | B4 | PLUS_SIGN  |
      | 4 | B5 | PLUS_SIGN  |
      | 5 | A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 5 | 0 |

  #*********************************************
  Scenario: US07-114 Check expand & collapse node for many starting node when it have many incoming & outgoing node from external table (#DataModel#Space)
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_externalTable"
    And I access table "/root/GroupA/TableA_114" on group "/root/GroupA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | B2 |            |
      | 2 | A1 |            |
      | 3 | E1 |            |
      | 4 | D1 |            |
      | 5 | E2 |            |
      | 6 | E3 |            |
      | 7 | C1 |            |
      | 8 | B1 |            |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |

  #******************************************
  Scenario: US07-115 Check expand & collapse node for many starting node when it have many incoming & outgoing node from external table (#DataModel#Space)
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0>DMDV_v1.2.0Child"
    Given I access dataset "V120_US07-114"
    And I access table "TableB"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | MINUS_SIGN |
      | 1 | A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | MINUS_SIGN |
      | 1 | A1 | MINUS_SIGN |
      | 2 | B2 |            |
      | 3 | A1 |            |
      | 4 | E1 |            |
      | 5 | D1 |            |
      | 6 | E2 |            |
      | 7 | E3 |            |
      | 8 | C1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
      | 1 | 2 |
      | 1 | 8 |
      | 1 | 3 |
      | 7 | 1 |
      | 4 | 1 |
      | 5 | 1 |
      | 6 | 1 |
    When user collapses on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | MINUS_SIGN |
      | 1 | A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | MINUS_SIGN |
      | 1 | A1 | MINUS_SIGN |
      | 2 | B2 |            |
      | 3 | A1 |            |
      | 4 | E1 |            |
      | 5 | D1 |            |
      | 6 | E2 |            |
      | 7 | E3 |            |
      | 8 | C1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
      | 1 | 2 |
      | 1 | 8 |
      | 1 | 3 |
      | 7 | 1 |
      | 4 | 1 |
      | 5 | 1 |
      | 6 | 1 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | MINUS_SIGN |
      | 1 | A1 | MINUS_SIGN |
      | 2 | B2 |            |
      | 3 | A1 |            |
      | 4 | E1 |            |
      | 5 | D1 |            |
      | 6 | E2 |            |
      | 7 | E3 |            |
      | 8 | C1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
      | 1 | 2 |
      | 1 | 8 |
      | 1 | 3 |
      | 7 | 1 |
      | 4 | 1 |
      | 5 | 1 |
      | 6 | 1 |

  #*********************************************
  Scenario: US07-116 Check expand & collapse node for a starting node when it have many incoming/ outgoing node from external table (#DataModel#Space)
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_externalTable"
    And I access table "/root/GroupA/TableA_116" on group "/root/GroupA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | PLUS_SIGN  |
      | 0 | A1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
      | 2 | C1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 2 |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
      | 2 | C1 | MINUS_SIGN |
      | 3 | D1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 2 |
      | 2 | 3 |
    When user expands on node "3"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
      | 2 | C1 | MINUS_SIGN |
      | 3 | D1 | MINUS_SIGN |
      | 4 | E1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 2 |
      | 2 | 3 |
      | 3 | 4 |
    When user expands on node "4"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
      | 2 | C1 | MINUS_SIGN |
      | 3 | D1 | MINUS_SIGN |
      | 4 | E1 | MINUS_SIGN |
      | 5 | F1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 2 |
      | 2 | 3 |
      | 3 | 4 |
      | 4 | 5 |
    When user expands on node "5"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
      | 2 | C1 | MINUS_SIGN |
      | 3 | D1 | MINUS_SIGN |
      | 4 | E1 | MINUS_SIGN |
      | 5 | F1 | MINUS_SIGN |
      | 6 | G1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 2 |
      | 2 | 3 |
      | 3 | 4 |
      | 4 | 5 |
      | 5 | 6 |
    When user expands on node "6"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
      | 2 | C1 | MINUS_SIGN |
      | 3 | D1 | MINUS_SIGN |
      | 4 | E1 | MINUS_SIGN |
      | 5 | F1 | MINUS_SIGN |
      | 6 | G1 | MINUS_SIGN |
      | 7 | H1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 2 |
      | 2 | 3 |
      | 3 | 4 |
      | 4 | 5 |
      | 5 | 6 |
      | 6 | 7 |
    When user expands on node "7"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
      | 2 | C1 | MINUS_SIGN |
      | 3 | D1 | MINUS_SIGN |
      | 4 | E1 | MINUS_SIGN |
      | 5 | F1 | MINUS_SIGN |
      | 6 | G1 | MINUS_SIGN |
      | 7 | H1 | MINUS_SIGN |
      | 8 | I1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 2 |
      | 2 | 3 |
      | 3 | 4 |
      | 4 | 5 |
      | 5 | 6 |
      | 6 | 7 |
      | 7 | 8 |
    When user expands on node "8"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
      | 2 | C1 | MINUS_SIGN |
      | 3 | D1 | MINUS_SIGN |
      | 4 | E1 | MINUS_SIGN |
      | 5 | F1 | MINUS_SIGN |
      | 6 | G1 | MINUS_SIGN |
      | 7 | H1 | MINUS_SIGN |
      | 8 | I1 | MINUS_SIGN |
      | 9 | J1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 2 |
      | 2 | 3 |
      | 3 | 4 |
      | 4 | 5 |
      | 5 | 6 |
      | 6 | 7 |
      | 7 | 8 |
      | 8 | 9 |
    When user expands on node "9"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 |  1 |
      | 1 |  2 |
      | 2 |  3 |
      | 3 |  4 |
      | 4 |  5 |
      | 5 |  6 |
      | 6 |  7 |
      | 7 |  8 |
      | 8 |  9 |
      | 9 | 10 |
    When user expands on node "10"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | MINUS_SIGN |
      | 11 | L1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  1 |
      |  1 |  2 |
      |  2 |  3 |
      |  3 |  4 |
      |  4 |  5 |
      |  5 |  6 |
      |  6 |  7 |
      |  7 |  8 |
      |  8 |  9 |
      |  9 | 10 |
      | 10 | 11 |
    When user expands on node "11"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | MINUS_SIGN |
      | 11 | L1 | MINUS_SIGN |
      | 12 | M1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  1 |
      |  1 |  2 |
      |  2 |  3 |
      |  3 |  4 |
      |  4 |  5 |
      |  5 |  6 |
      |  6 |  7 |
      |  7 |  8 |
      |  8 |  9 |
      |  9 | 10 |
      | 10 | 11 |
      | 11 | 12 |
    When user expands on node "12"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | MINUS_SIGN |
      | 11 | L1 | MINUS_SIGN |
      | 12 | M1 | MINUS_SIGN |
      | 13 | N1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  1 |
      |  1 |  2 |
      |  2 |  3 |
      |  3 |  4 |
      |  4 |  5 |
      |  5 |  6 |
      |  6 |  7 |
      |  7 |  8 |
      |  8 |  9 |
      |  9 | 10 |
      | 10 | 11 |
      | 11 | 12 |
      | 12 | 13 |
    When user expands on node "13"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | MINUS_SIGN |
      | 11 | L1 | MINUS_SIGN |
      | 12 | M1 | MINUS_SIGN |
      | 13 | N1 | MINUS_SIGN |
      | 14 | O1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  1 |
      |  1 |  2 |
      |  2 |  3 |
      |  3 |  4 |
      |  4 |  5 |
      |  5 |  6 |
      |  6 |  7 |
      |  7 |  8 |
      |  8 |  9 |
      |  9 | 10 |
      | 10 | 11 |
      | 11 | 12 |
      | 12 | 13 |
      | 13 | 14 |
    When user expands on node "14"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | MINUS_SIGN |
      | 11 | L1 | MINUS_SIGN |
      | 12 | M1 | MINUS_SIGN |
      | 13 | N1 | MINUS_SIGN |
      | 14 | O1 | MINUS_SIGN |
      | 15 | P1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  1 |
      |  1 |  2 |
      |  2 |  3 |
      |  3 |  4 |
      |  4 |  5 |
      |  5 |  6 |
      |  6 |  7 |
      |  7 |  8 |
      |  8 |  9 |
      |  9 | 10 |
      | 10 | 11 |
      | 11 | 12 |
      | 12 | 13 |
      | 13 | 14 |
      | 14 | 15 |
    When user expands on node "15"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | MINUS_SIGN |
      | 11 | L1 | MINUS_SIGN |
      | 12 | M1 | MINUS_SIGN |
      | 13 | N1 | MINUS_SIGN |
      | 14 | O1 | MINUS_SIGN |
      | 15 | P1 | MINUS_SIGN |
      | 16 | Q1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  1 |
      |  1 |  2 |
      |  2 |  3 |
      |  3 |  4 |
      |  4 |  5 |
      |  5 |  6 |
      |  6 |  7 |
      |  7 |  8 |
      |  8 |  9 |
      |  9 | 10 |
      | 10 | 11 |
      | 11 | 12 |
      | 12 | 13 |
      | 13 | 14 |
      | 14 | 15 |
      | 15 | 16 |
    When user expands on node "16"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | MINUS_SIGN |
      | 11 | L1 | MINUS_SIGN |
      | 12 | M1 | MINUS_SIGN |
      | 13 | N1 | MINUS_SIGN |
      | 14 | O1 | MINUS_SIGN |
      | 15 | P1 | MINUS_SIGN |
      | 16 | Q1 | MINUS_SIGN |
      | 17 | T1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  1 |
      |  1 |  2 |
      |  2 |  3 |
      |  3 |  4 |
      |  4 |  5 |
      |  5 |  6 |
      |  6 |  7 |
      |  7 |  8 |
      |  8 |  9 |
      |  9 | 10 |
      | 10 | 11 |
      | 11 | 12 |
      | 12 | 13 |
      | 13 | 14 |
      | 14 | 15 |
      | 15 | 16 |
      | 16 | 17 |
    When user expands on node "17"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | MINUS_SIGN |
      | 11 | L1 | MINUS_SIGN |
      | 12 | M1 | MINUS_SIGN |
      | 13 | N1 | MINUS_SIGN |
      | 14 | O1 | MINUS_SIGN |
      | 15 | P1 | MINUS_SIGN |
      | 16 | Q1 | MINUS_SIGN |
      | 17 | T1 | MINUS_SIGN |
      | 18 | R1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  1 |
      |  1 |  2 |
      |  2 |  3 |
      |  3 |  4 |
      |  4 |  5 |
      |  5 |  6 |
      |  6 |  7 |
      |  7 |  8 |
      |  8 |  9 |
      |  9 | 10 |
      | 10 | 11 |
      | 11 | 12 |
      | 12 | 13 |
      | 13 | 14 |
      | 14 | 15 |
      | 15 | 16 |
      | 16 | 17 |
      | 17 | 18 |
    When user expands on node "18"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | MINUS_SIGN |
      | 11 | L1 | MINUS_SIGN |
      | 12 | M1 | MINUS_SIGN |
      | 13 | N1 | MINUS_SIGN |
      | 14 | O1 | MINUS_SIGN |
      | 15 | P1 | MINUS_SIGN |
      | 16 | Q1 | MINUS_SIGN |
      | 17 | T1 | MINUS_SIGN |
      | 18 | R1 | MINUS_SIGN |
      | 19 | U1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  1 |
      |  1 |  2 |
      |  2 |  3 |
      |  3 |  4 |
      |  4 |  5 |
      |  5 |  6 |
      |  6 |  7 |
      |  7 |  8 |
      |  8 |  9 |
      |  9 | 10 |
      | 10 | 11 |
      | 11 | 12 |
      | 12 | 13 |
      | 13 | 14 |
      | 14 | 15 |
      | 15 | 16 |
      | 16 | 17 |
      | 17 | 18 |
      | 18 | 19 |
    When user expands on node "19"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | MINUS_SIGN |
      | 11 | L1 | MINUS_SIGN |
      | 12 | M1 | MINUS_SIGN |
      | 13 | N1 | MINUS_SIGN |
      | 14 | O1 | MINUS_SIGN |
      | 15 | P1 | MINUS_SIGN |
      | 16 | Q1 | MINUS_SIGN |
      | 17 | T1 | MINUS_SIGN |
      | 18 | R1 | MINUS_SIGN |
      | 19 | U1 | MINUS_SIGN |
      | 20 | V1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  1 |
      |  1 |  2 |
      |  2 |  3 |
      |  3 |  4 |
      |  4 |  5 |
      |  5 |  6 |
      |  6 |  7 |
      |  7 |  8 |
      |  8 |  9 |
      |  9 | 10 |
      | 10 | 11 |
      | 11 | 12 |
      | 12 | 13 |
      | 13 | 14 |
      | 14 | 15 |
      | 15 | 16 |
      | 16 | 17 |
      | 17 | 18 |
      | 18 | 19 |
      | 19 | 20 |
    When user expands on node "20"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | MINUS_SIGN |
      | 11 | L1 | MINUS_SIGN |
      | 12 | M1 | MINUS_SIGN |
      | 13 | N1 | MINUS_SIGN |
      | 14 | O1 | MINUS_SIGN |
      | 15 | P1 | MINUS_SIGN |
      | 16 | Q1 | MINUS_SIGN |
      | 17 | T1 | MINUS_SIGN |
      | 18 | R1 | MINUS_SIGN |
      | 19 | U1 | MINUS_SIGN |
      | 20 | V1 | MINUS_SIGN |
      | 21 | X1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  1 |
      |  1 |  2 |
      |  2 |  3 |
      |  3 |  4 |
      |  4 |  5 |
      |  5 |  6 |
      |  6 |  7 |
      |  7 |  8 |
      |  8 |  9 |
      |  9 | 10 |
      | 10 | 11 |
      | 11 | 12 |
      | 12 | 13 |
      | 13 | 14 |
      | 14 | 15 |
      | 15 | 16 |
      | 16 | 17 |
      | 17 | 18 |
      | 18 | 19 |
      | 19 | 20 |
      | 20 | 21 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | MINUS_SIGN |
      | 11 | L1 | MINUS_SIGN |
      | 12 | M1 | MINUS_SIGN |
      | 13 | N1 | MINUS_SIGN |
      | 14 | O1 | MINUS_SIGN |
      | 15 | P1 | MINUS_SIGN |
      | 16 | Q1 | MINUS_SIGN |
      | 17 | T1 | MINUS_SIGN |
      | 18 | R1 | MINUS_SIGN |
      | 19 | U1 | MINUS_SIGN |
      | 20 | V1 | MINUS_SIGN |
      | 21 | X1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  1 |
      |  1 |  2 |
      |  2 |  3 |
      |  3 |  4 |
      |  4 |  5 |
      |  5 |  6 |
      |  6 |  7 |
      |  7 |  8 |
      |  8 |  9 |
      |  9 | 10 |
      | 10 | 11 |
      | 11 | 12 |
      | 12 | 13 |
      | 13 | 14 |
      | 14 | 15 |
      | 15 | 16 |
      | 16 | 17 |
      | 17 | 18 |
      | 18 | 19 |
      | 19 | 20 |
      | 20 | 21 |

  #*********************************************
  Scenario: US07-117 Check expand & collapse node for a starting node when it have many incoming/ outgoing node from external table (#DataModel#Space)
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_externalTable"
    And I access table "/root/GroupA/TableA_116" on group "/root/GroupA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | PLUS_SIGN  |
      | 0 | A1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
      | 2 | C1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 2 |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
      | 2 | C1 | MINUS_SIGN |
      | 3 | D1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 2 |
      | 2 | 3 |
    When user expands on node "3"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
      | 2 | C1 | MINUS_SIGN |
      | 3 | D1 | MINUS_SIGN |
      | 4 | E1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 2 |
      | 2 | 3 |
      | 3 | 4 |
    When user expands on node "4"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
      | 2 | C1 | MINUS_SIGN |
      | 3 | D1 | MINUS_SIGN |
      | 4 | E1 | MINUS_SIGN |
      | 5 | F1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 2 |
      | 2 | 3 |
      | 3 | 4 |
      | 4 | 5 |
    When user expands on node "5"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
      | 2 | C1 | MINUS_SIGN |
      | 3 | D1 | MINUS_SIGN |
      | 4 | E1 | MINUS_SIGN |
      | 5 | F1 | MINUS_SIGN |
      | 6 | G1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 2 |
      | 2 | 3 |
      | 3 | 4 |
      | 4 | 5 |
      | 5 | 6 |
    When user expands on node "6"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
      | 2 | C1 | MINUS_SIGN |
      | 3 | D1 | MINUS_SIGN |
      | 4 | E1 | MINUS_SIGN |
      | 5 | F1 | MINUS_SIGN |
      | 6 | G1 | MINUS_SIGN |
      | 7 | H1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 2 |
      | 2 | 3 |
      | 3 | 4 |
      | 4 | 5 |
      | 5 | 6 |
      | 6 | 7 |
    When user expands on node "7"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
      | 2 | C1 | MINUS_SIGN |
      | 3 | D1 | MINUS_SIGN |
      | 4 | E1 | MINUS_SIGN |
      | 5 | F1 | MINUS_SIGN |
      | 6 | G1 | MINUS_SIGN |
      | 7 | H1 | MINUS_SIGN |
      | 8 | I1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 2 |
      | 2 | 3 |
      | 3 | 4 |
      | 4 | 5 |
      | 5 | 6 |
      | 6 | 7 |
      | 7 | 8 |
    When user expands on node "8"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
      | 2 | C1 | MINUS_SIGN |
      | 3 | D1 | MINUS_SIGN |
      | 4 | E1 | MINUS_SIGN |
      | 5 | F1 | MINUS_SIGN |
      | 6 | G1 | MINUS_SIGN |
      | 7 | H1 | MINUS_SIGN |
      | 8 | I1 | MINUS_SIGN |
      | 9 | J1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 2 |
      | 2 | 3 |
      | 3 | 4 |
      | 4 | 5 |
      | 5 | 6 |
      | 6 | 7 |
      | 7 | 8 |
      | 8 | 9 |
    When user expands on node "9"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 |  1 |
      | 1 |  2 |
      | 2 |  3 |
      | 3 |  4 |
      | 4 |  5 |
      | 5 |  6 |
      | 6 |  7 |
      | 7 |  8 |
      | 8 |  9 |
      | 9 | 10 |
    When user expands on node "10"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | MINUS_SIGN |
      | 11 | L1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  1 |
      |  1 |  2 |
      |  2 |  3 |
      |  3 |  4 |
      |  4 |  5 |
      |  5 |  6 |
      |  6 |  7 |
      |  7 |  8 |
      |  8 |  9 |
      |  9 | 10 |
      | 10 | 11 |
    When user expands on node "11"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | MINUS_SIGN |
      | 11 | L1 | MINUS_SIGN |
      | 12 | M1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  1 |
      |  1 |  2 |
      |  2 |  3 |
      |  3 |  4 |
      |  4 |  5 |
      |  5 |  6 |
      |  6 |  7 |
      |  7 |  8 |
      |  8 |  9 |
      |  9 | 10 |
      | 10 | 11 |
      | 11 | 12 |
    When user expands on node "12"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | MINUS_SIGN |
      | 11 | L1 | MINUS_SIGN |
      | 12 | M1 | MINUS_SIGN |
      | 13 | N1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  1 |
      |  1 |  2 |
      |  2 |  3 |
      |  3 |  4 |
      |  4 |  5 |
      |  5 |  6 |
      |  6 |  7 |
      |  7 |  8 |
      |  8 |  9 |
      |  9 | 10 |
      | 10 | 11 |
      | 11 | 12 |
      | 12 | 13 |
    When user expands on node "13"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | MINUS_SIGN |
      | 11 | L1 | MINUS_SIGN |
      | 12 | M1 | MINUS_SIGN |
      | 13 | N1 | MINUS_SIGN |
      | 14 | O1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  1 |
      |  1 |  2 |
      |  2 |  3 |
      |  3 |  4 |
      |  4 |  5 |
      |  5 |  6 |
      |  6 |  7 |
      |  7 |  8 |
      |  8 |  9 |
      |  9 | 10 |
      | 10 | 11 |
      | 11 | 12 |
      | 12 | 13 |
      | 13 | 14 |
    When user expands on node "14"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | MINUS_SIGN |
      | 11 | L1 | MINUS_SIGN |
      | 12 | M1 | MINUS_SIGN |
      | 13 | N1 | MINUS_SIGN |
      | 14 | O1 | MINUS_SIGN |
      | 15 | P1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  1 |
      |  1 |  2 |
      |  2 |  3 |
      |  3 |  4 |
      |  4 |  5 |
      |  5 |  6 |
      |  6 |  7 |
      |  7 |  8 |
      |  8 |  9 |
      |  9 | 10 |
      | 10 | 11 |
      | 11 | 12 |
      | 12 | 13 |
      | 13 | 14 |
      | 14 | 15 |
    When user expands on node "15"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | MINUS_SIGN |
      | 11 | L1 | MINUS_SIGN |
      | 12 | M1 | MINUS_SIGN |
      | 13 | N1 | MINUS_SIGN |
      | 14 | O1 | MINUS_SIGN |
      | 15 | P1 | MINUS_SIGN |
      | 16 | Q1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  1 |
      |  1 |  2 |
      |  2 |  3 |
      |  3 |  4 |
      |  4 |  5 |
      |  5 |  6 |
      |  6 |  7 |
      |  7 |  8 |
      |  8 |  9 |
      |  9 | 10 |
      | 10 | 11 |
      | 11 | 12 |
      | 12 | 13 |
      | 13 | 14 |
      | 14 | 15 |
      | 15 | 16 |
    When user expands on node "16"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | MINUS_SIGN |
      | 11 | L1 | MINUS_SIGN |
      | 12 | M1 | MINUS_SIGN |
      | 13 | N1 | MINUS_SIGN |
      | 14 | O1 | MINUS_SIGN |
      | 15 | P1 | MINUS_SIGN |
      | 16 | Q1 | MINUS_SIGN |
      | 17 | T1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  1 |
      |  1 |  2 |
      |  2 |  3 |
      |  3 |  4 |
      |  4 |  5 |
      |  5 |  6 |
      |  6 |  7 |
      |  7 |  8 |
      |  8 |  9 |
      |  9 | 10 |
      | 10 | 11 |
      | 11 | 12 |
      | 12 | 13 |
      | 13 | 14 |
      | 14 | 15 |
      | 15 | 16 |
      | 16 | 17 |
    When user expands on node "17"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | MINUS_SIGN |
      | 11 | L1 | MINUS_SIGN |
      | 12 | M1 | MINUS_SIGN |
      | 13 | N1 | MINUS_SIGN |
      | 14 | O1 | MINUS_SIGN |
      | 15 | P1 | MINUS_SIGN |
      | 16 | Q1 | MINUS_SIGN |
      | 17 | T1 | MINUS_SIGN |
      | 18 | R1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  1 |
      |  1 |  2 |
      |  2 |  3 |
      |  3 |  4 |
      |  4 |  5 |
      |  5 |  6 |
      |  6 |  7 |
      |  7 |  8 |
      |  8 |  9 |
      |  9 | 10 |
      | 10 | 11 |
      | 11 | 12 |
      | 12 | 13 |
      | 13 | 14 |
      | 14 | 15 |
      | 15 | 16 |
      | 16 | 17 |
      | 17 | 18 |
    When user expands on node "18"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | MINUS_SIGN |
      | 11 | L1 | MINUS_SIGN |
      | 12 | M1 | MINUS_SIGN |
      | 13 | N1 | MINUS_SIGN |
      | 14 | O1 | MINUS_SIGN |
      | 15 | P1 | MINUS_SIGN |
      | 16 | Q1 | MINUS_SIGN |
      | 17 | T1 | MINUS_SIGN |
      | 18 | R1 | MINUS_SIGN |
      | 19 | U1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  1 |
      |  1 |  2 |
      |  2 |  3 |
      |  3 |  4 |
      |  4 |  5 |
      |  5 |  6 |
      |  6 |  7 |
      |  7 |  8 |
      |  8 |  9 |
      |  9 | 10 |
      | 10 | 11 |
      | 11 | 12 |
      | 12 | 13 |
      | 13 | 14 |
      | 14 | 15 |
      | 15 | 16 |
      | 16 | 17 |
      | 17 | 18 |
      | 18 | 19 |
    When user expands on node "19"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | MINUS_SIGN |
      | 11 | L1 | MINUS_SIGN |
      | 12 | M1 | MINUS_SIGN |
      | 13 | N1 | MINUS_SIGN |
      | 14 | O1 | MINUS_SIGN |
      | 15 | P1 | MINUS_SIGN |
      | 16 | Q1 | MINUS_SIGN |
      | 17 | T1 | MINUS_SIGN |
      | 18 | R1 | MINUS_SIGN |
      | 19 | U1 | MINUS_SIGN |
      | 20 | V1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  1 |
      |  1 |  2 |
      |  2 |  3 |
      |  3 |  4 |
      |  4 |  5 |
      |  5 |  6 |
      |  6 |  7 |
      |  7 |  8 |
      |  8 |  9 |
      |  9 | 10 |
      | 10 | 11 |
      | 11 | 12 |
      | 12 | 13 |
      | 13 | 14 |
      | 14 | 15 |
      | 15 | 16 |
      | 16 | 17 |
      | 17 | 18 |
      | 18 | 19 |
      | 19 | 20 |
    When user expands on node "20"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | MINUS_SIGN |
      | 11 | L1 | MINUS_SIGN |
      | 12 | M1 | MINUS_SIGN |
      | 13 | N1 | MINUS_SIGN |
      | 14 | O1 | MINUS_SIGN |
      | 15 | P1 | MINUS_SIGN |
      | 16 | Q1 | MINUS_SIGN |
      | 17 | T1 | MINUS_SIGN |
      | 18 | R1 | MINUS_SIGN |
      | 19 | U1 | MINUS_SIGN |
      | 20 | V1 | MINUS_SIGN |
      | 21 | X1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  1 |
      |  1 |  2 |
      |  2 |  3 |
      |  3 |  4 |
      |  4 |  5 |
      |  5 |  6 |
      |  6 |  7 |
      |  7 |  8 |
      |  8 |  9 |
      |  9 | 10 |
      | 10 | 11 |
      | 11 | 12 |
      | 12 | 13 |
      | 13 | 14 |
      | 14 | 15 |
      | 15 | 16 |
      | 16 | 17 |
      | 17 | 18 |
      | 18 | 19 |
      | 19 | 20 |
      | 20 | 21 |
    When user collapses on node "20"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | MINUS_SIGN |
      | 11 | L1 | MINUS_SIGN |
      | 12 | M1 | MINUS_SIGN |
      | 13 | N1 | MINUS_SIGN |
      | 14 | O1 | MINUS_SIGN |
      | 15 | P1 | MINUS_SIGN |
      | 16 | Q1 | MINUS_SIGN |
      | 17 | T1 | MINUS_SIGN |
      | 18 | R1 | MINUS_SIGN |
      | 19 | U1 | MINUS_SIGN |
      | 20 | V1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  1 |
      |  1 |  2 |
      |  2 |  3 |
      |  3 |  4 |
      |  4 |  5 |
      |  5 |  6 |
      |  6 |  7 |
      |  7 |  8 |
      |  8 |  9 |
      |  9 | 10 |
      | 10 | 11 |
      | 11 | 12 |
      | 12 | 13 |
      | 13 | 14 |
      | 14 | 15 |
      | 15 | 16 |
      | 16 | 17 |
      | 17 | 18 |
      | 18 | 19 |
      | 19 | 20 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  1 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  2 | C1 | MINUS_SIGN |
      |  3 | D1 | MINUS_SIGN |
      |  4 | E1 | MINUS_SIGN |
      |  5 | F1 | MINUS_SIGN |
      |  6 | G1 | MINUS_SIGN |
      |  7 | H1 | MINUS_SIGN |
      |  8 | I1 | MINUS_SIGN |
      |  9 | J1 | MINUS_SIGN |
      | 10 | K1 | MINUS_SIGN |
      | 11 | L1 | MINUS_SIGN |
      | 12 | M1 | MINUS_SIGN |
      | 13 | N1 | MINUS_SIGN |
      | 14 | O1 | MINUS_SIGN |
      | 15 | P1 | MINUS_SIGN |
      | 16 | Q1 | MINUS_SIGN |
      | 17 | T1 | MINUS_SIGN |
      | 18 | R1 | MINUS_SIGN |
      | 19 | U1 | MINUS_SIGN |
      | 20 | V1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  1 |
      |  1 |  2 |
      |  2 |  3 |
      |  3 |  4 |
      |  4 |  5 |
      |  5 |  6 |
      |  6 |  7 |
      |  7 |  8 |
      |  8 |  9 |
      |  9 | 10 |
      | 10 | 11 |
      | 11 | 12 |
      | 12 | 13 |
      | 13 | 14 |
      | 14 | 15 |
      | 15 | 16 |
      | 16 | 17 |
      | 17 | 18 |
      | 18 | 19 |
      | 19 | 20 |

  #***********************************************
  Scenario: US07-118 Check expand & collapse node for a starting node when it have many incoming/ outgoing node from external table (#DataModel#Space)
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0>DMDV_v1.2.0Child"
    Given I access dataset "V120_US07-116"
    And I access table "TableB"
    And user views "Visualization>Display selected data" of record has ID is "B1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | MINUS_SIGN |
      | 1 | C1 | PLUS_SIGN  |
      | 2 | A1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 2 | 0 |
      | 0 | 1 |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | MINUS_SIGN |
      | 1 | C1 | MINUS_SIGN |
      | 2 | A1 |            |
      | 3 | D1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 2 | 0 |
      | 0 | 1 |
      | 1 | 3 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | MINUS_SIGN |
      | 1 | C1 | MINUS_SIGN |
      | 2 | A1 |            |
      | 3 | D1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 2 | 0 |
      | 0 | 1 |
      | 1 | 3 |

  #*******************************************
  Scenario: US07-119 Check expand & collapse node for a starting node when it have many incoming/ outgoing node from external table (#DataModel#Space)
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0>DMDV_v1.2.0Child"
    Given I access dataset "V120_US07-116"
    And I access table "TableX"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | X1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | X1 | MINUS_SIGN |
      | 1 | V1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | X1 | MINUS_SIGN |
      | 1 | V1 | MINUS_SIGN |
      | 2 | U1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
      | 2 | 1 |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | X1 | MINUS_SIGN |
      | 1 | V1 | MINUS_SIGN |
      | 2 | U1 | MINUS_SIGN |
      | 3 | R1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
      | 2 | 1 |
      | 3 | 2 |
    When user expands on node "3"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | X1 | MINUS_SIGN |
      | 1 | V1 | MINUS_SIGN |
      | 2 | U1 | MINUS_SIGN |
      | 3 | R1 | MINUS_SIGN |
      | 4 | T1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
      | 2 | 1 |
      | 3 | 2 |
      | 4 | 3 |
    When user expands on node "4"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | X1 | MINUS_SIGN |
      | 1 | V1 | MINUS_SIGN |
      | 2 | U1 | MINUS_SIGN |
      | 3 | R1 | MINUS_SIGN |
      | 4 | T1 | MINUS_SIGN |
      | 5 | Q1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
      | 2 | 1 |
      | 3 | 2 |
      | 4 | 3 |
      | 5 | 4 |
    When user expands on node "5"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | X1 | MINUS_SIGN |
      | 1 | V1 | MINUS_SIGN |
      | 2 | U1 | MINUS_SIGN |
      | 3 | R1 | MINUS_SIGN |
      | 4 | T1 | MINUS_SIGN |
      | 5 | Q1 | MINUS_SIGN |
      | 6 | P1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
      | 2 | 1 |
      | 3 | 2 |
      | 4 | 3 |
      | 5 | 4 |
      | 6 | 5 |
    When user expands on node "6"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | X1 | MINUS_SIGN |
      | 1 | V1 | MINUS_SIGN |
      | 2 | U1 | MINUS_SIGN |
      | 3 | R1 | MINUS_SIGN |
      | 4 | T1 | MINUS_SIGN |
      | 5 | Q1 | MINUS_SIGN |
      | 6 | P1 | MINUS_SIGN |
      | 7 | O1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
      | 2 | 1 |
      | 3 | 2 |
      | 4 | 3 |
      | 5 | 4 |
      | 6 | 5 |
      | 7 | 6 |
    When user expands on node "7"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | X1 | MINUS_SIGN |
      | 1 | V1 | MINUS_SIGN |
      | 2 | U1 | MINUS_SIGN |
      | 3 | R1 | MINUS_SIGN |
      | 4 | T1 | MINUS_SIGN |
      | 5 | Q1 | MINUS_SIGN |
      | 6 | P1 | MINUS_SIGN |
      | 7 | O1 | MINUS_SIGN |
      | 8 | N1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
      | 2 | 1 |
      | 3 | 2 |
      | 4 | 3 |
      | 5 | 4 |
      | 6 | 5 |
      | 7 | 6 |
      | 8 | 7 |
    When user expands on node "8"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | X1 | MINUS_SIGN |
      | 1 | V1 | MINUS_SIGN |
      | 2 | U1 | MINUS_SIGN |
      | 3 | R1 | MINUS_SIGN |
      | 4 | T1 | MINUS_SIGN |
      | 5 | Q1 | MINUS_SIGN |
      | 6 | P1 | MINUS_SIGN |
      | 7 | O1 | MINUS_SIGN |
      | 8 | N1 | MINUS_SIGN |
      | 9 | M1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
      | 2 | 1 |
      | 3 | 2 |
      | 4 | 3 |
      | 5 | 4 |
      | 6 | 5 |
      | 7 | 6 |
      | 8 | 7 |
      | 9 | 8 |
    When user expands on node "9"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  0 | X1 | MINUS_SIGN |
      |  1 | V1 | MINUS_SIGN |
      |  2 | U1 | MINUS_SIGN |
      |  3 | R1 | MINUS_SIGN |
      |  4 | T1 | MINUS_SIGN |
      |  5 | Q1 | MINUS_SIGN |
      |  6 | P1 | MINUS_SIGN |
      |  7 | O1 | MINUS_SIGN |
      |  8 | N1 | MINUS_SIGN |
      |  9 | M1 | MINUS_SIGN |
      | 10 | L1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  1 | 0 |
      |  2 | 1 |
      |  3 | 2 |
      |  4 | 3 |
      |  5 | 4 |
      |  6 | 5 |
      |  7 | 6 |
      |  8 | 7 |
      |  9 | 8 |
      | 10 | 9 |
    When user expands on node "10"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  0 | X1 | MINUS_SIGN |
      |  1 | V1 | MINUS_SIGN |
      |  2 | U1 | MINUS_SIGN |
      |  3 | R1 | MINUS_SIGN |
      |  4 | T1 | MINUS_SIGN |
      |  5 | Q1 | MINUS_SIGN |
      |  6 | P1 | MINUS_SIGN |
      |  7 | O1 | MINUS_SIGN |
      |  8 | N1 | MINUS_SIGN |
      |  9 | M1 | MINUS_SIGN |
      | 10 | L1 | MINUS_SIGN |
      | 11 | K1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  1 |  0 |
      |  2 |  1 |
      |  3 |  2 |
      |  4 |  3 |
      |  5 |  4 |
      |  6 |  5 |
      |  7 |  6 |
      |  8 |  7 |
      |  9 |  8 |
      | 10 |  9 |
      | 11 | 10 |
    When user expands on node "11"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  0 | X1 | MINUS_SIGN |
      |  1 | V1 | MINUS_SIGN |
      |  2 | U1 | MINUS_SIGN |
      |  3 | R1 | MINUS_SIGN |
      |  4 | T1 | MINUS_SIGN |
      |  5 | Q1 | MINUS_SIGN |
      |  6 | P1 | MINUS_SIGN |
      |  7 | O1 | MINUS_SIGN |
      |  8 | N1 | MINUS_SIGN |
      |  9 | M1 | MINUS_SIGN |
      | 10 | L1 | MINUS_SIGN |
      | 11 | K1 | MINUS_SIGN |
      | 12 | J1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  1 |  0 |
      |  2 |  1 |
      |  3 |  2 |
      |  4 |  3 |
      |  5 |  4 |
      |  6 |  5 |
      |  7 |  6 |
      |  8 |  7 |
      |  9 |  8 |
      | 10 |  9 |
      | 11 | 10 |
      | 12 | 11 |
    When user expands on node "12"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  0 | X1 | MINUS_SIGN |
      |  1 | V1 | MINUS_SIGN |
      |  2 | U1 | MINUS_SIGN |
      |  3 | R1 | MINUS_SIGN |
      |  4 | T1 | MINUS_SIGN |
      |  5 | Q1 | MINUS_SIGN |
      |  6 | P1 | MINUS_SIGN |
      |  7 | O1 | MINUS_SIGN |
      |  8 | N1 | MINUS_SIGN |
      |  9 | M1 | MINUS_SIGN |
      | 10 | L1 | MINUS_SIGN |
      | 11 | K1 | MINUS_SIGN |
      | 12 | J1 | MINUS_SIGN |
      | 13 | I1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  1 |  0 |
      |  2 |  1 |
      |  3 |  2 |
      |  4 |  3 |
      |  5 |  4 |
      |  6 |  5 |
      |  7 |  6 |
      |  8 |  7 |
      |  9 |  8 |
      | 10 |  9 |
      | 11 | 10 |
      | 12 | 11 |
      | 13 | 12 |
    When user expands on node "13"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  0 | X1 | MINUS_SIGN |
      |  1 | V1 | MINUS_SIGN |
      |  2 | U1 | MINUS_SIGN |
      |  3 | R1 | MINUS_SIGN |
      |  4 | T1 | MINUS_SIGN |
      |  5 | Q1 | MINUS_SIGN |
      |  6 | P1 | MINUS_SIGN |
      |  7 | O1 | MINUS_SIGN |
      |  8 | N1 | MINUS_SIGN |
      |  9 | M1 | MINUS_SIGN |
      | 10 | L1 | MINUS_SIGN |
      | 11 | K1 | MINUS_SIGN |
      | 12 | J1 | MINUS_SIGN |
      | 13 | I1 | MINUS_SIGN |
      | 14 | H1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  1 |  0 |
      |  2 |  1 |
      |  3 |  2 |
      |  4 |  3 |
      |  5 |  4 |
      |  6 |  5 |
      |  7 |  6 |
      |  8 |  7 |
      |  9 |  8 |
      | 10 |  9 |
      | 11 | 10 |
      | 12 | 11 |
      | 13 | 12 |
      | 14 | 13 |
    When user expands on node "14"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  0 | X1 | MINUS_SIGN |
      |  1 | V1 | MINUS_SIGN |
      |  2 | U1 | MINUS_SIGN |
      |  3 | R1 | MINUS_SIGN |
      |  4 | T1 | MINUS_SIGN |
      |  5 | Q1 | MINUS_SIGN |
      |  6 | P1 | MINUS_SIGN |
      |  7 | O1 | MINUS_SIGN |
      |  8 | N1 | MINUS_SIGN |
      |  9 | M1 | MINUS_SIGN |
      | 10 | L1 | MINUS_SIGN |
      | 11 | K1 | MINUS_SIGN |
      | 12 | J1 | MINUS_SIGN |
      | 13 | I1 | MINUS_SIGN |
      | 14 | H1 | MINUS_SIGN |
      | 15 | G1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  1 |  0 |
      |  2 |  1 |
      |  3 |  2 |
      |  4 |  3 |
      |  5 |  4 |
      |  6 |  5 |
      |  7 |  6 |
      |  8 |  7 |
      |  9 |  8 |
      | 10 |  9 |
      | 11 | 10 |
      | 12 | 11 |
      | 13 | 12 |
      | 14 | 13 |
      | 15 | 14 |
    When user expands on node "15"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  0 | X1 | MINUS_SIGN |
      |  1 | V1 | MINUS_SIGN |
      |  2 | U1 | MINUS_SIGN |
      |  3 | R1 | MINUS_SIGN |
      |  4 | T1 | MINUS_SIGN |
      |  5 | Q1 | MINUS_SIGN |
      |  6 | P1 | MINUS_SIGN |
      |  7 | O1 | MINUS_SIGN |
      |  8 | N1 | MINUS_SIGN |
      |  9 | M1 | MINUS_SIGN |
      | 10 | L1 | MINUS_SIGN |
      | 11 | K1 | MINUS_SIGN |
      | 12 | J1 | MINUS_SIGN |
      | 13 | I1 | MINUS_SIGN |
      | 14 | H1 | MINUS_SIGN |
      | 15 | G1 | MINUS_SIGN |
      | 16 | F1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  1 |  0 |
      |  2 |  1 |
      |  3 |  2 |
      |  4 |  3 |
      |  5 |  4 |
      |  6 |  5 |
      |  7 |  6 |
      |  8 |  7 |
      |  9 |  8 |
      | 10 |  9 |
      | 11 | 10 |
      | 12 | 11 |
      | 13 | 12 |
      | 14 | 13 |
      | 15 | 14 |
      | 16 | 15 |
    When user expands on node "16"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  0 | X1 | MINUS_SIGN |
      |  1 | V1 | MINUS_SIGN |
      |  2 | U1 | MINUS_SIGN |
      |  3 | R1 | MINUS_SIGN |
      |  4 | T1 | MINUS_SIGN |
      |  5 | Q1 | MINUS_SIGN |
      |  6 | P1 | MINUS_SIGN |
      |  7 | O1 | MINUS_SIGN |
      |  8 | N1 | MINUS_SIGN |
      |  9 | M1 | MINUS_SIGN |
      | 10 | L1 | MINUS_SIGN |
      | 11 | K1 | MINUS_SIGN |
      | 12 | J1 | MINUS_SIGN |
      | 13 | I1 | MINUS_SIGN |
      | 14 | H1 | MINUS_SIGN |
      | 15 | G1 | MINUS_SIGN |
      | 16 | F1 | MINUS_SIGN |
      | 17 | E1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  1 |  0 |
      |  2 |  1 |
      |  3 |  2 |
      |  4 |  3 |
      |  5 |  4 |
      |  6 |  5 |
      |  7 |  6 |
      |  8 |  7 |
      |  9 |  8 |
      | 10 |  9 |
      | 11 | 10 |
      | 12 | 11 |
      | 13 | 12 |
      | 14 | 13 |
      | 15 | 14 |
      | 16 | 15 |
      | 17 | 16 |
    When user expands on node "17"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  0 | X1 | MINUS_SIGN |
      |  1 | V1 | MINUS_SIGN |
      |  2 | U1 | MINUS_SIGN |
      |  3 | R1 | MINUS_SIGN |
      |  4 | T1 | MINUS_SIGN |
      |  5 | Q1 | MINUS_SIGN |
      |  6 | P1 | MINUS_SIGN |
      |  7 | O1 | MINUS_SIGN |
      |  8 | N1 | MINUS_SIGN |
      |  9 | M1 | MINUS_SIGN |
      | 10 | L1 | MINUS_SIGN |
      | 11 | K1 | MINUS_SIGN |
      | 12 | J1 | MINUS_SIGN |
      | 13 | I1 | MINUS_SIGN |
      | 14 | H1 | MINUS_SIGN |
      | 15 | G1 | MINUS_SIGN |
      | 16 | F1 | MINUS_SIGN |
      | 17 | E1 | MINUS_SIGN |
      | 18 | D1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  1 |  0 |
      |  2 |  1 |
      |  3 |  2 |
      |  4 |  3 |
      |  5 |  4 |
      |  6 |  5 |
      |  7 |  6 |
      |  8 |  7 |
      |  9 |  8 |
      | 10 |  9 |
      | 11 | 10 |
      | 12 | 11 |
      | 13 | 12 |
      | 14 | 13 |
      | 15 | 14 |
      | 16 | 15 |
      | 17 | 16 |
      | 18 | 17 |
    When user expands on node "18"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  0 | X1 | MINUS_SIGN |
      |  1 | V1 | MINUS_SIGN |
      |  2 | U1 | MINUS_SIGN |
      |  3 | R1 | MINUS_SIGN |
      |  4 | T1 | MINUS_SIGN |
      |  5 | Q1 | MINUS_SIGN |
      |  6 | P1 | MINUS_SIGN |
      |  7 | O1 | MINUS_SIGN |
      |  8 | N1 | MINUS_SIGN |
      |  9 | M1 | MINUS_SIGN |
      | 10 | L1 | MINUS_SIGN |
      | 11 | K1 | MINUS_SIGN |
      | 12 | J1 | MINUS_SIGN |
      | 13 | I1 | MINUS_SIGN |
      | 14 | H1 | MINUS_SIGN |
      | 15 | G1 | MINUS_SIGN |
      | 16 | F1 | MINUS_SIGN |
      | 17 | E1 | MINUS_SIGN |
      | 18 | D1 | MINUS_SIGN |
      | 19 | C1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  1 |  0 |
      |  2 |  1 |
      |  3 |  2 |
      |  4 |  3 |
      |  5 |  4 |
      |  6 |  5 |
      |  7 |  6 |
      |  8 |  7 |
      |  9 |  8 |
      | 10 |  9 |
      | 11 | 10 |
      | 12 | 11 |
      | 13 | 12 |
      | 14 | 13 |
      | 15 | 14 |
      | 16 | 15 |
      | 17 | 16 |
      | 18 | 17 |
      | 19 | 18 |
    When user expands on node "19"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  0 | X1 | MINUS_SIGN |
      |  1 | V1 | MINUS_SIGN |
      |  2 | U1 | MINUS_SIGN |
      |  3 | R1 | MINUS_SIGN |
      |  4 | T1 | MINUS_SIGN |
      |  5 | Q1 | MINUS_SIGN |
      |  6 | P1 | MINUS_SIGN |
      |  7 | O1 | MINUS_SIGN |
      |  8 | N1 | MINUS_SIGN |
      |  9 | M1 | MINUS_SIGN |
      | 10 | L1 | MINUS_SIGN |
      | 11 | K1 | MINUS_SIGN |
      | 12 | J1 | MINUS_SIGN |
      | 13 | I1 | MINUS_SIGN |
      | 14 | H1 | MINUS_SIGN |
      | 15 | G1 | MINUS_SIGN |
      | 16 | F1 | MINUS_SIGN |
      | 17 | E1 | MINUS_SIGN |
      | 18 | D1 | MINUS_SIGN |
      | 19 | C1 | MINUS_SIGN |
      | 20 | B1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  1 |  0 |
      |  2 |  1 |
      |  3 |  2 |
      |  4 |  3 |
      |  5 |  4 |
      |  6 |  5 |
      |  7 |  6 |
      |  8 |  7 |
      |  9 |  8 |
      | 10 |  9 |
      | 11 | 10 |
      | 12 | 11 |
      | 13 | 12 |
      | 14 | 13 |
      | 15 | 14 |
      | 16 | 15 |
      | 17 | 16 |
      | 18 | 17 |
      | 19 | 18 |
      | 20 | 19 |
    When user expands on node "20"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  0 | X1 | MINUS_SIGN |
      |  1 | V1 | MINUS_SIGN |
      |  2 | U1 | MINUS_SIGN |
      |  3 | R1 | MINUS_SIGN |
      |  4 | T1 | MINUS_SIGN |
      |  5 | Q1 | MINUS_SIGN |
      |  6 | P1 | MINUS_SIGN |
      |  7 | O1 | MINUS_SIGN |
      |  8 | N1 | MINUS_SIGN |
      |  9 | M1 | MINUS_SIGN |
      | 10 | L1 | MINUS_SIGN |
      | 11 | K1 | MINUS_SIGN |
      | 12 | J1 | MINUS_SIGN |
      | 13 | I1 | MINUS_SIGN |
      | 14 | H1 | MINUS_SIGN |
      | 15 | G1 | MINUS_SIGN |
      | 16 | F1 | MINUS_SIGN |
      | 17 | E1 | MINUS_SIGN |
      | 18 | D1 | MINUS_SIGN |
      | 19 | C1 | MINUS_SIGN |
      | 20 | B1 | MINUS_SIGN |
      | 21 | A1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  1 |  0 |
      |  2 |  1 |
      |  3 |  2 |
      |  4 |  3 |
      |  5 |  4 |
      |  6 |  5 |
      |  7 |  6 |
      |  8 |  7 |
      |  9 |  8 |
      | 10 |  9 |
      | 11 | 10 |
      | 12 | 11 |
      | 13 | 12 |
      | 14 | 13 |
      | 15 | 14 |
      | 16 | 15 |
      | 17 | 16 |
      | 18 | 17 |
      | 19 | 18 |
      | 20 | 19 |
      | 21 | 20 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | X1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  0 | X1 | MINUS_SIGN |
      |  1 | V1 | MINUS_SIGN |
      |  2 | U1 | MINUS_SIGN |
      |  3 | R1 | MINUS_SIGN |
      |  4 | T1 | MINUS_SIGN |
      |  5 | Q1 | MINUS_SIGN |
      |  6 | P1 | MINUS_SIGN |
      |  7 | O1 | MINUS_SIGN |
      |  8 | N1 | MINUS_SIGN |
      |  9 | M1 | MINUS_SIGN |
      | 10 | L1 | MINUS_SIGN |
      | 11 | K1 | MINUS_SIGN |
      | 12 | J1 | MINUS_SIGN |
      | 13 | I1 | MINUS_SIGN |
      | 14 | H1 | MINUS_SIGN |
      | 15 | G1 | MINUS_SIGN |
      | 16 | F1 | MINUS_SIGN |
      | 17 | E1 | MINUS_SIGN |
      | 18 | D1 | MINUS_SIGN |
      | 19 | C1 | MINUS_SIGN |
      | 20 | B1 | MINUS_SIGN |
      | 21 | A1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  1 |  0 |
      |  2 |  1 |
      |  3 |  2 |
      |  4 |  3 |
      |  5 |  4 |
      |  6 |  5 |
      |  7 |  6 |
      |  8 |  7 |
      |  9 |  8 |
      | 10 |  9 |
      | 11 | 10 |
      | 12 | 11 |
      | 13 | 12 |
      | 14 | 13 |
      | 15 | 14 |
      | 16 | 15 |
      | 17 | 16 |
      | 18 | 17 |
      | 19 | 18 |
      | 20 | 19 |
      | 21 | 20 |

  #************************************************
  Scenario: US07-120 Check expand & collapse node for a starting node when it have many incoming/ outgoing node from external table (n datamodel,#Dataset,#Dataspace)
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_externalTable"
    And I access table "/root/GroupA/TableA_120" on group "/root/GroupA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1  | MINUS_SIGN |
      | 1 | C1  |            |
      | 2 | A'1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1  | MINUS_SIGN |
      | 1 | C1  |            |
      | 2 | A'1 | MINUS_SIGN |
      | 3 | B1  | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
      | 2 | 3 |
    When user expands on node "3"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1  | MINUS_SIGN |
      | 1 | C1  |            |
      | 2 | A'1 | MINUS_SIGN |
      | 3 | B1  | MINUS_SIGN |
      | 4 | C1  |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
      | 2 | 3 |
      | 3 | 4 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1  | MINUS_SIGN |
      | 1 | C1  |            |
      | 2 | A'1 | MINUS_SIGN |
      | 3 | B1  | MINUS_SIGN |
      | 4 | C1  |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
      | 2 | 3 |
      | 3 | 4 |

  #***************************************************
  Scenario: US07-121 Check expand & collapse node for a starting node when it have many incoming/ outgoing node from external table (n datamodel,#Dataset,#Dataspace)
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_externalTable"
    And I access table "/root/GroupA/TableA_120" on group "/root/GroupA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1  | MINUS_SIGN |
      | 1 | C1  |            |
      | 2 | A'1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1  | MINUS_SIGN |
      | 1 | C1  |            |
      | 2 | A'1 | MINUS_SIGN |
      | 3 | B1  | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
      | 2 | 3 |
    When user expands on node "3"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1  | MINUS_SIGN |
      | 1 | C1  |            |
      | 2 | A'1 | MINUS_SIGN |
      | 3 | B1  | MINUS_SIGN |
      | 4 | C1  |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
      | 2 | 3 |
      | 3 | 4 |
    When user collapses on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1  | MINUS_SIGN |
      | 1 | C1  |            |
      | 2 | A'1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1  | MINUS_SIGN |
      | 1 | C1  |            |
      | 2 | A'1 | MINUS_SIGN |
      | 3 | B1  | MINUS_SIGN |
      | 4 | C1  |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
      | 2 | 3 |
      | 3 | 4 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |

  #*********************************************
  Scenario: US07-122 Check expand & collapse node for a starting node when it have many incoming/ outgoing node from external table (#DataModel#Space)
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0>DMDV_v1.2.0Child"
    Given I access dataset "V120_US07-120.1"
    And I access table "TableC"
    And user views "Visualization>Display selected data" of record has ID is "1"
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
      | 0 | C1  | MINUS_SIGN |
      | 1 | A1  | MINUS_SIGN |
      | 2 | A'1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 2 |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1  | MINUS_SIGN |
      | 1 | A1  | MINUS_SIGN |
      | 2 | A'1 | MINUS_SIGN |
      | 3 | B1  | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 2 |
      | 2 | 3 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1 | PLUS_SIGN |

  #******************************************
  Scenario: US07-123 Check expand & collapse node for a starting node when it have many incoming& outgoing node from external of external table (#DataModel)
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_externalTable"
    And I access table "/root/GroupA/TableA_123" on group "/root/GroupA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1      | MINUS_SIGN |
      | 1 | D1 - A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 0 |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1      | MINUS_SIGN |
      | 1 | D1 - A1 | MINUS_SIGN |
      | 2 | C1      |            |
      | 3 | C2      |            |
      | 4 | D1      | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 0 |
      | 2 | 1 |
      | 1 | 4 |
      | 3 | 1 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1      | MINUS_SIGN |
      | 1 | D1 - A1 | MINUS_SIGN |
      | 2 | C1      |            |
      | 3 | C2      |            |
      | 4 | D1      | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 0 |
      | 2 | 1 |
      | 1 | 4 |
      | 3 | 1 |

  #*****************************************
  Scenario: US07-124 Check expand & collapse node for a starting node when it have many incoming& outgoing node from external of external table (#DataModel)
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_externalTable"
    And I access table "/root/GroupA/TableA_123" on group "/root/GroupA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1      | MINUS_SIGN |
      | 1 | D1 - A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 0 |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1      | MINUS_SIGN |
      | 1 | D1 - A1 | MINUS_SIGN |
      | 2 | C1      |            |
      | 3 | C2      |            |
      | 4 | D1      | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 0 |
      | 2 | 1 |
      | 1 | 4 |
      | 3 | 1 |
    When user collapses on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1      | MINUS_SIGN |
      | 1 | D1 - A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 0 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1      | MINUS_SIGN |
      | 1 | D1 - A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 0 |

  #*****************************************
  Scenario: US07-126 CCheck expand & collapse node for a starting node when it have many incoming& outgoing node from external of external table (#DataModel)
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0>DMDV_v1.2.0Child"
    Given I access dataset "V120_US07-120.1"
    And I access table "TableC_123"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1      | MINUS_SIGN |
      | 1 | D1 - A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1      | MINUS_SIGN |
      | 1 | D1 - A1 | MINUS_SIGN |
      | 2 | C2      |            |
      | 3 | A1      |            |
      | 4 | D1      | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 3 | 1 |
      | 1 | 4 |
      | 1 | 3 |
      | 2 | 1 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1 | PLUS_SIGN |

  #******************************************
  Scenario: US07-148 Check expand & collapse node for a starting node when it have many incoming& outgoing node from external table (#Dataset-sameDataModel)
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_externalTable"
    And I access table "/root/GroupA/TableA_128" on group "/root/GroupA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1  | MINUS_SIGN |
      | 1 | A'1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
