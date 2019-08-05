#Author: tbui@tibco.com
@DMDV100-GraphData..
Feature: Test graph data with configuration

  Background: 
    Given I login to EBX succesfully

  Scenario: Data_116 - Check displayed correctly relationship of nodes (that have many incoming/outgoing nodes-more than 20 level on another table) when was started by it then Expand all levels
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-81"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "Data_116"
    Then the graph should be displayed
    #5. Expand recursively target of A1
    When user expands target recursively on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
      | D1 | RIGHT |  |
      | E1 | RIGHT |  |
      | F1 | RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 3 |  |
      | 5 | 1 |  |
      | 4 | 5 |  |
      | 3 | 4 |  |
      | 1 | 2 |  |
    #6. Expand recursively target of F1
    When user expands target recursively on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
      | D1 | RIGHT |  |
      | E1 | RIGHT |  |
      | F1 | RIGHT |  |
      | G1 | RIGHT |  |
      | H1 | RIGHT |  |
      | I1 | RIGHT |  |
      | J1 | RIGHT |  |
      | K1 | RIGHT |  |
    Then the label of link label should be display as following
      |  0 |  3 |  |
      |  5 |  1 |  |
      |  4 |  5 |  |
      |  3 |  4 |  |
      |  1 |  2 |  |
      |  9 | 10 |  |
      |  2 |  7 |  |
      |  8 |  6 |  |
      | 10 |  8 |  |
      |  7 |  9 |  |
    #7. Expand recursively target of 10th level
    When user expands target recursively on node "6"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
      | D1 | RIGHT |  |
      | E1 | RIGHT |  |
      | F1 | RIGHT |  |
      | G1 | RIGHT |  |
      | H1 | RIGHT |  |
      | I1 | RIGHT |  |
      | J1 | RIGHT |  |
      | K1 | RIGHT |  |
      | L1 | RIGHT |  |
      | M1 | RIGHT |  |
      | N1 | RIGHT |  |
      | O1 | RIGHT |  |
      | P1 | RIGHT |  |
    Then the label of link label should be display as following
      |  0 |  3 |  |
      |  5 |  1 |  |
      |  4 |  5 |  |
      |  3 |  4 |  |
      |  1 |  2 |  |
      |  9 | 10 |  |
      |  2 |  7 |  |
      |  8 |  6 |  |
      | 10 |  8 |  |
      |  7 |  9 |  |
      | 11 | 14 |  |
      |  6 | 11 |  |
      | 12 | 13 |  |
      | 14 | 15 |  |
      | 15 | 12 |  |
    #8. Expand recursively target of 15th level
    When user expands target recursively on node "13"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
      | D1 | RIGHT |  |
      | E1 | RIGHT |  |
      | F1 | RIGHT |  |
      | G1 | RIGHT |  |
      | H1 | RIGHT |  |
      | I1 | RIGHT |  |
      | J1 | RIGHT |  |
      | K1 | RIGHT |  |
      | L1 | RIGHT |  |
      | M1 | RIGHT |  |
      | N1 | RIGHT |  |
      | O1 | RIGHT |  |
      | P1 | RIGHT |  |
      | Q1 | RIGHT |  |
      | T1 | RIGHT |  |
      | R1 | RIGHT |  |
      | U1 | RIGHT |  |
      | V1 | RIGHT |  |
    Then the label of link label should be display as following
      |  0 |  3 |  |
      |  5 |  1 |  |
      |  4 |  5 |  |
      |  3 |  4 |  |
      |  1 |  2 |  |
      |  9 | 10 |  |
      |  2 |  7 |  |
      |  8 |  6 |  |
      | 10 |  8 |  |
      |  7 |  9 |  |
      | 11 | 14 |  |
      |  6 | 11 |  |
      | 12 | 13 |  |
      | 14 | 15 |  |
      | 15 | 12 |  |
      | 16 | 17 |  |
      | 13 | 19 |  |
      | 19 | 20 |  |
      | 20 | 18 |  |
      | 18 | 16 |  |
    #9. Expand recursively target of 20th level
    When user expands target recursively on node "17"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
      | D1 | RIGHT |  |
      | E1 | RIGHT |  |
      | F1 | RIGHT |  |
      | G1 | RIGHT |  |
      | H1 | RIGHT |  |
      | I1 | RIGHT |  |
      | J1 | RIGHT |  |
      | K1 | RIGHT |  |
      | L1 | RIGHT |  |
      | M1 | RIGHT |  |
      | N1 | RIGHT |  |
      | O1 | RIGHT |  |
      | P1 | RIGHT |  |
      | Q1 | RIGHT |  |
      | T1 | RIGHT |  |
      | R1 | RIGHT |  |
      | U1 | RIGHT |  |
      | V1 | RIGHT |  |
      | X1 |       |  |
    Then the label of link label should be display as following
      |  0 |  3 |  |
      |  5 |  1 |  |
      |  4 |  5 |  |
      |  3 |  4 |  |
      |  1 |  2 |  |
      |  9 | 10 |  |
      |  2 |  7 |  |
      |  8 |  6 |  |
      | 10 |  8 |  |
      |  7 |  9 |  |
      | 11 | 14 |  |
      |  6 | 11 |  |
      | 12 | 13 |  |
      | 14 | 15 |  |
      | 15 | 12 |  |
      | 16 | 17 |  |
      | 13 | 19 |  |
      | 19 | 20 |  |
      | 20 | 18 |  |
      | 18 | 16 |  |
      | 17 | 21 |  |
    #10. Collapse target of 19th level
    When user collapse target on node "17"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
      | D1 | RIGHT |  |
      | E1 | RIGHT |  |
      | F1 | RIGHT |  |
      | G1 | RIGHT |  |
      | H1 | RIGHT |  |
      | I1 | RIGHT |  |
      | J1 | RIGHT |  |
      | K1 | RIGHT |  |
      | L1 | RIGHT |  |
      | M1 | RIGHT |  |
      | N1 | RIGHT |  |
      | O1 | RIGHT |  |
      | P1 | RIGHT |  |
      | Q1 | RIGHT |  |
      | T1 | RIGHT |  |
      | R1 | RIGHT |  |
      | U1 | RIGHT |  |
      | V1 | RIGHT |  |
    Then the label of link label should be display as following
      |  0 |  3 |  |
      |  5 |  1 |  |
      |  4 |  5 |  |
      |  3 |  4 |  |
      |  1 |  2 |  |
      |  9 | 10 |  |
      |  2 |  7 |  |
      |  8 |  6 |  |
      | 10 |  8 |  |
      |  7 |  9 |  |
      | 11 | 14 |  |
      |  6 | 11 |  |
      | 12 | 13 |  |
      | 14 | 15 |  |
      | 15 | 12 |  |
      | 16 | 17 |  |
      | 13 | 19 |  |
      | 19 | 20 |  |
      | 20 | 18 |  |
      | 18 | 16 |  |
    #11. Expand recursively of 19th level
    When user expands target recursively on node "17"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
      | D1 | RIGHT |  |
      | E1 | RIGHT |  |
      | F1 | RIGHT |  |
      | G1 | RIGHT |  |
      | H1 | RIGHT |  |
      | I1 | RIGHT |  |
      | J1 | RIGHT |  |
      | K1 | RIGHT |  |
      | L1 | RIGHT |  |
      | M1 | RIGHT |  |
      | N1 | RIGHT |  |
      | O1 | RIGHT |  |
      | P1 | RIGHT |  |
      | Q1 | RIGHT |  |
      | T1 | RIGHT |  |
      | R1 | RIGHT |  |
      | U1 | RIGHT |  |
      | V1 | RIGHT |  |
      | X1 |       |  |
    Then the label of link label should be display as following
      |  0 |  3 |  |
      |  5 |  1 |  |
      |  4 |  5 |  |
      |  3 |  4 |  |
      |  1 |  2 |  |
      |  9 | 10 |  |
      |  2 |  7 |  |
      |  8 |  6 |  |
      | 10 |  8 |  |
      |  7 |  9 |  |
      | 11 | 14 |  |
      |  6 | 11 |  |
      | 12 | 13 |  |
      | 14 | 15 |  |
      | 15 | 12 |  |
      | 16 | 17 |  |
      | 13 | 19 |  |
      | 19 | 20 |  |
      | 20 | 18 |  |
      | 18 | 16 |  |
      | 17 | 21 |  |
      
