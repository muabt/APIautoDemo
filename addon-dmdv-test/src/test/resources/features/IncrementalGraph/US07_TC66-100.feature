#Author: tbui@tibco.com
@DMDV120
Feature: US07-Provide service for incremental tree (another table (Same dataset))

  Background: 
    Given I login to EBX succesfully

  Scenario: US07-66- Check expand collapse node when it has a incoming node on another table by many FKs
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-66"
    And I access table "TableA"
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
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |

  #*********************************************
   Scenario: US07-67- Check expand collapse node when it has a outgoing node on another table by  many FKs
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-67"
    And I access table "TableA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 2 | B1 |            |
      | 1 | C1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 1 |
      | 0 | 2 |
      | 0 | 2 |
      | 0 | 2 |      
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |

  #***********************************************
  Scenario: US07-68- Check expand collapse node when it has a incoming & outgoing node on another table by  many FKs
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-68"
    And I access table "TableA"
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
      | 0 | 1 |
      | 0 | 1 |
      | 0 | 1 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |

  #*************************************************
  Scenario: US07-69-70 Check expand & collapse node for a starting node when it have many incoming node on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-69"
    And I access table "TableA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 2 | B1 |            |
      | 1 | C1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
      | 2 | 0 |
      | 0 | 0 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 2 | B1 |            |
      | 1 | C1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
      | 2 | 0 |
      | 0 | 0 |

  #**************************************************
  Scenario: US07-71 Check expand & collapse node for a starting node when it have many incoming node on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-69"
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
      | 2 | B1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 1 |
      | 2 | 1 |
    When user collapses on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1 | MINUS_SIGN |
      | 1 | A1 | PLUS_SIGN  |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1 | MINUS_SIGN |
      | 1 | A1 | MINUS_SIGN |
      | 2 | B1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 1 |
      | 2 | 1 |
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
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 1 |
      | 2 | 1 |

  #**************************************************
  Scenario: US07-72 Check expand & collapse node for a starting node when it have many incoming node on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-72"
    And I access table "TableB"
    And user views "Visualization>Display selected data" of records have ID are
      | 1 |
      | 2 |
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | PLUS_SIGN |
      | 0 | B2 | PLUS_SIGN |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | MINUS_SIGN |
      | 2 | A1 | PLUS_SIGN  |
      | 0 | B2 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 2 |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 2 | A1 | MINUS_SIGN |
      | 1 | B1 | MINUS_SIGN |
      | 0 | B2 |            |
      | 4 | B3 |            |
      | 3 | Bn |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 3 | 2 |
      | 4 | 2 |
      | 0 | 2 |
      | 1 | 2 |
      | 2 | 2 |
    When user collapses on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | PLUS_SIGN |
      | 0 | B2 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | PLUS_SIGN  |
      | 0 | B2 | MINUS_SIGN |
      | 4 | B3 |            |
      | 3 | Bn |            |
      | 2 | A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 3 | 2 |
      | 4 | 2 |
      | 0 | 2 |
      | 2 | 2 |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 |            |
      | 0 | B2 | MINUS_SIGN |
      | 4 | B3 |            |
      | 3 | Bn |            |
      | 2 | A1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 3 | 2 |
      | 4 | 2 |
      | 0 | 2 |
      | 1 | 2 |
      | 2 | 2 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | PLUS_SIGN |
      | 0 | B2 | PLUS_SIGN |

  #**************************************************
  Scenario: US07-73 Check expand & collapse node for a starting node when it have many incoming node on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-72"
    And I access table "TableB"
    And user views "Visualization>Display selected data" of records have ID are
      | 1 |
      | 2 |
      | 3 |
      | 4 |
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | PLUS_SIGN |
      | 0 | B2 | PLUS_SIGN |
      | 3 | B3 | PLUS_SIGN |
      | 2 | Bn | PLUS_SIGN |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | MINUS_SIGN |
      | 4 | A1 | PLUS_SIGN  |
      | 0 | B2 | PLUS_SIGN  |
      | 3 | B3 | PLUS_SIGN  |
      | 2 | Bn | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 4 |
    When user expands on node "4"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 4 | A1 | MINUS_SIGN |
      | 1 | B1 | MINUS_SIGN |
      | 0 | B2 |            |
      | 3 | B3 |            |
      | 2 | Bn |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 2 | 4 |
      | 3 | 4 |
      | 0 | 4 |
      | 1 | 4 |
      | 4 | 4 |
    When user collapses on node "4"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | MINUS_SIGN |
      | 4 | A1 | PLUS_SIGN  |
      | 0 | B2 | PLUS_SIGN  |
      | 3 | B3 | PLUS_SIGN  |
      | 2 | Bn | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 4 |
    When user collapses on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | PLUS_SIGN |
      | 0 | B2 | PLUS_SIGN |
      | 3 | B3 | PLUS_SIGN |
      | 2 | Bn | PLUS_SIGN |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | MINUS_SIGN |
      | 4 | A1 | PLUS_SIGN  |
      | 0 | B2 | PLUS_SIGN  |
      | 3 | B3 | PLUS_SIGN  |
      | 2 | Bn | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 4 |

  Scenario: US07-74-75- Check expand & collapse node for a starting node when it have many outgoing node on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-74"
    And I access table "TableA"
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
      | 2 | C1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 0 |
      | 0 | 2 |
      | 0 | 1 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | B1 |            |
      | 2 | C1 |            |

  Scenario: US07-76 Check expand & collapse node for a starting node when it have many outgoing node on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-74"
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
      | 1 | A1 | MINUS_SIGN |
      | 2 | B1 |            |
      | 0 | C1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 1 |
      | 1 | 2 |
      | 1 | 0 |
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
      | 1 | A1 | MINUS_SIGN |
      | 2 | B1 |            |
      | 0 | C1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 1 |
      | 1 | 2 |
      | 1 | 0 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | A1 | MINUS_SIGN |
      | 2 | B1 |            |
      | 0 | C1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 1 |
      | 1 | 2 |
      | 1 | 0 |

  #********************************************
  Scenario: US07-77 Check expand & collapse node for many starting node when it have many outgoing node on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-77"
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
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 2 | A1 | MINUS_SIGN |
      | 0 | B1 | MINUS_SIGN |
      | 1 | B2 |            |
      | 3 | B3 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 2 | 1 |
      | 2 | 2 |
      | 2 | 3 |
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
      | 3 | B3 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 2 | 1 |
      | 2 | 2 |
      | 2 | 3 |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 |            |
      | 1 | B2 | MINUS_SIGN |
      | 2 | A1 | MINUS_SIGN |
      | 3 | B3 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 2 | 1 |
      | 2 | 2 |
      | 2 | 3 |
      | 2 | 0 |
    When user collapses on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | PLUS_SIGN |
      | 1 | B2 | PLUS_SIGN |

  #*************************************************
  Scenario: US07-78 Check expand & collapse node for many starting node when it have many outgoing node on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-77"
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
      | 2 | B1 | PLUS_SIGN |
      | 4 | B2 | PLUS_SIGN |
      | 3 | B3 | PLUS_SIGN |
      | 1 | B4 |           |
      | 0 | B5 |           |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 2 | B1 | MINUS_SIGN |
      | 4 | B2 | PLUS_SIGN  |
      | 3 | B3 | PLUS_SIGN  |
      | 1 | B4 |            |
      | 0 | B5 |            |
      | 5 | A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 5 | 2 |
    When user expands on node "5"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 2 | B1 | MINUS_SIGN |
      | 4 | B2 |            |
      | 3 | B3 |            |
      | 1 | B4 |            |
      | 0 | B5 |            |
      | 5 | A1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 5 | 4 |
      | 5 | 3 |
      | 5 | 5 |
      | 5 | 2 |
    When user collapses on node "5"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 2 | B1 | MINUS_SIGN |
      | 4 | B2 | PLUS_SIGN  |
      | 3 | B3 | PLUS_SIGN  |
      | 1 | B4 |            |
      | 0 | B5 |            |
      | 5 | A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 5 | 2 |
    When user collapses on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 2 | B1 | PLUS_SIGN |
      | 4 | B2 | PLUS_SIGN |
      | 3 | B3 | PLUS_SIGN |
      | 1 | B4 |           |
      | 0 | B5 |           |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      #| Key | Label | Button Icon |
      | 2 | B1 | MINUS_SIGN |
      | 4 | B2 | PLUS_SIGN  |
      | 3 | B3 | PLUS_SIGN  |
      | 1 | B4 |            |
      | 0 | B5 |            |
      | 5 | A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 5 | 2 |

  #**************************************************
  Scenario: US07-79 Check expand & collapse node for many starting node when it have many incoming & outgoing node on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-79"
    And I access table "TableA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 3 | B1 |            |
      | 4 | C1 |            |
      | 1 | D1 |            |
      | 2 | E1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
      | 2 | 0 |
      | 0 | 0 |
      | 0 | 3 |
      | 0 | 4 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |

  #****************************************************
  Scenario: US07-80 Check expand & collapse node for many starting node when it have many incoming & outgoing node on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-79"
    And I access table "TableB"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | A1 | PLUS_SIGN  |
      | 0 | B1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | A1 | MINUS_SIGN |
      | 0 | B1 | MINUS_SIGN |
      | 4 | C1 |            |
      | 2 | D1 |            |
      | 3 | E1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 2 | 1 |
      | 3 | 1 |
      | 1 | 4 |
      | 1 | 1 |
      | 1 | 0 |
    When user collapses on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | A1 | PLUS_SIGN  |
      | 0 | B1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | A1 | MINUS_SIGN |
      | 0 | B1 | MINUS_SIGN |
      | 4 | C1 |            |
      | 2 | D1 |            |
      | 3 | E1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 2 | 1 |
      | 3 | 1 |
      | 1 | 4 |
      | 1 | 1 |
      | 1 | 0 |
    When user collapses on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | MINUS_SIGN |
      | 1 | A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | A1 | PLUS_SIGN  |
      | 0 | B1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |

  #****************************************************
  Scenario: US07-81 Check expand & collapse node for a starting node when it have many incoming/ outgoing node (n level) on another table
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-81"
    And I access table "TableA"
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

  #*************************************************
  Scenario: US07-82 Check expand & collapse node for a starting node when it have many incoming/ outgoing node (n level) on another table
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-81"
    And I access table "TableA"
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
    When user collapses on node "5"
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
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
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

  #********************************************
  Scenario: US07-83 Check expand & collapse node for a starting node when it have many incoming/ outgoing node (n level) on another table
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-83"
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
      | 1 | C1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | MINUS_SIGN |
      | 1 | C1 | MINUS_SIGN |
      | 2 | D1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 2 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | MINUS_SIGN |
      | 1 | C1 | MINUS_SIGN |
      | 2 | D1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 2 |

  #*******************************************
  Scenario: US07-84 Check expand & collapse node for a starting node when it have many incoming/ outgoing node (n level) on another table
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-84"
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
  Scenario: US07-85 Check expand & collapse node for a starting node when it have many incoming/ outgoing node (n level) on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-85"
    And I access table "TableA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 2 | B1 | PLUS_SIGN  |
      | 0 | A1 | MINUS_SIGN |
      | 1 | X1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 2 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
      | 1 | X1 | PLUS_SIGN  |
      | 3 | C1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
      | 2 | 3 |
    When user expands on node "3"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 2 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
      | 1 | X1 | PLUS_SIGN  |
      | 3 | C1 | MINUS_SIGN |
      | 4 | D1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
      | 2 | 3 |
      | 3 | 4 |
    When user expands on node "4"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 2 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
      | 1 | X1 | PLUS_SIGN  |
      | 3 | C1 | MINUS_SIGN |
      | 4 | D1 | MINUS_SIGN |
      | 5 | E1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
      | 2 | 3 |
      | 3 | 4 |
      | 4 | 5 |
    When user expands on node "5"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 2 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
      | 1 | X1 | PLUS_SIGN  |
      | 3 | C1 | MINUS_SIGN |
      | 4 | D1 | MINUS_SIGN |
      | 5 | E1 | MINUS_SIGN |
      | 6 | F1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
      | 2 | 3 |
      | 3 | 4 |
      | 4 | 5 |
      | 5 | 6 |
    When user expands on node "6"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 2 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
      | 1 | X1 | PLUS_SIGN  |
      | 3 | C1 | MINUS_SIGN |
      | 4 | D1 | MINUS_SIGN |
      | 5 | E1 | MINUS_SIGN |
      | 6 | F1 | MINUS_SIGN |
      | 7 | G1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
      | 2 | 3 |
      | 3 | 4 |
      | 4 | 5 |
      | 5 | 6 |
      | 6 | 7 |
    When user expands on node "7"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 2 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
      | 1 | X1 | PLUS_SIGN  |
      | 3 | C1 | MINUS_SIGN |
      | 4 | D1 | MINUS_SIGN |
      | 5 | E1 | MINUS_SIGN |
      | 6 | F1 | MINUS_SIGN |
      | 7 | G1 | MINUS_SIGN |
      | 8 | H1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
      | 2 | 3 |
      | 3 | 4 |
      | 4 | 5 |
      | 5 | 6 |
      | 6 | 7 |
      | 7 | 8 |
    When user expands on node "8"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 2 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
      | 1 | X1 | PLUS_SIGN  |
      | 3 | C1 | MINUS_SIGN |
      | 4 | D1 | MINUS_SIGN |
      | 5 | E1 | MINUS_SIGN |
      | 6 | F1 | MINUS_SIGN |
      | 7 | G1 | MINUS_SIGN |
      | 8 | H1 | MINUS_SIGN |
      | 9 | I1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
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
      |  2 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  1 | X1 | PLUS_SIGN  |
      |  3 | C1 | MINUS_SIGN |
      |  4 | D1 | MINUS_SIGN |
      |  5 | E1 | MINUS_SIGN |
      |  6 | F1 | MINUS_SIGN |
      |  7 | G1 | MINUS_SIGN |
      |  8 | H1 | MINUS_SIGN |
      |  9 | I1 | MINUS_SIGN |
      | 10 | J1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 |  2 |
      | 1 |  0 |
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
      |  2 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  1 | X1 | PLUS_SIGN  |
      |  3 | C1 | MINUS_SIGN |
      |  4 | D1 | MINUS_SIGN |
      |  5 | E1 | MINUS_SIGN |
      |  6 | F1 | MINUS_SIGN |
      |  7 | G1 | MINUS_SIGN |
      |  8 | H1 | MINUS_SIGN |
      |  9 | I1 | MINUS_SIGN |
      | 10 | J1 | MINUS_SIGN |
      | 11 | K1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  2 |
      |  1 |  0 |
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
      |  2 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  1 | X1 | PLUS_SIGN  |
      |  3 | C1 | MINUS_SIGN |
      |  4 | D1 | MINUS_SIGN |
      |  5 | E1 | MINUS_SIGN |
      |  6 | F1 | MINUS_SIGN |
      |  7 | G1 | MINUS_SIGN |
      |  8 | H1 | MINUS_SIGN |
      |  9 | I1 | MINUS_SIGN |
      | 10 | J1 | MINUS_SIGN |
      | 11 | K1 | MINUS_SIGN |
      | 12 | L1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  2 |
      |  1 |  0 |
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
      |  2 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  1 | X1 | PLUS_SIGN  |
      |  3 | C1 | MINUS_SIGN |
      |  4 | D1 | MINUS_SIGN |
      |  5 | E1 | MINUS_SIGN |
      |  6 | F1 | MINUS_SIGN |
      |  7 | G1 | MINUS_SIGN |
      |  8 | H1 | MINUS_SIGN |
      |  9 | I1 | MINUS_SIGN |
      | 10 | J1 | MINUS_SIGN |
      | 11 | K1 | MINUS_SIGN |
      | 12 | L1 | MINUS_SIGN |
      | 13 | M1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  2 |
      |  1 |  0 |
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
      |  2 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  1 | X1 | PLUS_SIGN  |
      |  3 | C1 | MINUS_SIGN |
      |  4 | D1 | MINUS_SIGN |
      |  5 | E1 | MINUS_SIGN |
      |  6 | F1 | MINUS_SIGN |
      |  7 | G1 | MINUS_SIGN |
      |  8 | H1 | MINUS_SIGN |
      |  9 | I1 | MINUS_SIGN |
      | 10 | J1 | MINUS_SIGN |
      | 11 | K1 | MINUS_SIGN |
      | 12 | L1 | MINUS_SIGN |
      | 13 | M1 | MINUS_SIGN |
      | 14 | N1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  2 |
      |  1 |  0 |
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
      |  2 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  1 | X1 | PLUS_SIGN  |
      |  3 | C1 | MINUS_SIGN |
      |  4 | D1 | MINUS_SIGN |
      |  5 | E1 | MINUS_SIGN |
      |  6 | F1 | MINUS_SIGN |
      |  7 | G1 | MINUS_SIGN |
      |  8 | H1 | MINUS_SIGN |
      |  9 | I1 | MINUS_SIGN |
      | 10 | J1 | MINUS_SIGN |
      | 11 | K1 | MINUS_SIGN |
      | 12 | L1 | MINUS_SIGN |
      | 13 | M1 | MINUS_SIGN |
      | 14 | N1 | MINUS_SIGN |
      | 15 | O1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  2 |
      |  1 |  0 |
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
      |  2 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  1 | X1 | PLUS_SIGN  |
      |  3 | C1 | MINUS_SIGN |
      |  4 | D1 | MINUS_SIGN |
      |  5 | E1 | MINUS_SIGN |
      |  6 | F1 | MINUS_SIGN |
      |  7 | G1 | MINUS_SIGN |
      |  8 | H1 | MINUS_SIGN |
      |  9 | I1 | MINUS_SIGN |
      | 10 | J1 | MINUS_SIGN |
      | 11 | K1 | MINUS_SIGN |
      | 12 | L1 | MINUS_SIGN |
      | 13 | M1 | MINUS_SIGN |
      | 14 | N1 | MINUS_SIGN |
      | 15 | O1 | MINUS_SIGN |
      | 16 | P1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  2 |
      |  1 |  0 |
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
      |  2 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  1 | X1 | PLUS_SIGN  |
      |  3 | C1 | MINUS_SIGN |
      |  4 | D1 | MINUS_SIGN |
      |  5 | E1 | MINUS_SIGN |
      |  6 | F1 | MINUS_SIGN |
      |  7 | G1 | MINUS_SIGN |
      |  8 | H1 | MINUS_SIGN |
      |  9 | I1 | MINUS_SIGN |
      | 10 | J1 | MINUS_SIGN |
      | 11 | K1 | MINUS_SIGN |
      | 12 | L1 | MINUS_SIGN |
      | 13 | M1 | MINUS_SIGN |
      | 14 | N1 | MINUS_SIGN |
      | 15 | O1 | MINUS_SIGN |
      | 16 | P1 | MINUS_SIGN |
      | 17 | Q1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  2 |
      |  1 |  0 |
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
      |  2 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  1 | X1 | PLUS_SIGN  |
      |  3 | C1 | MINUS_SIGN |
      |  4 | D1 | MINUS_SIGN |
      |  5 | E1 | MINUS_SIGN |
      |  6 | F1 | MINUS_SIGN |
      |  7 | G1 | MINUS_SIGN |
      |  8 | H1 | MINUS_SIGN |
      |  9 | I1 | MINUS_SIGN |
      | 10 | J1 | MINUS_SIGN |
      | 11 | K1 | MINUS_SIGN |
      | 12 | L1 | MINUS_SIGN |
      | 13 | M1 | MINUS_SIGN |
      | 14 | N1 | MINUS_SIGN |
      | 15 | O1 | MINUS_SIGN |
      | 16 | P1 | MINUS_SIGN |
      | 17 | Q1 | MINUS_SIGN |
      | 18 | T1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  2 |
      |  1 |  0 |
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
      |  2 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  1 | X1 | PLUS_SIGN  |
      |  3 | C1 | MINUS_SIGN |
      |  4 | D1 | MINUS_SIGN |
      |  5 | E1 | MINUS_SIGN |
      |  6 | F1 | MINUS_SIGN |
      |  7 | G1 | MINUS_SIGN |
      |  8 | H1 | MINUS_SIGN |
      |  9 | I1 | MINUS_SIGN |
      | 10 | J1 | MINUS_SIGN |
      | 11 | K1 | MINUS_SIGN |
      | 12 | L1 | MINUS_SIGN |
      | 13 | M1 | MINUS_SIGN |
      | 14 | N1 | MINUS_SIGN |
      | 15 | O1 | MINUS_SIGN |
      | 16 | P1 | MINUS_SIGN |
      | 17 | Q1 | MINUS_SIGN |
      | 18 | T1 | MINUS_SIGN |
      | 19 | R1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  2 |
      |  1 |  0 |
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
      |  2 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  1 | X1 | PLUS_SIGN  |
      |  3 | C1 | MINUS_SIGN |
      |  4 | D1 | MINUS_SIGN |
      |  5 | E1 | MINUS_SIGN |
      |  6 | F1 | MINUS_SIGN |
      |  7 | G1 | MINUS_SIGN |
      |  8 | H1 | MINUS_SIGN |
      |  9 | I1 | MINUS_SIGN |
      | 10 | J1 | MINUS_SIGN |
      | 11 | K1 | MINUS_SIGN |
      | 12 | L1 | MINUS_SIGN |
      | 13 | M1 | MINUS_SIGN |
      | 14 | N1 | MINUS_SIGN |
      | 15 | O1 | MINUS_SIGN |
      | 16 | P1 | MINUS_SIGN |
      | 17 | Q1 | MINUS_SIGN |
      | 18 | T1 | MINUS_SIGN |
      | 19 | R1 | MINUS_SIGN |
      | 20 | U1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  2 |
      |  1 |  0 |
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
      |  2 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  1 | X1 | PLUS_SIGN  |
      |  3 | C1 | MINUS_SIGN |
      |  4 | D1 | MINUS_SIGN |
      |  5 | E1 | MINUS_SIGN |
      |  6 | F1 | MINUS_SIGN |
      |  7 | G1 | MINUS_SIGN |
      |  8 | H1 | MINUS_SIGN |
      |  9 | I1 | MINUS_SIGN |
      | 10 | J1 | MINUS_SIGN |
      | 11 | K1 | MINUS_SIGN |
      | 12 | L1 | MINUS_SIGN |
      | 13 | M1 | MINUS_SIGN |
      | 14 | N1 | MINUS_SIGN |
      | 15 | O1 | MINUS_SIGN |
      | 16 | P1 | MINUS_SIGN |
      | 17 | Q1 | MINUS_SIGN |
      | 18 | T1 | MINUS_SIGN |
      | 19 | R1 | MINUS_SIGN |
      | 20 | U1 | MINUS_SIGN |
      | 21 | V1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  2 |
      |  1 |  0 |
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
    When user expands on node "21"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  2 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  1 | X1 |            |
      |  3 | C1 | MINUS_SIGN |
      |  4 | D1 | MINUS_SIGN |
      |  5 | E1 | MINUS_SIGN |
      |  6 | F1 | MINUS_SIGN |
      |  7 | G1 | MINUS_SIGN |
      |  8 | H1 | MINUS_SIGN |
      |  9 | I1 | MINUS_SIGN |
      | 10 | J1 | MINUS_SIGN |
      | 11 | K1 | MINUS_SIGN |
      | 12 | L1 | MINUS_SIGN |
      | 13 | M1 | MINUS_SIGN |
      | 14 | N1 | MINUS_SIGN |
      | 15 | O1 | MINUS_SIGN |
      | 16 | P1 | MINUS_SIGN |
      | 17 | Q1 | MINUS_SIGN |
      | 18 | T1 | MINUS_SIGN |
      | 19 | R1 | MINUS_SIGN |
      | 20 | U1 | MINUS_SIGN |
      | 21 | V1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  2 |
      |  1 |  0 |
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
      | 21 |  1 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      |  2 | B1 | MINUS_SIGN |
      |  0 | A1 | MINUS_SIGN |
      |  1 | X1 |            |
      |  3 | C1 | MINUS_SIGN |
      |  4 | D1 | MINUS_SIGN |
      |  5 | E1 | MINUS_SIGN |
      |  6 | F1 | MINUS_SIGN |
      |  7 | G1 | MINUS_SIGN |
      |  8 | H1 | MINUS_SIGN |
      |  9 | I1 | MINUS_SIGN |
      | 10 | J1 | MINUS_SIGN |
      | 11 | K1 | MINUS_SIGN |
      | 12 | L1 | MINUS_SIGN |
      | 13 | M1 | MINUS_SIGN |
      | 14 | N1 | MINUS_SIGN |
      | 15 | O1 | MINUS_SIGN |
      | 16 | P1 | MINUS_SIGN |
      | 17 | Q1 | MINUS_SIGN |
      | 18 | T1 | MINUS_SIGN |
      | 19 | R1 | MINUS_SIGN |
      | 20 | U1 | MINUS_SIGN |
      | 21 | V1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      |  0 |  2 |
      |  1 |  0 |
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
      | 21 |  1 |

  #***********************************************
  Scenario: US07-86 Check expand & collapse node for a starting node when it have many incoming/ outgoing node (n level) on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-86"
    And I access table "TableA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | C1 | PLUS_SIGN  |
      | 2 | B1 | PLUS_SIGN  |
      | 0 | A1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | C1 |            |
      | 2 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
      | 2 | 1 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | C1 |            |
      | 2 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
      | 2 | 1 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |

  #*********************************************
  Scenario: US07-87 Check expand & collapse node for a starting node when it have many incoming/ outgoing node (n level) on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-86"
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
      | 2 | B1 | PLUS_SIGN  |
      | 1 | A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 2 | 0 |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1 | MINUS_SIGN |
      | 2 | B1 |            |
      | 1 | A1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 2 | 0 |
      | 1 | 2 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1 | PLUS_SIGN |

  #*********************************************
  Scenario: US07-88 Check expand & collapse node for a starting node when it have many incoming/ outgoing node (n level) on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-88"
    And I access table "TableA"
    And user views "Visualization>Display selected data" of record has ID is "A1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | C1 | PLUS_SIGN  |
      | 2 | B1 | PLUS_SIGN  |
      | 0 | A1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
      | 0 | 1 |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | C1 |            |
      | 2 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
      | 0 | 1 |
      | 2 | 1 |
    When user collapses on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | C1 | PLUS_SIGN  |
      | 2 | B1 | PLUS_SIGN  |
      | 0 | A1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
      | 0 | 1 |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | C1 | MINUS_SIGN |
      | 2 | B1 |            |
      | 0 | A1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
      | 0 | 1 |
      | 2 | 1 |

  #*******************************************
  Scenario: US07-89 Check expand & collapse node for a starting node when it have many incoming/ outgoing node (n level) on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-88"
    And I access table "TableA"
    And user views "Visualization>Display selected data" of record has ID is "A1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | C1 | PLUS_SIGN  |
      | 2 | B1 | PLUS_SIGN  |
      | 0 | A1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
      | 0 | 1 |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | C1 |            |
      | 2 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
      | 0 | 1 |
      | 2 | 1 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | C1 |            |
      | 2 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
      | 0 | 1 |
      | 2 | 1 |

  #*************************************
  Scenario: US07-90 Check expand & collapse node for a starting node when it have many incoming& outgoing node (n level) on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-90"
    And I access table "TableA"
    And user views "Visualization>Display selected data" of record has ID is "A1"
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
      | 1 | 0 |
      | 0 | 1 |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 2 | C1 |            |
      | 1 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
      | 3 | D1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
      | 0 | 1 |
      | 2 | 1 |
      | 1 | 3 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 2 | C1 |            |
      | 1 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
      | 3 | D1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
      | 0 | 1 |
      | 2 | 1 |
      | 1 | 3 |

  #**********************************************
  Scenario: US07-91 Check expand & collapse node for a starting node when it have many incoming& outgoing node (n level) on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-90"
    And I access table "TableA"
    And user views "Visualization>Display selected data" of record has ID is "A1"
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
      | 1 | 0 |
      | 0 | 1 |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 2 | C1 |            |
      | 1 | B1 | MINUS_SIGN |
      | 0 | A1 | MINUS_SIGN |
      | 3 | D1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
      | 0 | 1 |
      | 2 | 1 |
      | 1 | 3 |
    When user collapses on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | B1 | PLUS_SIGN  |
      | 0 | A1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 1 | 0 |
      | 0 | 1 |
    When user collapses on node "0"
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
      | 1 | 0 |
      | 0 | 1 |

  #*******************************************
  Scenario: US07-92 Check expand & collapse node for a starting node when it have many incoming& outgoing node (n level) on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-90"
    And I access table "TableB"
    And user views "Visualization>Display selected data" of record has ID is "A1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | MINUS_SIGN |
      | 1 | C1 |            |
      | 2 | A1 |            |
      | 3 | D1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
      | 0 | 3 |
      | 2 | 0 |
    When user expands on node "3"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | B1 | MINUS_SIGN |
      | 1 | C1 |            |
      | 2 | A1 |            |
      | 3 | D1 | MINUS_SIGN |
      | 4 | X1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 2 |
      | 1 | 0 |
      | 0 | 3 |
      | 2 | 0 |
      | 3 | 4 |

  #*******************************************
  Scenario: US07-93 Check expand & collapse node for a starting node when it have many incoming& outgoing node (n level) on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-90"
    And I access table "TableC"
    And user views "Visualization>Display selected data" of record has ID is "A1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1 | MINUS_SIGN |
      | 1 | B1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1 | MINUS_SIGN |
      | 1 | B1 | MINUS_SIGN |
      | 2 | A1 |            |
      | 3 | D1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 1 | 2 |
      | 1 | 3 |
      | 2 | 1 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1 | PLUS_SIGN |

  #*******************************************
  Scenario: US07-94 Check expand & collapse node for a starting node when it have many incoming& outgoing node (n level) on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-94"
    And I access table "TableA"
    And user views "Visualization>Display selected data" of record has ID is "A1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | C1 | PLUS_SIGN  |
      | 2 | B1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | C1 | PLUS_SIGN  |
      | 2 | B1 | MINUS_SIGN |
      | 3 | D1 |            |
      | 4 | E1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
      | 2 | 3 |
      | 2 | 4 |
      | 2 | 1 |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | C1 | MINUS_SIGN |
      | 2 | B1 | MINUS_SIGN |
      | 3 | D1 |            |
      | 4 | E1 |  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
      | 2 | 3 |
      | 2 | 4 |
      | 2 | 1 |
      | 1 | 4 |
    When user collapses on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | C1 | PLUS_SIGN  |
      | 2 | B1 | PLUS_SIGN  |
      | 4 | E1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
      | 1 | 4 |

  #**********************************************
  Scenario: US07-95 Check expand & collapse node for a starting node when it have many incoming& outgoing node (n level) on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-95"
    And I access table "TableA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | C1 | PLUS_SIGN  |
      | 2 | B1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | C1 | PLUS_SIGN  |
      | 2 | B1 | MINUS_SIGN |
      | 3 | D1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
      | 2 | 3 |
      | 2 | 1 |
    When user expands on node "3"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | C1 |            |
      | 2 | B1 | MINUS_SIGN |
      | 3 | D1 | MINUS_SIGN |
      | 4 | E1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
      | 2 | 3 |
      | 3 | 4 |
      | 2 | 1 |
      | 1 | 3 |
    When user collapses on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | C1 | PLUS_SIGN  |
      | 2 | B1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | C1 |            |
      | 2 | B1 | MINUS_SIGN |
      | 3 | D1 | MINUS_SIGN |
      | 4 | E1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
      | 2 | 3 |
      | 3 | 4 |
      | 2 | 1 |
      | 1 | 3 |

  #**********************************************
  Scenario: US07-96 Check expand & collapse node for a starting node when it have many incoming& outgoing node (n level) on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-95"
    And I access table "TableA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | C1 | PLUS_SIGN  |
      | 2 | B1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | C1 | PLUS_SIGN  |
      | 2 | B1 | MINUS_SIGN |
      | 3 | D1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
      | 2 | 3 |
      | 2 | 1 |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | C1 | MINUS_SIGN |
      | 2 | B1 | MINUS_SIGN |
      | 3 | D1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
      | 2 | 3 |
      | 2 | 1 |
      | 1 | 3 |
    When user expands on node "3"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | C1 | MINUS_SIGN |
      | 2 | B1 | MINUS_SIGN |
      | 3 | D1 | MINUS_SIGN |
      | 4 | E1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
      | 2 | 3 |
      | 3 | 4 |
      | 2 | 1 |
      | 1 | 3 |
    When user collapses on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | C1 | PLUS_SIGN  |
      | 2 | B1 | PLUS_SIGN  |
      | 3 | D1 | PLUS_SIGN  |
      | 4 | E1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
      | 1 | 3 |
      | 3 | 4 |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | C1 | MINUS_SIGN |
      | 2 | B1 | MINUS_SIGN |
      | 3 | D1 | MINUS_SIGN |
      | 4 | E1 |            |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
      | 2 | 3 |
      | 3 | 4 |
      | 2 | 1 |
      | 1 | 3 |

  #******************************************
  Scenario: US07-97 Check expand & collapse node for a starting node when it have many incoming& outgoing node (n level) on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-97"
    And I access table "TableA"
    And user views "Visualization>Display selected data" of record has ID is "A1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | F1 | PLUS_SIGN  |
      | 2 | C1 | PLUS_SIGN  |
      | 3 | B1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
      | 0 | 3 |
    When user expands on node "3"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | F1 | PLUS_SIGN  |
      | 2 | C1 | PLUS_SIGN  |
      | 3 | B1 | MINUS_SIGN |
      | 4 | D1 | PLUS_SIGN  |
      | 5 | E1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
      | 0 | 3 |
      | 2 | 3 |
      | 3 | 4 |
      | 3 | 1 |
      | 3 | 5 |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | F1 | PLUS_SIGN  |
      | 2 | C1 | MINUS_SIGN |
      | 3 | B1 | MINUS_SIGN |
      | 4 | D1 | PLUS_SIGN  |
      | 5 | E1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
      | 0 | 3 |
      | 2 | 3 |
      | 3 | 4 |
      | 3 | 1 |
      | 3 | 5 |
      | 2 | 1 |
    When user expands on node "4"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | F1 | PLUS_SIGN  |
      | 2 | C1 | MINUS_SIGN |
      | 3 | B1 | MINUS_SIGN |
      | 4 | D1 | MINUS_SIGN |
      | 5 | E1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
      | 0 | 3 |
      | 2 | 3 |
      | 3 | 4 |
      | 3 | 1 |
      | 3 | 5 |
      | 2 | 1 |
      | 1 | 4 |
      | 4 | 5 |
    When user expands on node "5"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | F1 |            |
      | 2 | C1 | MINUS_SIGN |
      | 3 | B1 | MINUS_SIGN |
      | 4 | D1 | MINUS_SIGN |
      | 5 | E1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
      | 0 | 3 |
      | 2 | 3 |
      | 3 | 4 |
      | 3 | 1 |
      | 3 | 5 |
      | 2 | 1 |
      | 1 | 4 |
      | 4 | 5 |
      | 1 | 5 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | F1 |            |
      | 2 | C1 | MINUS_SIGN |
      | 3 | B1 | MINUS_SIGN |
      | 4 | D1 | MINUS_SIGN |
      | 5 | E1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
      | 0 | 3 |
      | 2 | 3 |
      | 3 | 4 |
      | 3 | 1 |
      | 3 | 5 |
      | 2 | 1 |
      | 1 | 4 |
      | 4 | 5 |
      | 1 | 5 |
    When user collapses on node "4"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | F1 | PLUS_SIGN  |
      | 2 | C1 | MINUS_SIGN |
      | 3 | B1 | MINUS_SIGN |
      | 4 | D1 | PLUS_SIGN  |
      | 5 | E1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
      | 0 | 3 |
      | 2 | 3 |
      | 3 | 4 |
      | 3 | 1 |
      | 3 | 5 |
      | 2 | 1 |
      | 1 | 5 |

  #****************************************************
  Scenario: US07-98 Check expand & collapse node for a starting node when it have many incoming& outgoing node (n level) on another table by many FKs
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-98"
    And I access table "TableA"
    And user views "Visualization>Display selected data" of record has ID is "A1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | F1 | PLUS_SIGN  |
      | 2 | C1 | PLUS_SIGN  |
      | 3 | B1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
      | 0 | 3 |
      | 0 | 1 |
      | 0 | 2 |
      | 0 | 3 |
      | 0 | 3 |
    When user expands on node "3"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | F1 | PLUS_SIGN  |
      | 2 | C1 | PLUS_SIGN  |
      | 3 | B1 | MINUS_SIGN |
      | 4 | D1 | PLUS_SIGN  |
      | 5 | E1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
      | 0 | 3 |
      | 0 | 1 |
      | 0 | 2 |
      | 0 | 3 |
      | 0 | 3 |
      | 3 | 1 |
      | 2 | 3 |
      | 3 | 1 |
      | 2 | 3 |
      | 3 | 5 |
      | 3 | 4 |
      | 3 | 5 |
      | 3 | 4 |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | F1 | PLUS_SIGN  |
      | 2 | C1 | MINUS_SIGN |
      | 3 | B1 | MINUS_SIGN |
      | 4 | D1 | PLUS_SIGN  |
      | 5 | E1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
      | 0 | 3 |
      | 0 | 1 |
      | 0 | 2 |
      | 0 | 3 |
      | 0 | 3 |
      | 3 | 1 |
      | 2 | 3 |
      | 3 | 1 |
      | 2 | 3 |
      | 3 | 5 |
      | 3 | 4 |
      | 3 | 5 |
      | 3 | 4 |
      | 2 | 1 |
      | 2 | 1 |
    When user expands on node "4"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | F1 | PLUS_SIGN  |
      | 2 | C1 | MINUS_SIGN |
      | 3 | B1 | MINUS_SIGN |
      | 4 | D1 | MINUS_SIGN |
      | 5 | E1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
      | 0 | 3 |
      | 0 | 1 |
      | 0 | 2 |
      | 0 | 3 |
      | 0 | 3 |
      | 3 | 1 |
      | 2 | 3 |
      | 3 | 1 |
      | 2 | 3 |
      | 3 | 5 |
      | 3 | 4 |
      | 3 | 5 |
      | 3 | 4 |
      | 2 | 1 |
      | 2 | 1 |
      | 4 | 5 |
      | 1 | 4 |
      | 1 | 4 |
      | 4 | 5 |
    When user expands on node "5"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | F1 |            |
      | 2 | C1 | MINUS_SIGN |
      | 3 | B1 | MINUS_SIGN |
      | 4 | D1 | MINUS_SIGN |
      | 5 | E1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
      | 0 | 3 |
      | 0 | 1 |
      | 0 | 2 |
      | 0 | 3 |
      | 0 | 3 |
      | 3 | 1 |
      | 2 | 3 |
      | 3 | 1 |
      | 2 | 3 |
      | 3 | 5 |
      | 3 | 4 |
      | 3 | 5 |
      | 3 | 4 |
      | 2 | 1 |
      | 2 | 1 |
      | 4 | 5 |
      | 1 | 4 |
      | 1 | 4 |
      | 4 | 5 |
      | 1 | 5 |
      | 1 | 5 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | F1 |            |
      | 2 | C1 | MINUS_SIGN |
      | 3 | B1 | MINUS_SIGN |
      | 4 | D1 | MINUS_SIGN |
      | 5 | E1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
      | 0 | 3 |
      | 0 | 1 |
      | 0 | 2 |
      | 0 | 3 |
      | 0 | 3 |
      | 3 | 1 |
      | 2 | 3 |
      | 3 | 1 |
      | 2 | 3 |
      | 3 | 5 |
      | 3 | 4 |
      | 3 | 5 |
      | 3 | 4 |
      | 2 | 1 |
      | 2 | 1 |
      | 4 | 5 |
      | 1 | 4 |
      | 1 | 4 |
      | 4 | 5 |
      | 1 | 5 |
      | 1 | 5 |
    When user collapses on node "4"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | F1 | PLUS_SIGN  |
      | 2 | C1 | MINUS_SIGN |
      | 3 | B1 | MINUS_SIGN |
      | 4 | D1 | PLUS_SIGN  |
      | 5 | E1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 2 |
      | 0 | 3 |
      | 0 | 1 |
      | 0 | 2 |
      | 0 | 3 |
      | 0 | 3 |
      | 3 | 1 |
      | 2 | 3 |
      | 3 | 1 |
      | 2 | 3 |
      | 3 | 5 |
      | 3 | 4 |
      | 3 | 5 |
      | 3 | 4 |
      | 2 | 1 |
      | 2 | 1 |
      | 1 | 5 |
      | 1 | 5 |

  #************************************************
  Scenario: US07-99 Check expand & collapse node for a starting node when it have many incoming& outgoing node (n level) on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-99"
    And I access table "TableA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | C1 | PLUS_SIGN  |
      | 2 | B1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 0 |
      | 1 | 0 |
      | 2 | 0 |
      | 0 | 2 |
    When user expands on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | C1 | PLUS_SIGN  |
      | 2 | B1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 0 |
      | 1 | 0 |
      | 2 | 0 |
      | 0 | 2 |
      | 2 | 2 |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | C1 | MINUS_SIGN |
      | 2 | B1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 0 |
      | 1 | 0 |
      | 2 | 0 |
      | 0 | 2 |
      | 2 | 2 |
      | 1 | 1 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | C1 | MINUS_SIGN |
      | 2 | B1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 0 |
      | 1 | 0 |
      | 2 | 0 |
      | 0 | 2 |
      | 2 | 2 |
      | 1 | 1 |
    When user collapses on node "2"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | C1 | MINUS_SIGN |
      | 2 | B1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 0 |
      | 1 | 0 |
      | 2 | 0 |
      | 0 | 2 |
      | 1 | 1 |

  #********************************************
  Scenario: US07-100 Check expand & collapse node for a starting node when it have many incoming& outgoing node (n level) on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-99"
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
      | 0 | 0 |
      | 1 | 0 |
    When user expands on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1 | MINUS_SIGN |
      | 1 | A1 | MINUS_SIGN |
      | 2 | B1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 0 |
      | 1 | 0 |
      | 1 | 1 |
      | 2 | 1 |
      | 1 | 2 |
    When user collapses on node "1"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 1 | A1 | PLUS_SIGN  |
      | 0 | C1 | MINUS_SIGN |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 1 |
      | 0 | 0 |
      | 1 | 0 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | C1 | PLUS_SIGN |

  #*****************************************
  Scenario: US07-169 Check expand & collapse node for a starting node when it have many incoming& outgoing node (n level) on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-169"
    And I access table "TableA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | A2 | PLUS_SIGN  |
      | 2 | C1 |            |
      | 3 | B1 |            |
      | 4 | T2 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 4 |
      | 0 | 0 |
      | 1 | 0 |
      | 2 | 0 |
      | 3 | 0 |
    When user expands on node "4"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 1 | A2 | PLUS_SIGN  |
      | 2 | C1 |            |
      | 3 | B1 |            |
      | 4 | T2 | MINUS_SIGN |
      | 5 | A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 4 |
      | 0 | 0 |
      | 1 | 0 |
      | 2 | 0 |
      | 3 | 0 |
      | 5 | 4 |

  #************************************************
  Scenario: US07-170 Check expand & collapse node for a starting node when it have many incoming& outgoing node (n level) on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-169>V120_US07-169-child"
    And I access table "TableA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | PLUS_SIGN |
    When user expands on node "0"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 4 | A2 | PLUS_SIGN  |
      | 2 | C1 |            |
      | 1 | B1 |            |
      | 3 | T2 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 3 |
      | 0 | 0 |
      | 4 | 0 |
      | 1 | 0 |
      | 2 | 0 |
    When user expands on node "3"
    Then the graph should contains following nodes
      #| Key | Label | Button Icon |
      | 0 | A1 | MINUS_SIGN |
      | 4 | A2 | PLUS_SIGN  |
      | 2 | C1 |            |
      | 1 | B1 |            |
      | 3 | T2 | MINUS_SIGN |
      | 5 | A1 | PLUS_SIGN  |
    Then the graph should contains following links
      #| Start Node | End Node |
      | 0 | 3 |
      | 0 | 0 |
      | 4 | 0 |
      | 1 | 0 |
      | 2 | 0 |
      | 5 | 3 |