Scenario: Data_117 - Check displayed correctly relationship of nodes (that have many incoming/outgoing nodes-more than 20 level on another table) when was started by node at last level then Expand all levels and Collapse by start node.
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-81"
    And I access table "TableX"
    And user views "Visualization>Display data using configuration" of record has ID is "X1"
    And user generates graph with configuration "Data_116"
    Then the graph should be displayed
    #5. Expand recursively source of X
    When user expands source recursively on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | Q1 | LEFT |  |
      | T1 | LEFT |  |
      | R1 | LEFT |  |
      | U1 | LEFT |  |
      | V1 | LEFT |  |
      | X1 | LEFT |  |
    Then the label of link label should be display as following
      | 4 | 5 |  |
      | 3 | 2 |  |
      | 2 | 1 |  |
      | 5 | 0 |  |
      | 1 | 4 |  |
    #6. Expand recursively source of Q1
    When user expands source recursively on node "3"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | Q1 | LEFT |  |
      | T1 | LEFT |  |
      | R1 | LEFT |  |
      | U1 | LEFT |  |
      | V1 | LEFT |  |
      | X1 | LEFT |  |
      | L1 | LEFT |  |
      | M1 | LEFT |  |
      | N1 | LEFT |  |
      | O1 | LEFT |  |
      | P1 | LEFT |  |
    Then the label of link label should be display as following
      |  4 |  5 |  |
      |  3 |  2 |  |
      |  2 |  1 |  |
      |  5 |  0 |  |
      |  1 |  4 |  |
      |  6 |  9 |  |
      |  8 |  3 |  |
      |  7 |  8 |  |
      |  9 | 10 |  |
      | 10 |  7 |  |
    #7. Expand recursively source of 10th level (TableL)
    When user expands source recursively on node "6"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | Q1 | LEFT |  |
      | T1 | LEFT |  |
      | R1 | LEFT |  |
      | U1 | LEFT |  |
      | V1 | LEFT |  |
      | X1 | LEFT |  |
      | L1 | LEFT |  |
      | M1 | LEFT |  |
      | N1 | LEFT |  |
      | O1 | LEFT |  |
      | P1 | LEFT |  |
      | G1 | LEFT |  |
      | H1 | LEFT |  |
      | I1 | LEFT |  |
      | J1 | LEFT |  |
      | K1 | LEFT |  |
    Then the label of link label should be display as following
      |  4 |  5 |  |
      |  3 |  2 |  |
      |  2 |  1 |  |
      |  5 |  0 |  |
      |  1 |  4 |  |
      |  6 |  9 |  |
      |  8 |  3 |  |
      |  7 |  8 |  |
      |  9 | 10 |  |
      | 10 |  7 |  |
      | 15 | 13 |  |
      | 12 | 11 |  |
      | 13 | 12 |  |
      | 11 |  6 |  |
      | 14 | 15 |  |
    #8. Expand recursively source of 15th level (TableG)
    When user expands source recursively on node "14"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | Q1 | LEFT |  |
      | T1 | LEFT |  |
      | R1 | LEFT |  |
      | U1 | LEFT |  |
      | V1 | LEFT |  |
      | X1 | LEFT |  |
      | L1 | LEFT |  |
      | M1 | LEFT |  |
      | N1 | LEFT |  |
      | O1 | LEFT |  |
      | P1 | LEFT |  |
      | G1 | LEFT |  |
      | H1 | LEFT |  |
      | I1 | LEFT |  |
      | J1 | LEFT |  |
      | K1 | LEFT |  |
      | B1 | LEFT |  |
      | C1 | LEFT |  |
      | D1 | LEFT |  |
      | E1 | LEFT |  |
      | F1 | LEFT |  |
    Then the label of link label should be display as following
      |  4 |  5 |  |
      |  3 |  2 |  |
      |  2 |  1 |  |
      |  5 |  0 |  |
      |  1 |  4 |  |
      |  6 |  9 |  |
      |  8 |  3 |  |
      |  7 |  8 |  |
      |  9 | 10 |  |
      | 10 |  7 |  |
      | 15 | 13 |  |
      | 12 | 11 |  |
      | 13 | 12 |  |
      | 11 |  6 |  |
      | 14 | 15 |  |
      | 20 | 14 |  |
      | 18 | 19 |  |
      | 17 | 18 |  |
      | 16 | 17 |  |
      | 19 | 20 |  |
    #9. Expand recursively source of 20th level (TableB)
    When user expands source recursively on node "16"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | Q1 | LEFT |  |
      | T1 | LEFT |  |
      | R1 | LEFT |  |
      | U1 | LEFT |  |
      | V1 | LEFT |  |
      | X1 | LEFT |  |
      | L1 | LEFT |  |
      | M1 | LEFT |  |
      | N1 | LEFT |  |
      | O1 | LEFT |  |
      | P1 | LEFT |  |
      | G1 | LEFT |  |
      | H1 | LEFT |  |
      | I1 | LEFT |  |
      | J1 | LEFT |  |
      | K1 | LEFT |  |
      | B1 | LEFT |  |
      | C1 | LEFT |  |
      | D1 | LEFT |  |
      | E1 | LEFT |  |
      | F1 | LEFT |  |
      | A1 |      |  |
    Then the label of link label should be display as following
      |  4 |  5 |  |
      |  3 |  2 |  |
      |  2 |  1 |  |
      |  5 |  0 |  |
      |  1 |  4 |  |
      |  6 |  9 |  |
      |  8 |  3 |  |
      |  7 |  8 |  |
      |  9 | 10 |  |
      | 10 |  7 |  |
      | 15 | 13 |  |
      | 12 | 11 |  |
      | 13 | 12 |  |
      | 11 |  6 |  |
      | 14 | 15 |  |
      | 20 | 14 |  |
      | 18 | 19 |  |
      | 17 | 18 |  |
      | 16 | 17 |  |
      | 19 | 20 |  |
      | 21 | 16 |  |
    #10. Collapse source of X
    When user collapse source on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | X1 | LEFT |  |
    Then there is no link displayed
    #11. Expand source of X
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | V1 | LEFT |  |
      | X1 | LEFT |  |
    Then the label of link label should be display as following
      | 5 | 0 |  |

Scenario: Data_118 - Check displayed correctly relationship of nodes (that has a recursive nodes-n level on another table) when was started by it then Expand all levels
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-85"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "Data_118"
    Then the graph should be displayed
    #5. Expand target of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
    #6. Expand target of B1
    When user expands target on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
    #7. Expand target of C1
    When user expands target on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | D1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 3 |  |
    #7.Expand target of D1
    When user expands target on node "3"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | D1 | RIGHT      |  |
      | E1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 3 |  |
      | 3 | 4 |  |
    When user expands target on node "4"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | D1 | RIGHT      |  |
      | E1 | RIGHT      |  |
      | F1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 3 |  |
      | 3 | 4 |  |
      | 4 | 5 |  |
    When user expands target on node "5"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | D1 | RIGHT      |  |
      | E1 | RIGHT      |  |
      | F1 | RIGHT      |  |
      | G1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 3 |  |
      | 3 | 4 |  |
      | 4 | 5 |  |
      | 5 | 6 |  |
    When user expands target on node "6"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | D1 | RIGHT      |  |
      | E1 | RIGHT      |  |
      | F1 | RIGHT      |  |
      | G1 | RIGHT      |  |
      | H1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 3 |  |
      | 3 | 4 |  |
      | 4 | 5 |  |
      | 5 | 6 |  |
      | 6 | 7 |  |
    When user expands target on node "7"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | D1 | RIGHT      |  |
      | E1 | RIGHT      |  |
      | F1 | RIGHT      |  |
      | G1 | RIGHT      |  |
      | H1 | RIGHT      |  |
      | I1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 3 |  |
      | 3 | 4 |  |
      | 4 | 5 |  |
      | 5 | 6 |  |
      | 6 | 7 |  |
      | 7 | 8 |  |
    When user expands target on node "8"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | D1 | RIGHT      |  |
      | E1 | RIGHT      |  |
      | F1 | RIGHT      |  |
      | G1 | RIGHT      |  |
      | H1 | RIGHT      |  |
      | I1 | RIGHT      |  |
      | J1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 3 |  |
      | 3 | 4 |  |
      | 4 | 5 |  |
      | 5 | 6 |  |
      | 6 | 7 |  |
      | 7 | 8 |  |
      | 8 | 9 |  |
    When user expands target on node "9"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | D1 | RIGHT      |  |
      | E1 | RIGHT      |  |
      | F1 | RIGHT      |  |
      | G1 | RIGHT      |  |
      | H1 | RIGHT      |  |
      | I1 | RIGHT      |  |
      | J1 | RIGHT      |  |
      | K1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 |  1 |  |
      | 1 |  2 |  |
      | 2 |  3 |  |
      | 3 |  4 |  |
      | 4 |  5 |  |
      | 5 |  6 |  |
      | 6 |  7 |  |
      | 7 |  8 |  |
      | 8 |  9 |  |
      | 9 | 10 |  |
    When user expands target on node "10"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | D1 | RIGHT      |  |
      | E1 | RIGHT      |  |
      | F1 | RIGHT      |  |
      | G1 | RIGHT      |  |
      | H1 | RIGHT      |  |
      | I1 | RIGHT      |  |
      | J1 | RIGHT      |  |
      | K1 | RIGHT      |  |
      | L1 | RIGHT      |  |
    Then the label of link label should be display as following
      |  0 |  1 |  |
      |  1 |  2 |  |
      |  2 |  3 |  |
      |  3 |  4 |  |
      |  4 |  5 |  |
      |  5 |  6 |  |
      |  6 |  7 |  |
      |  7 |  8 |  |
      |  8 |  9 |  |
      |  9 | 10 |  |
      | 10 | 11 |  |
    When user expands target on node "11"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | D1 | RIGHT      |  |
      | E1 | RIGHT      |  |
      | F1 | RIGHT      |  |
      | G1 | RIGHT      |  |
      | H1 | RIGHT      |  |
      | I1 | RIGHT      |  |
      | J1 | RIGHT      |  |
      | K1 | RIGHT      |  |
      | L1 | RIGHT      |  |
      | M1 | RIGHT      |  |
    Then the label of link label should be display as following
      |  0 |  1 |  |
      |  1 |  2 |  |
      |  2 |  3 |  |
      |  3 |  4 |  |
      |  4 |  5 |  |
      |  5 |  6 |  |
      |  6 |  7 |  |
      |  7 |  8 |  |
      |  8 |  9 |  |
      |  9 | 10 |  |
      | 10 | 11 |  |
      | 11 | 12 |  |
    When user expands target on node "12"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | D1 | RIGHT      |  |
      | E1 | RIGHT      |  |
      | F1 | RIGHT      |  |
      | G1 | RIGHT      |  |
      | H1 | RIGHT      |  |
      | I1 | RIGHT      |  |
      | J1 | RIGHT      |  |
      | K1 | RIGHT      |  |
      | L1 | RIGHT      |  |
      | M1 | RIGHT      |  |
      | N1 | RIGHT      |  |
    Then the label of link label should be display as following
      |  0 |  1 |  |
      |  1 |  2 |  |
      |  2 |  3 |  |
      |  3 |  4 |  |
      |  4 |  5 |  |
      |  5 |  6 |  |
      |  6 |  7 |  |
      |  7 |  8 |  |
      |  8 |  9 |  |
      |  9 | 10 |  |
      | 10 | 11 |  |
      | 11 | 12 |  |
      | 12 | 13 |  |
    When user expands target on node "13"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | D1 | RIGHT      |  |
      | E1 | RIGHT      |  |
      | F1 | RIGHT      |  |
      | G1 | RIGHT      |  |
      | H1 | RIGHT      |  |
      | I1 | RIGHT      |  |
      | J1 | RIGHT      |  |
      | K1 | RIGHT      |  |
      | L1 | RIGHT      |  |
      | M1 | RIGHT      |  |
      | N1 | RIGHT      |  |
      | O1 | RIGHT      |  |
    Then the label of link label should be display as following
      |  0 |  1 |  |
      |  1 |  2 |  |
      |  2 |  3 |  |
      |  3 |  4 |  |
      |  4 |  5 |  |
      |  5 |  6 |  |
      |  6 |  7 |  |
      |  7 |  8 |  |
      |  8 |  9 |  |
      |  9 | 10 |  |
      | 10 | 11 |  |
      | 11 | 12 |  |
      | 12 | 13 |  |
      | 13 | 14 |  |
    When user expands target on node "14"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | D1 | RIGHT      |  |
      | E1 | RIGHT      |  |
      | F1 | RIGHT      |  |
      | G1 | RIGHT      |  |
      | H1 | RIGHT      |  |
      | I1 | RIGHT      |  |
      | J1 | RIGHT      |  |
      | K1 | RIGHT      |  |
      | L1 | RIGHT      |  |
      | M1 | RIGHT      |  |
      | N1 | RIGHT      |  |
      | O1 | RIGHT      |  |
      | P1 | RIGHT      |  |
    Then the label of link label should be display as following
      |  0 |  1 |  |
      |  1 |  2 |  |
      |  2 |  3 |  |
      |  3 |  4 |  |
      |  4 |  5 |  |
      |  5 |  6 |  |
      |  6 |  7 |  |
      |  7 |  8 |  |
      |  8 |  9 |  |
      |  9 | 10 |  |
      | 10 | 11 |  |
      | 11 | 12 |  |
      | 12 | 13 |  |
      | 13 | 14 |  |
      | 14 | 15 |  |
    When user expands target on node "15"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | D1 | RIGHT      |  |
      | E1 | RIGHT      |  |
      | F1 | RIGHT      |  |
      | G1 | RIGHT      |  |
      | H1 | RIGHT      |  |
      | I1 | RIGHT      |  |
      | J1 | RIGHT      |  |
      | K1 | RIGHT      |  |
      | L1 | RIGHT      |  |
      | M1 | RIGHT      |  |
      | N1 | RIGHT      |  |
      | O1 | RIGHT      |  |
      | P1 | RIGHT      |  |
      | Q1 | RIGHT      |  |
    Then the label of link label should be display as following
      |  0 |  1 |  |
      |  1 |  2 |  |
      |  2 |  3 |  |
      |  3 |  4 |  |
      |  4 |  5 |  |
      |  5 |  6 |  |
      |  6 |  7 |  |
      |  7 |  8 |  |
      |  8 |  9 |  |
      |  9 | 10 |  |
      | 10 | 11 |  |
      | 11 | 12 |  |
      | 12 | 13 |  |
      | 13 | 14 |  |
      | 14 | 15 |  |
      | 15 | 16 |  |
    When user expands target on node "16"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | D1 | RIGHT      |  |
      | E1 | RIGHT      |  |
      | F1 | RIGHT      |  |
      | G1 | RIGHT      |  |
      | H1 | RIGHT      |  |
      | I1 | RIGHT      |  |
      | J1 | RIGHT      |  |
      | K1 | RIGHT      |  |
      | L1 | RIGHT      |  |
      | M1 | RIGHT      |  |
      | N1 | RIGHT      |  |
      | O1 | RIGHT      |  |
      | P1 | RIGHT      |  |
      | Q1 | RIGHT      |  |
      | T1 | RIGHT      |  |
    Then the label of link label should be display as following
      |  0 |  1 |  |
      |  1 |  2 |  |
      |  2 |  3 |  |
      |  3 |  4 |  |
      |  4 |  5 |  |
      |  5 |  6 |  |
      |  6 |  7 |  |
      |  7 |  8 |  |
      |  8 |  9 |  |
      |  9 | 10 |  |
      | 10 | 11 |  |
      | 11 | 12 |  |
      | 12 | 13 |  |
      | 13 | 14 |  |
      | 14 | 15 |  |
      | 15 | 16 |  |
      | 16 | 17 |  |
    When user expands target on node "17"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | D1 | RIGHT      |  |
      | E1 | RIGHT      |  |
      | F1 | RIGHT      |  |
      | G1 | RIGHT      |  |
      | H1 | RIGHT      |  |
      | I1 | RIGHT      |  |
      | J1 | RIGHT      |  |
      | K1 | RIGHT      |  |
      | L1 | RIGHT      |  |
      | M1 | RIGHT      |  |
      | N1 | RIGHT      |  |
      | O1 | RIGHT      |  |
      | P1 | RIGHT      |  |
      | Q1 | RIGHT      |  |
      | T1 | RIGHT      |  |
      | R1 | RIGHT      |  |
    Then the label of link label should be display as following
      |  0 |  1 |  |
      |  1 |  2 |  |
      |  2 |  3 |  |
      |  3 |  4 |  |
      |  4 |  5 |  |
      |  5 |  6 |  |
      |  6 |  7 |  |
      |  7 |  8 |  |
      |  8 |  9 |  |
      |  9 | 10 |  |
      | 10 | 11 |  |
      | 11 | 12 |  |
      | 12 | 13 |  |
      | 13 | 14 |  |
      | 14 | 15 |  |
      | 15 | 16 |  |
      | 16 | 17 |  |
      | 17 | 18 |  |
    When user expands target on node "18"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | D1 | RIGHT      |  |
      | E1 | RIGHT      |  |
      | F1 | RIGHT      |  |
      | G1 | RIGHT      |  |
      | H1 | RIGHT      |  |
      | I1 | RIGHT      |  |
      | J1 | RIGHT      |  |
      | K1 | RIGHT      |  |
      | L1 | RIGHT      |  |
      | M1 | RIGHT      |  |
      | N1 | RIGHT      |  |
      | O1 | RIGHT      |  |
      | P1 | RIGHT      |  |
      | Q1 | RIGHT      |  |
      | T1 | RIGHT      |  |
      | R1 | RIGHT      |  |
      | U1 | RIGHT      |  |
    Then the label of link label should be display as following
      |  0 |  1 |  |
      |  1 |  2 |  |
      |  2 |  3 |  |
      |  3 |  4 |  |
      |  4 |  5 |  |
      |  5 |  6 |  |
      |  6 |  7 |  |
      |  7 |  8 |  |
      |  8 |  9 |  |
      |  9 | 10 |  |
      | 10 | 11 |  |
      | 11 | 12 |  |
      | 12 | 13 |  |
      | 13 | 14 |  |
      | 14 | 15 |  |
      | 15 | 16 |  |
      | 16 | 17 |  |
      | 17 | 18 |  |
      | 18 | 19 |  |
    When user expands target on node "19"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | D1 | RIGHT      |  |
      | E1 | RIGHT      |  |
      | F1 | RIGHT      |  |
      | G1 | RIGHT      |  |
      | H1 | RIGHT      |  |
      | I1 | RIGHT      |  |
      | J1 | RIGHT      |  |
      | K1 | RIGHT      |  |
      | L1 | RIGHT      |  |
      | M1 | RIGHT      |  |
      | N1 | RIGHT      |  |
      | O1 | RIGHT      |  |
      | P1 | RIGHT      |  |
      | Q1 | RIGHT      |  |
      | T1 | RIGHT      |  |
      | R1 | RIGHT      |  |
      | U1 | RIGHT      |  |
      | V1 | RIGHT      |  |
    Then the label of link label should be display as following
      |  0 |  1 |  |
      |  1 |  2 |  |
      |  2 |  3 |  |
      |  3 |  4 |  |
      |  4 |  5 |  |
      |  5 |  6 |  |
      |  6 |  7 |  |
      |  7 |  8 |  |
      |  8 |  9 |  |
      |  9 | 10 |  |
      | 10 | 11 |  |
      | 11 | 12 |  |
      | 12 | 13 |  |
      | 13 | 14 |  |
      | 14 | 15 |  |
      | 15 | 16 |  |
      | 16 | 17 |  |
      | 17 | 18 |  |
      | 18 | 19 |  |
      | 19 | 20 |  |
    When user expands target on node "20"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | D1 | RIGHT      |  |
      | E1 | RIGHT      |  |
      | F1 | RIGHT      |  |
      | G1 | RIGHT      |  |
      | H1 | RIGHT      |  |
      | I1 | RIGHT      |  |
      | J1 | RIGHT      |  |
      | K1 | RIGHT      |  |
      | L1 | RIGHT      |  |
      | M1 | RIGHT      |  |
      | N1 | RIGHT      |  |
      | O1 | RIGHT      |  |
      | P1 | RIGHT      |  |
      | Q1 | RIGHT      |  |
      | T1 | RIGHT      |  |
      | R1 | RIGHT      |  |
      | U1 | RIGHT      |  |
      | V1 | RIGHT      |  |
      | X1 | RIGHT      |  |
    Then the label of link label should be display as following
      |  0 |  1 |  |
      |  1 |  2 |  |
      |  2 |  3 |  |
      |  3 |  4 |  |
      |  4 |  5 |  |
      |  5 |  6 |  |
      |  6 |  7 |  |
      |  7 |  8 |  |
      |  8 |  9 |  |
      |  9 | 10 |  |
      | 10 | 11 |  |
      | 11 | 12 |  |
      | 12 | 13 |  |
      | 13 | 14 |  |
      | 14 | 15 |  |
      | 15 | 16 |  |
      | 16 | 17 |  |
      | 17 | 18 |  |
      | 18 | 19 |  |
      | 19 | 20 |  |
      | 20 | 21 |  |
    #9. Expand source of A1
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | D1 | RIGHT      |  |
      | E1 | RIGHT      |  |
      | F1 | RIGHT      |  |
      | G1 | RIGHT      |  |
      | H1 | RIGHT      |  |
      | I1 | RIGHT      |  |
      | J1 | RIGHT      |  |
      | K1 | RIGHT      |  |
      | L1 | RIGHT      |  |
      | M1 | RIGHT      |  |
      | N1 | RIGHT      |  |
      | O1 | RIGHT      |  |
      | P1 | RIGHT      |  |
      | Q1 | RIGHT      |  |
      | T1 | RIGHT      |  |
      | R1 | RIGHT      |  |
      | U1 | RIGHT      |  |
      | V1 | RIGHT      |  |
      | X1 |            |  |
    Then the label of link label should be display as following
      |  0 |  1 |  |
      |  1 |  2 |  |
      |  2 |  3 |  |
      |  3 |  4 |  |
      |  4 |  5 |  |
      |  5 |  6 |  |
      |  6 |  7 |  |
      |  7 |  8 |  |
      |  8 |  9 |  |
      |  9 | 10 |  |
      | 10 | 11 |  |
      | 11 | 12 |  |
      | 12 | 13 |  |
      | 13 | 14 |  |
      | 14 | 15 |  |
      | 15 | 16 |  |
      | 16 | 17 |  |
      | 17 | 18 |  |
      | 18 | 19 |  |
      | 19 | 20 |  |
      | 20 | 21 |  |
      | 21 |  0 |  |
    #10. Collapse target of A1
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
    #11. Expand target of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
    #12. Repeated step 6 with recursively service
    When user expands target recursively on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | D1 | RIGHT      |  |
      | G1 | RIGHT      |  |
      | F1 | RIGHT      |  |
      | E1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 4 | 5 |  |
      | 3 | 4 |  |
      | 5 | 6 |  |
      | 2 | 3 |  |
      | 1 | 2 |  |
      
 Scenario: Data_119 - Check displayed correctly relationship of nodes (that has a recursive nodes-n level on another table) when was started by it then Expand&Collapse them
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-86"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "Data_119"
    Then the graph should be displayed
    #5. Expand target of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
    #6. Expand source of A1
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT       |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 2 | 0 |  |
    #7. Expand target of B1
    When user expands target on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 |            |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 2 | 0 |  |
      | 1 | 2 |  |
    #8. Collapse source of A1
    When user collapse source on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
    #9. Expand target of B1
    When user expands target on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
    #10. Expand target of C1
    When user expands target on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 0 |  |
    #11. Collapse source of A1
    When user collapse source on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 0 |  |

Scenario: Data_120 - Check displayed correctly relationship of nodes (that has a recursive nodes-n level on another table) when was started by incoming nodes then Expand/Collapse them
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-86"
    And I access table "TableC"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "Data_119"
    Then the graph should be displayed
    #5. Expand target of C1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | C1 | LEFT,RIGHT |  |
      | A1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
    #6. Expand target of A1
    When user expands target on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | C1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | A1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
    #7. Collapse target/source of B1
    When user collapse target on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | C1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | A1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
    #8. Expand target of B1
    When user expands target on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | C1 | RIGHT |  |
      | B1 | RIGHT |  |
      | A1 | RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 0 |  |
    #9. Collapse target of C1
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | C1 | LEFT,RIGHT |  |
    Then there is no link displayed
    #10. From C expand recursively service
    When user expands target recursively on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | C1 | RIGHT |  |  |
      | A1 | RIGHT |  |  |
      | B1 | RIGHT |  |  |
    Then the label of link label should be display as following
      | 2 | 0 |  |
      | 0 | 1 |  |
      | 1 | 2 |  |
      
Scenario: Data_121 - Check displayed correctly relationship of nodes (it have recursives node(n level) on another table) when starting by it and expand&collapse render nodes after that.
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-88"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_121"
    Then the graph should be displayed
    #5. Expand target of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | C1 | LEFT,RIGHT |  |
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
    #6. Expand target of B1
    When user expands target on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | C1 | RIGHT      |  |
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 2 | 1 |  |
    #7. Collapse target of B1
    When user collapse target on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | C1 | LEFT,RIGHT |  |
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
    #8. Expand target of C1
    When user expands target on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | C1 | LEFT,RIGHT |  |
      | A1 | RIGHT      |  |
      | B1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 1 | 0 |  |
    #9. Collapse target of A1
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
    Then there is no link displayed
    #10. Expand target recursively of A1
    When user expands target recursively on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | C1 | RIGHT |  |  |
      | A1 | RIGHT |  |  |
      | B1 | RIGHT |  |  |
    Then the label of link label should be display as following
      | 2 | 1 |  |
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 1 | 0 |  |

  Scenario: Data_122 - Check displayed correctly relationship of nodes (it have recursives node(n level) on another table) when starting by it and expand&collapse them after that.
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-88"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_121"
    Then the graph should be displayed
    #5. Expand target of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | C1 | LEFT,RIGHT |  |
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
    #6. Expand target recursively of B1
    When user expands target recursively on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | C1 | RIGHT |  |
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 1 | 0 |  |
      | 2 | 1 |  |
    #7. Collapse target of A1
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
    Then there is no link displayed
    #8. Expand target of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | C1 | LEFT,RIGHT |  |
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      
Scenario: Data_123 - Check displayed correctly of relationship of nodes (it have recursives and outgoing and incoming nodes(n level) on another table) when starting by recursive nodes and expand&collapse them after that
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-90"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_123"
    Then the graph should be displayed
    #5. Expand target of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | B1 | LEFT,RIGHT |  |
      | A1 | LEFT,RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
    #6. Expand source of A1
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | B1 | LEFT,RIGHT |  |
      | A1 | LEFT,RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 0 |  |
    #7. Expand target recursively of B1
    When user expands target recursively on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | B1 | LEFT,RIGHT |  |
      | A1 | LEFT,RIGHT |  |
      | D1 | RIGHT      |  |
      | X1 |            |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 0 |  |
      | 2 | 3 |  |
      | 1 | 2 |  |
    #8. Expand source of B1
    When user expands source on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | B1 | LEFT,RIGHT |  |
      | A1 | LEFT,RIGHT |  |
      | D1 | RIGHT      |  |
      | X1 |            |  |
      | C1 |            |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 0 |  |
      | 2 | 3 |  |
      | 1 | 2 |  |
      | 4 | 1 |  |
    #9. Collapse target of A1
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
    Then there is no link displayed
    #10. Recursively expand target of A1
    When user expands target recursively on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | B1 | LEFT,RIGHT |  |
      | A1 | RIGHT      |  |
      | D1 | RIGHT      |  |
      | X1 |            |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 0 |  |
      | 2 | 3 |  |
      | 1 | 2 |  |

Scenario: Data_124 - Check displayed correctly relationship of nodes (it have recursives and outgoing and incoming nodes(n level) on another table) when starting by recursive nodes and expand&collapse render after that
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-90"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_123"
    Then the graph should be displayed
    #5. Expand target of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | B1 | LEFT,RIGHT |  |
      | A1 | LEFT,RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
    #6. Expand target of B1
    When user expands target on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | B1 | LEFT,RIGHT |  |
      | A1 | RIGHT      |  |
      | D1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 1 | 0 |  |
    #7. Collapse target of B1
    When user collapse target on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | B1 | LEFT,RIGHT |  |
      | A1 | LEFT,RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
    #8. Collapse target of A1
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
    Then there is no link displayed
    #9. Expand target of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | B1 | LEFT,RIGHT |  |
      | A1 | LEFT,RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
    #10. Recursively expand target of B1
    When user expands target recursively on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | B1 | LEFT,RIGHT |  |
      | A1 | RIGHT      |  |
      | D1 | RIGHT      |  |
      | X1 |            |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 0 |  |
      | 2 | 3 |  |
      | 1 | 2 |  |
    
Scenario: Data_125 - Check displayed correctly state of relationship of nodes (it have recursives and outgoing and incoming nodes(n level) on another table)  when starting by it and expand&collapse them after that
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-90"
    And I access table "TableB"
    And user views "Visualization>Display data using configuration" of record has ID is "B1"
    And user generates graph with configuration "Data_123"
    Then the graph should be displayed
    #5. Expand target of B1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | B1 | LEFT,RIGHT |  |
      | A1 | RIGHT      |  |
      | D1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
    #6. Expand source of B1
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | B1 | LEFT,RIGHT |  |
      | A1 |            |  |
      | D1 | RIGHT      |  |
      | C1 |            |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 3 | 0 |  |
      | 1 | 0 |  |
    #8. Expand recursively target of D1
    When user expands target recursively on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | B1 | LEFT,RIGHT |  |
      | A1 |            |  |
      | D1 | RIGHT      |  |
      | C1 |            |  |
      | X1 |            |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 3 | 0 |  |
      | 1 | 0 |  |
      | 2 | 4 |  |

Scenario: Data_126 - Check displayed correctly of relationship of nodes (it have recursives and outgoing and incoming nodes(n level) on same table)  when starting by incoming nodes and expand&collapse them after that
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-90"
    And I access table "TableC"
    And user views "Visualization>Display data using configuration" of record has ID is "C1"
    And user generates graph with configuration "Data_123"
    Then the graph should be displayed
    #5. Expand target of C1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | B1 | LEFT,RIGHT |  |
      | C1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
    #6. Expand target & source of B1
    When user expands source on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | B1 | LEFT,RIGHT |  |
      | A1 | LEFT       |  |
      | C1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 2 | 1 |  |
    When user expands target on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | B1 | LEFT,RIGHT |  |
      | A1 |            |  |
      | C1 | RIGHT      |  |
      | D1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 2 | 1 |  |
      | 1 | 3 |  |
      | 1 | 2 |  |
    #7. Collapse target of C1
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | C1 | RIGHT |  |
    Then there is no link displayed

Scenario: Data_127 - Check displayed correctly state of relationship of nodes (it have same outgoing and incoming nodes(n level) on another table) when starting by incoming node and expand&collapse them and render nodes after that
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-94"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_127"
    Then the graph should be displayed
    #5. Expand target of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
    #6. Expand target of B1
    When user expands target on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
      | D1 |       |  |
      | E1 | LEFT  |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 2 | 4 |  |
      | 2 | 1 |  |
      | 2 | 3 |  |
    #7. Expand target of C1
    When user expands target on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
      | D1 |       |  |
      | E1 |       |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 2 | 4 |  |
      | 2 | 1 |  |
      | 2 | 3 |  |
      | 1 | 3 |  |
    #8. Collapse target B1
    When user collapse target on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
    #9. Expand target recursively of B1
    When user expands target recursively on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
      | D1 |       |  |
      | E1 |       |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 2 | 4 |  |
      | 2 | 1 |  |
      | 2 | 3 |  |
      | 1 | 3 |  |

Scenario: Data_128 - Check displayed correctly of relationship of nodes (it have same outgoing and incoming nodes(n level) on another table) when starting by incoming node and expand&collapse them and render nodes after that
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-94"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_128"
    Then the graph should be displayed
    #5. Expand target of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
    #6. Expand target of B1
    When user expands target on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | D1 | LEFT,RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 2 | 1 |  |
      | 2 | 3 |  |
    #7. Expand target & source of D1
    When user expands target on node "3"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | D1 | LEFT,RIGHT |  |
      | E1 |            |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 2 | 1 |  |
      | 2 | 3 |  |
      | 3 | 4 |  |
    When user expands source on node "3"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | B1 | RIGHT      |  |
      | C1 |            |  |
      | D1 | LEFT,RIGHT |  |
      | E1 |            |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 2 | 1 |  |
      | 2 | 3 |  |
      | 3 | 4 |  |
      | 1 | 3 |  |
    #8. Collapse target B1
    When user collapse target on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
    #9. Expand recursively target of B1
    When user expands target recursively on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
      | D1 | RIGHT |  |
      | E1 |       |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 2 | 1 |  |
      | 2 | 3 |  |
      | 3 | 4 |  |
      | 1 | 3 |  |

  Scenario: Data_129 - Check displayed correctly of relationship of nodes (it have same outgoing and incoming nodes(n level) on another table) when starting by incoming node and expand&collapse them and render nodes after that
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-94"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_128"
    Then the graph should be displayed
    #5. Expand target of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
    #6. Expand target of B1
    When user expands target on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | D1 | LEFT,RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 2 | 1 |  |
      | 2 | 3 |  |
    #7. Expand target of C1
    When user expands target on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | D1 | RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 2 | 1 |  |
      | 2 | 3 |  |
      | 1 | 3 |  |
   #8. Expand target of D1
    When user expands target on node "3"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | B1 | RIGHT      |  |
      | C1 | RIGHT           |  |
      | D1 | RIGHT |  |
      | E1 |            |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 2 | 1 |  |
      | 2 | 3 |  |
      | 3 | 4 |  |
      | 1 | 3 |  |
    #9. Collapse target B1
    When user collapse target on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
    #10. Expand target of B1
    When user expands target on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
      | D1 | LEFT,RIGHT |  |
         Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 2 | 1 |  |
      | 2 | 3 |  |

       Scenario: Data_130 - Check displayed correctly of relationship of nodes (it have same many outgoing&incoming nodes(n level) on another table) when starting by incoming node and expand&collapse them and render nodes after that
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-97"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_130"
    Then the graph should be displayed
    #5. Expand target of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | B1 | LEFT,RIGHT |  |
      | F1 | LEFT,RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 0 | 3 |  |
    #6. Expand target & source of B1
    When user expands target on node "3"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | B1 | LEFT,RIGHT |  |
      | F1 | LEFT,RIGHT |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT       |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 0 | 3 |  |
      | 3 | 2 |  |
      | 3 | 4 |  |
      | 3 | 5 |  |
    When user expands source on node "3"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | B1 | LEFT,RIGHT |  |
      | F1 | LEFT,RIGHT |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT       |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 0 | 3 |  |
      | 3 | 2 |  |
      | 3 | 4 |  |
      | 3 | 5 |  |
      | 1 | 3 |  |
    #7. Expand target of C1
    When user expands target on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | B1 | LEFT,RIGHT |  |
      | F1 | RIGHT      |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT       |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 0 | 3 |  |
      | 3 | 2 |  |
      | 3 | 4 |  |
      | 3 | 5 |  |
      | 1 | 3 |  |
      | 1 | 2 |  |
    #8. Expand target of D1
    When user expands target on node "4"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | B1 | LEFT,RIGHT |  |
      | F1 | RIGHT      |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT       |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 0 | 3 |  |
      | 3 | 2 |  |
      | 3 | 4 |  |
      | 3 | 5 |  |
      | 1 | 3 |  |
      | 1 | 2 |  |
      | 4 | 5 |  |
    #9. Expand source of E1
    When user expands source on node "5"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | B1 | LEFT,RIGHT |  |
      | F1 | RIGHT      |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT       |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 0 | 3 |  |
      | 3 | 2 |  |
      | 3 | 4 |  |
      | 3 | 5 |  |
      | 1 | 3 |  |
      | 1 | 2 |  |
      | 4 | 5 |  |
      | 2 | 5 |  |
    #10. Expand target of F1
    When user expands target on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | B1 | LEFT,RIGHT |  |
      | F1 | RIGHT      |  |
      | D1 | RIGHT      |  |
      | E1 | LEFT       |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 0 | 3 |  |
      | 3 | 2 |  |
      | 3 | 4 |  |
      | 3 | 5 |  |
      | 1 | 3 |  |
      | 1 | 2 |  |
      | 4 | 5 |  |
      | 2 | 5 |  |
      | 2 | 4 |  |
    # 11. Collapse target of A1
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
    #12. Expand target of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | B1 | LEFT,RIGHT |  |
      | F1 | LEFT,RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 0 | 3 |  |
    #13. Recursively Expand target & source of B1
    When user expands source recursively on node "3"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | B1 | LEFT,RIGHT |  |
      | F1 | LEFT,RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 0 | 3 |  |
      | 1 | 3 |  |
    When user expands target recursively on node "3"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | B1 | LEFT,RIGHT |  |
      | F1 | LEFT,RIGHT |  |
      | D1 | RIGHT      |  |
      | E1 |            |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 0 | 3 |  |
      | 1 | 3 |  |
      | 4 | 5 |  |
      | 2 | 5 |  |
      | 2 | 4 |  |
      | 3 | 4 |  |
      | 3 | 5 |  |
      | 3 | 2 |  |
    #13. Recursively Expand target of C1
    When user expands target recursively on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | B1 | LEFT,RIGHT |  |
      | F1 | RIGHT      |  |
      | D1 | RIGHT      |  |
      | E1 |            |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 0 | 3 |  |
      | 1 | 3 |  |
      | 4 | 5 |  |
      | 2 | 5 |  |
      | 2 | 4 |  |
      | 3 | 4 |  |
      | 3 | 5 |  |
      | 3 | 2 |  |
      | 1 | 2 |  |
      
Scenario: Data_131 - Check displayed correctly of relationship of nodes (it have same many outgoing&incoming nodes(n level) on another table by FKs) when starting by incoming node and expand&collapse them and render nodes after that
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-98"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_131"
    Then the graph should be displayed
    #5. Expand target of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | B1 | LEFT,RIGHT |  |
      | F1 | LEFT,RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  | true |
      | 0 | 2 |  | true |
      | 0 | 3 |  | true |
    #6. Expand target of B1
    When user expands target on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | B1 | LEFT,RIGHT |  |
      | F1 | LEFT,RIGHT |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT       |  |
    Then the label of link label should be display as following
      | 0 | 1 |  | true |
      | 0 | 2 |  | true |
      | 0 | 3 |  | true |
      | 2 | 3 |  | true |
      | 2 | 4 |  | true |
      | 2 | 5 |  | true |
    #7. Expand target of C1
    When user expands target on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | B1 | RIGHT      |  |
      | F1 | RIGHT      |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT       |  |
    Then the label of link label should be display as following
      | 0 | 1 |  | true |
      | 0 | 2 |  | true |
      | 0 | 3 |  | true |
      | 2 | 3 |  | true |
      | 2 | 4 |  | true |
      | 2 | 5 |  | true |
      | 1 | 3 |  | true |
      | 1 | 2 |  | true |
    #8. Expand target of D1
    When user expands target on node "4"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | B1 | RIGHT      |  |
      | F1 | RIGHT      |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT       |  |
    Then the label of link label should be display as following
      | 0 | 1 |  | true |
      | 0 | 2 |  | true |
      | 0 | 3 |  | true |
      | 2 | 3 |  | true |
      | 2 | 4 |  | true |
      | 2 | 5 |  | true |
      | 1 | 3 |  | true |
      | 1 | 2 |  | true |
      | 4 | 5 |  | true |
    #9. Expand source of E1
    When user expands source on node "5"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | B1 | RIGHT      |  |
      | F1 | RIGHT      |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT       |  |
    Then the label of link label should be display as following
      | 0 | 1 |  | true |
      | 0 | 2 |  | true |
      | 0 | 3 |  | true |
      | 2 | 3 |  | true |
      | 2 | 4 |  | true |
      | 2 | 5 |  | true |
      | 1 | 3 |  | true |
      | 1 | 2 |  | true |
      | 4 | 5 |  | true |
      | 3 | 5 |  | true |
    #10. Expand target of F1
    When user expands target on node "3"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
      | C1 | RIGHT |  |
      | B1 | RIGHT |  |
      | F1 | RIGHT |  |
      | D1 | RIGHT |  |
      | E1 | LEFT  |  |
    Then the label of link label should be display as following
      | 0 | 1 |  | true |
      | 0 | 2 |  | true |
      | 0 | 3 |  | true |
      | 2 | 3 |  | true |
      | 2 | 4 |  | true |
      | 2 | 5 |  | true |
      | 1 | 3 |  | true |
      | 1 | 2 |  | true |
      | 4 | 5 |  | true |
      | 3 | 5 |  | true |
      | 3 | 4 |  | true |
    # 11. Collapse target of A1
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
    #12. Expand target of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | B1 | LEFT,RIGHT |  |
      | F1 | LEFT,RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  | true |
      | 0 | 2 |  | true |
      | 0 | 3 |  | true |
    #13. Recursively Expand target & source of B1
    When user expands source recursively on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | B1 | LEFT,RIGHT |  |
      | F1 | LEFT,RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  | true |
      | 0 | 2 |  | true |
      | 0 | 3 |  | true |
      | 1 | 2 |  | true |
    When user expands target recursively on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | B1 | LEFT,RIGHT |  |
      | F1 | LEFT,RIGHT |  |
      | D1 | RIGHT      |  |
      | E1 |            |  |
    Then the label of link label should be display as following
      | 0 | 1 |  | true |
      | 0 | 2 |  | true |
      | 0 | 3 |  | true |
      | 1 | 2 |  | true |
      | 3 | 5 |  | true |
      | 3 | 4 |  | true |
      | 4 | 5 |  | true |
      | 2 | 4 |  | true |
      | 2 | 5 |  | true |
      | 2 | 3 |  | true |
    #13. Recursively Expand target of C1
    When user expands target recursively on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | C1 | RIGHT      |  |
      | B1 | LEFT,RIGHT |  |
      | F1 | RIGHT      |  |
      | D1 | RIGHT      |  |
      | E1 |            |  |
    Then the label of link label should be display as following
      | 0 | 1 |  | true |
      | 0 | 2 |  | true |
      | 0 | 3 |  | true |
      | 1 | 2 |  | true |
      | 3 | 5 |  | true |
      | 3 | 4 |  | true |
      | 4 | 5 |  | true |
      | 2 | 4 |  | true |
      | 2 | 5 |  | true |
      | 2 | 3 |  | true |
      | 1 | 3 |  | true |
      
 Scenario: Data_133 - Check displayed correctly state of relationship of nodes (it have recursive and incoming nodes on another table) when starting by outgoing and expand&collapse them after that
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-99"
    And I access table "TableC"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "Data_133"
    Then the graph should be displayed
    #5. Expand target & source of C1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | C1 | LEFT,RIGHT |  |
      | A1 | LEFT,RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 0 |  |
      | 0 | 1 |  |
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | C1 | LEFT,RIGHT |  |
      | A1 | LEFT,RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 0 |  |
      | 0 | 1 |  |
      | 1 | 0 |  |
    #6. Expand target & source of A1
    When user expands target on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | C1 | LEFT,RIGHT |  |
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 0 |  |
      | 0 | 1 |  |
      | 1 | 0 |  |
      | 1 | 1 |  |
      | 1 | 2 |  |
    When user expands source on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | C1 | LEFT,RIGHT |  |
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 0 |  |
      | 0 | 1 |  |
      | 1 | 0 |  |
      | 1 | 1 |  |
      | 1 | 2 |  |
      | 2 | 1 |  |
    #7. Expand target of B1
    When user expands target on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | C1 | LEFT,RIGHT |  |
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 0 |  |
      | 0 | 1 |  |
      | 1 | 0 |  |
      | 1 | 1 |  |
      | 1 | 2 |  |
      | 2 | 1 |  |
      | 2 | 2 |  |
    #8. Collapse target B1
    When user collapse target on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | C1 | LEFT,RIGHT |  |
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 0 |  |
      | 0 | 1 |  |
      | 1 | 0 |  |
      | 1 | 1 |  |
      | 1 | 2 |  |
      | 2 | 1 |  |
    #9. Collapse A1
    When user collapse source on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | C1 | LEFT,RIGHT |  |
      | A1 | LEFT,RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 0 |  |
      | 0 | 1 |  |
      | 1 | 0 |  |
      | 1 | 1 |  |
    #10. Collapse C1
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | C1 | LEFT,RIGHT |  |
    Then there is no link displayed