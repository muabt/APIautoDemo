#Author: tbui@tibco.com
@DMDV100-GraphData
Feature: Test graph data with configuration

  Background: 
    Given I login to EBX succesfully

  Scenario: Data_175 - Check expand & collapse node for a starting node when it have many incoming & outgoing node from external table (#TabelName&Same Data Model, SameSpace, #DataSet)
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_175"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V100_Line&Contain_Data_175"
    Then the graph should be displayed
    #5. Expand target/parent of A1
    When user expands target on node "0"
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | C'1 |                       |   |
      | B'1 | BOTTOM                |   |
      | A1  | LEFT,RIGHT,TOP,BOTTOM | 2 |
    Then the label of link label should be display as following
      | 3 | 1 |  |
    #6. Expand source/child of A1
    When user expands source on node "3"
    When user expands children on node "3"
    Then the label of all nodes is displayed as following
      | C'1 |                       |   |
      | B'1 | BOTTOM                |   |
      | A1  | LEFT,RIGHT,TOP,BOTTOM | 2 |
      | D'1 |                       |   |
      | E'1 | TOP                   | 3 |
    Then the label of link label should be display as following
      | 3 | 1 |  |
      | 4 | 3 |  |
    #7. Collapse all of A1
    When user collapse source on node "3"
    When user collapse children on node "3"
    When user collapse target on node "3"
    When user collapse parent on node "3"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT,TOP,BOTTOM |  |
    Then there is no link displayed
    #8. Repeated step 5->9 with recursively service
    When user expands target recursively on node "0"
    When user expands parent recursively on node "0"
    When user expands source recursively on node "3"
    When user expands children recursively on node "3"
    Then the label of all nodes is displayed as following
      | C'1 |                       |   |
      | B'1 | BOTTOM                |   |
      | A1  | LEFT,RIGHT,TOP,BOTTOM | 2 |
      | D'1 |                       |   |
      | E'1 | TOP                   | 3 |
    Then the label of link label should be display as following
      | 3 | 1 |  |
      | 4 | 3 |  |
    When user collapse source recursively on node "3"
    When user collapse children recursively on node "3"
    When user collapse target recursively on node "3"
    When user collapse parent recursively on node "3"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT,TOP,BOTTOM |  |
    Then there is no link displayed

  Scenario: Data_177 - Check expand & collapse node for a starting node when it have many incoming & outgoing node from external table (#TabelName&#DataModel&sameSpace, #DataSet)
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_177"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V100_Line_Data_177"
    Then the graph should be displayed
    #5. Expand target/parent of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
    #6. Expand target/parent of B1
    When user expands target on node "1"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
    #7. Expand target/parent of C1
    When user expands target on node "2"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
      | D1 | LEFT,RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 3 |  |
    #7. Expand target/parent of D1
    When user expands target on node "3"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT,RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 3 |  |
      | 3 | 4 |  |
    #7. Expand target/parent of E1
    When user expands target on node "4"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT,RIGHT |  |
      | F1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 3 |  |
      | 3 | 4 |  |
      | 4 | 5 |  |
    #7. Expand target/parent of F1
    When user expands target on node "5"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT,RIGHT |  |
      | F1 | RIGHT      |  |
      | G1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 3 |  |
      | 3 | 4 |  |
      | 4 | 5 |  |
      | 5 | 6 |  |
    #7. Expand target/parent of G1
    When user expands target on node "6"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT,RIGHT |  |
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
    #7. Expand target/parent of H1
    When user expands target on node "7"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT,RIGHT |  |
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
    #7. Expand target/parent of I1
    When user expands target on node "8"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT,RIGHT |  |
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
    #7. Expand target/parent of J1
    When user expands target on node "9"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT,RIGHT |  |
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
    #7. Expand target/parent of K1
    When user expands target on node "10"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT,RIGHT |  |
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
    #7. Expand target/parent of L1
    When user expands target on node "11"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT,RIGHT |  |
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
    #7. Expand target/parent of M1
    When user expands target on node "12"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT,RIGHT |  |
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
    #7. Expand target/parent of N1
    When user expands target on node "13"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT,RIGHT |  |
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
    #7. Expand target/parent of O1
    When user expands target on node "14"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT,RIGHT |  |
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
    #7. Expand target/parent of P1
    When user expands target on node "15"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT,RIGHT |  |
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
    #7. Expand target/parent of Q1
    When user expands target on node "16"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT,RIGHT |  |
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
    #7. Expand target/parent of T1
    When user expands target on node "17"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT,RIGHT |  |
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
    #8. Expand target/parent of R1
    When user expands target on node "18"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT,RIGHT |  |
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
    #9. Expand source/child of A1
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT,RIGHT |  |
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
      | U1 |            |  |
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
      | 19 |  0 |  |
    #10. Collapse target/parent of A1
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT |  |
    Then there is no link displayed
    #11. Expand target/parent of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
    #12. Repeated step 5->9 with recursively service
    When user expands target recursively on node "1"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
      | D1 | LEFT,RIGHT |  |
      | E1 | LEFT,RIGHT |  |
      | F1 | RIGHT      |  |
      | G1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 3 |  |
      | 3 | 4 |  |
      | 4 | 5 |  |
      | 5 | 6 |  |

  Scenario: Data_178 - Check expand & collapse node for a starting node when it have many incoming & outgoing node from external table (#TabelName&#DataModel&#Space, #DataSet)
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_externalTable"
    And I access table "/root/GroupA/TableA_116" on group "/root/GroupA"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "V100_Line_Data_178"
    Then the graph should be displayed
    #5. Expand target/parent of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
    #6. Expand target/parent of B1
    When user expands target on node "1"
    Then the label of all nodes is displayed as following
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
    #7. Expand target/parent of C1
    When user expands target on node "2"
    Then the label of all nodes is displayed as following
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
      | D1 | RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 3 |  |
    #7. Expand target/parent of D1
    When user expands target on node "3"
    Then the label of all nodes is displayed as following
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
      | D1 | RIGHT |  |
      | E1 | RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 3 |  |
      | 3 | 4 |  |
    #7. Expand target/parent of E1
    When user expands target on node "4"
    Then the label of all nodes is displayed as following
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
      | D1 | RIGHT |  |
      | E1 | RIGHT |  |
      | F1 | RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 3 |  |
      | 3 | 4 |  |
      | 4 | 5 |  |
    #7. Expand target/parent of F1
    When user expands target on node "5"
    Then the label of all nodes is displayed as following
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
      | D1 | RIGHT |  |
      | E1 | RIGHT |  |
      | F1 | RIGHT |  |
      | G1 | RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 3 |  |
      | 3 | 4 |  |
      | 4 | 5 |  |
      | 5 | 6 |  |
    #7. Expand target/parent of G1
    When user expands target on node "6"
    Then the label of all nodes is displayed as following
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
      | D1 | RIGHT |  |
      | E1 | RIGHT |  |
      | F1 | RIGHT |  |
      | G1 | RIGHT |  |
      | H1 | RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 3 |  |
      | 3 | 4 |  |
      | 4 | 5 |  |
      | 5 | 6 |  |
      | 6 | 7 |  |
    #7. Expand target/parent of H1
    When user expands target on node "7"
    Then the label of all nodes is displayed as following
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
      | D1 | RIGHT |  |
      | E1 | RIGHT |  |
      | F1 | RIGHT |  |
      | G1 | RIGHT |  |
      | H1 | RIGHT |  |
      | I1 | RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 3 |  |
      | 3 | 4 |  |
      | 4 | 5 |  |
      | 5 | 6 |  |
      | 6 | 7 |  |
      | 7 | 8 |  |
    #7. Expand target/parent of I1
    When user expands target on node "8"
    Then the label of all nodes is displayed as following
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
    #7. Expand target/parent of J1
    When user expands target on node "9"
    Then the label of all nodes is displayed as following
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
    #7. Expand target/parent of K1
    When user expands target on node "10"
    Then the label of all nodes is displayed as following
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
    #7. Expand target/parent of L1
    When user expands target on node "11"
    Then the label of all nodes is displayed as following
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
    #7. Expand target/parent of M1
    When user expands target on node "12"
    Then the label of all nodes is displayed as following
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
    #7. Expand target/parent of N1
    When user expands target on node "13"
    Then the label of all nodes is displayed as following
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
    #7. Expand target/parent of O1
    When user expands target on node "14"
    Then the label of all nodes is displayed as following
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
    #7. Expand target/parent of P1
    When user expands target on node "15"
    Then the label of all nodes is displayed as following
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
    #7. Expand target/parent of Q1
    When user expands target on node "16"
    Then the label of all nodes is displayed as following
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
    #7. Expand target/parent of T1
    When user expands target on node "17"
    Then the label of all nodes is displayed as following
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
    #7. Expand target/parent of R1
    When user expands target on node "18"
    Then the label of all nodes is displayed as following
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
    #7. Expand target/parent of U1
    When user expands target on node "19"
    Then the label of all nodes is displayed as following
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
    #8. Expand target/parent of V1
    When user expands target on node "20"
    Then the label of all nodes is displayed as following
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
    #9. Collapse target/parent of A1
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      | A1 | RIGHT |  |
    Then there is no link displayed
    #10. Expand target/parent of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
    #11. Repeated step 5->9 with recursively service
    When user expands target recursively on node "1"
    When user expands target recursively on node "6"
    When user expands target recursively on node "11"
    When user expands target recursively on node "16"
    Then the label of all nodes is displayed as following
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

  Scenario: Data_181 - Check expand & collapse node for a starting node when it have many incoming & outgoing node from external table (#TabelName&(n)#DataModel&sameSpace, (n)#DataSet)
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_181"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V100_Line&Contain_Data_181 "
    Then the graph should be displayed
    #5. Expand target/parent of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |   |
      | B1 | RIGHT | 1 |
      | C1 | RIGHT |   |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
    #6. Expand target/parent of B1
    When user expands target on node "2"
    Then the label of all nodes is displayed as following
      | A1 | RIGHT    |   |
      | B1 | RIGHT    | 1 |
      | C1 | RIGHT    |   |
      | D1 | LEFT,TOP |   |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 2 | 3 |  |
    #7. Expand target/parent & source/child of D1
    When user expands source on node "3"
    When user expands parent on node "3"
    Then the label of all nodes is displayed as following
      | A1 | RIGHT    |   |
      | B1 | RIGHT    | 1 |
      | C1 |          |   |
      | D1 | LEFT,TOP | 4 |
      | E1 |          |   |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 2 | 5 |  |
      | 1 | 5 |  |
    #8. Collapse B1
    When user collapse target on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |   |
      | B1 | RIGHT | 1 |
      | C1 | RIGHT |   |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
    #9. Expand recursively target/parent of B1
    When user expands target recursively on node "2"
    Then the label of all nodes is displayed as following
      | A1 | RIGHT    |   |
      | B1 | RIGHT    | 1 |
      | C1 | RIGHT    |   |
      | D1 | LEFT,TOP |   |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 2 | 3 |  |

  Scenario: Data_183 - Check expand & collapse node for a starting node when it have many incoming & outgoing node from external table (of external table )
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_183"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V100_Line_Data_183"
    Then the graph should be displayed
    #5. Expand target/parent of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
    #6. Expand target/parent of B1
    When user expands target on node "2"
    Then the label of all nodes is displayed as following
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
      | D1 |       |  |
      | E1 | LEFT  |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 2 | 3 |  |
      | 2 | 4 |  |
      | 2 | 1 |  |
    #7. Expand target/parent of C1
    When user expands source on node "1"
    When user expands parent on node "1"
    Then the label of all nodes is displayed as following
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
      | D1 |       |  |
      | E1 | LEFT  |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 2 | 3 |  |
      | 2 | 4 |  |
      | 2 | 1 |  |
    #8. Collapse B1
    When user collapse target on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT      |  |
      | C1 | LEFT,RIGHT |  |
      | B1 | RIGHT      |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
    #9. Repeated step 6 with recursively service
    When user expands target recursively on node "2"
    Then the label of all nodes is displayed as following
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
      | D1 |       |  |
      | E1 |       |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 2 | 3 |  |
      | 2 | 4 |  |
      | 2 | 1 |  |
      | 1 | 3 |  |

  Scenario: Data_184 - Check the display of nodes on the graph incase expand then collapse a node that both has one target node and has many parents in the other table
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_184"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_184"
    Then the graph should be displayed
    #3. Expand target (TableB) of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,TOP |  |
      | B1 |           |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
    #4. Expand parent of A1
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | A1 | RIGHT,TOP | 3 |
      | A1 | RIGHT,TOP | 5 |
      | B1 |           |   |
      | C1 |           |   |
      | D1 |           |   |
    Then the label of link label should be display as following
      | 2 | 1 |  |
      | 4 | 1 |  |
    #5. Collapse target (TableB) of A1
    When user collapse target on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,TOP | 3 |
      | A1 | RIGHT,TOP | 5 |
      | D1 |           |   |
      | C1 |           |   |
    Then there is no link displayed
    #6. Collapse parent of A1
    When user collapse parent on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,TOP |  |
    Then there is no link displayed
    #7. Expand recursively parents from A1
    When user expands parent recursively on node "0"
    Then the label of all nodes is displayed as following
      | A1 | RIGHT,TOP | 3 |
      | A1 | RIGHT,TOP | 5 |
      | D1 |           |   |
      | C1 |           |   |
    Then there is no link displayed
    #8. Expand recursively targets from A1
    When user expands target recursively on node "2"
    Then the label of all nodes is displayed as following
      | B1 |           |   |
      | A1 | RIGHT,TOP | 3 |
      | A1 | RIGHT,TOP | 5 |
      | D1 |           |   |
      | C1 |           |   |
    Then the label of link label should be display as following
      | 2 | 1 |  |
      | 4 | 1 |  |

  Scenario: Data_185 - Check the display of nodes on the graph incase expand then collapse a node that both has one source node and has many parents in the other table
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_185"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_185"
    Then the graph should be displayed
    #3. Expand source (TableB) of A1
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,TOP |  |
      | B1 |          |  |
    Then the label of link label should be display as following
      | 1 | 0 |  |
    #4. Expand parent of A1
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,TOP | 3 |
      | A1 | LEFT,TOP | 5 |
      | B1 |          |   |
      | C1 |          |   |
      | D1 |          |   |
    Then the label of link label should be display as following
      | 1 | 2 |  |
      | 1 | 4 |  |
    #5. Collapse source (TableB) of A1
    When user collapse source on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,TOP | 3 |
      | A1 | LEFT,TOP | 5 |
      | D1 |          |   |
      | C1 |          |   |
    Then there is no link displayed
    #6. Collapse parent of A1
    When user collapse parent on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,TOP |  |
    Then there is no link displayed
    #7. Expand recursively parents from A1
    When user expands parent recursively on node "0"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,TOP | 3 |
      | A1 | LEFT,TOP | 5 |
      | D1 |          |   |
      | C1 |          |   |
    Then there is no link displayed
    #8. Expand recursively source from A1
    When user expands source recursively on node "2"
    Then the label of all nodes is displayed as following
      | B1 |          |   |
      | A1 | LEFT,TOP | 3 |
      | A1 | LEFT,TOP | 5 |
      | D1 |          |   |
      | C1 |          |   |
    Then the label of link label should be display as following
      | 1 | 2 |  |
      | 1 | 4 |  |

  Scenario: Data_186- Check the display of nodes on the graph incase expand then collapse a node that both has one target node and has many children in the other table
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_185"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_186"
    Then the graph should be displayed
    #3. Expand target (TableB) of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,BOTTOM |  |
      | B1 |              |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
    #4. Expand children of A1
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      | A1 | RIGHT,BOTTOM |   |
      | B1 |              |   |
      | C1 |              | 0 |
      | D1 |              | 0 |
    Then the label of link label should be display as following
      | 0 | 1 |  |
    #5. Collapse target (TableB) of A1
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,BOTTOM |   |
      | D1 |              | 0 |
      | C1 |              | 0 |
    Then there is no link displayed
    #6. Collapse children of A1
    When user collapse children on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,BOTTOM |  |
    Then there is no link displayed
    #7. Expand recursively children from A1
    When user expands children recursively on node "0"
    Then the label of all nodes is displayed as following
      | A1 | RIGHT,BOTTOM |   |
      | D1 |              | 0 |
      | C1 |              | 0 |
    Then there is no link displayed
    #8. Expand recursively target from A1
    When user expands target recursively on node "0"
    Then the label of all nodes is displayed as following
      | B1 |              |   |
      | A1 | RIGHT,BOTTOM |   |
      | D1 |              | 0 |
      | C1 |              | 0 |
    Then the label of link label should be display as following
      | 0 | 1 |  |

  Scenario: Data_187- Check the display of nodes on the graph incase expand then collapse a node that both has one source node and has many children in the other table
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_185"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_187"
    Then the graph should be displayed
    #3. Expand source (TableB) of A1
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,BOTTOM |  |
      | B1 |             |  |
    Then the label of link label should be display as following
      | 1 | 0 |  |
    #4. Expand children of A1
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,BOTTOM |   |
      | B1 |             |   |
      | C1 |             | 0 |
      | D1 |             | 0 |
    Then the label of link label should be display as following
      | 1 | 0 |  |
    #5. Collapse source (TableB) of A1
    When user collapse source on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,BOTTOM |   |
      | D1 |             | 0 |
      | C1 |             | 0 |
    Then there is no link displayed
    #6. Collapse children of A1
    When user collapse children on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,BOTTOM |  |
    Then there is no link displayed
    #7. Expand recursively children from A1
    When user expands children recursively on node "0"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,BOTTOM |   |
      | D1 |             | 0 |
      | C1 |             | 0 |
    Then there is no link displayed
    #8. Expand recursively source from A1
    When user expands source recursively on node "0"
    Then the label of all nodes is displayed as following
      | B1 |             |   |
      | A1 | LEFT,BOTTOM |   |
      | D1 |             | 0 |
      | C1 |             | 0 |
    Then the label of link label should be display as following
      | 1 | 0 |  |

  Scenario: Data_188 - Check the display of nodes on the graph incase expand then collapse a node that both has many targets and has one child in the other table
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_185"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_188"
    Then the graph should be displayed
    #3. Expand target (TableB) of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,BOTTOM |  |
      | B1 |              |  |
      | C1 |              |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
    #4. Expand children of A1
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      | A1 | RIGHT,BOTTOM |   |
      | B1 |              |   |
      | C1 |              |   |
      | D1 |              | 0 |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
    #5. Collapse target of A1
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,BOTTOM |   |
      | D1 |              | 0 |
    Then there is no link displayed
    #6. Collapse children of A1
    When user collapse children on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,BOTTOM |  |
    Then there is no link displayed
    #7. Expand recursively children from A1
    When user expands children recursively on node "0"
    Then the label of all nodes is displayed as following
      | A1 | RIGHT,BOTTOM |   |
      | D1 |              | 0 |
    Then there is no link displayed
    #8. Expand recursively target from A1
    When user expands target recursively on node "0"
    Then the label of all nodes is displayed as following
      | A1 | RIGHT,BOTTOM |   |
      | B1 |              |   |
      | C1 |              |   |
      | D1 |              | 0 |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |

  Scenario: Data_189 - Check the display of nodes on the graph incase expand then collapse a node that both has many sources and has one parent in the other table
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_185"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_189"
    Then the graph should be displayed
    #3. Expand source (TableB) of A1
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,TOP |  |
      | B1 |          |  |
      | C1 |          |  |
    Then the label of link label should be display as following
      | 1 | 0 |  |
      | 2 | 0 |  |
    #4. Expand parent of A1
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,TOP | 4 |
      | B1 |          |   |
      | C1 |          |   |
      | D1 |          |   |
    Then the label of link label should be display as following
      | 1 | 3 |  |
      | 2 | 3 |  |
    #5. Collapse source (TableB) of A1
    When user collapse source on node "3"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,TOP | 4 |
      | D1 |          |   |
    Then there is no link displayed
    #6. Collapse parent of A1
    When user collapse parent on node "3"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,TOP |  |
    Then there is no link displayed
    #7. Expand recursively parent from A1
    When user expands parent recursively on node "0"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,TOP | 4 |
      | D1 |          |   |
    Then there is no link displayed
    #8. Expand recursively source from A1
    When user expands source recursively on node "3"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,TOP | 4 |
      | B1 |          |   |
      | C1 |          |   |
      | D1 |          |   |
    Then the label of link label should be display as following
      | 1 | 3 |  |
      | 2 | 3 |  |

  Scenario: Data_190 - Check the display of nodes on the graph incase expand then collapse a node that the node has targets/sources/children/parents in the other table
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_190"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_190"
    Then the graph should be displayed
    #3. Expand source of A1
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT,TOP,BOTTOM |  |
      | B1 |                       |  |
      | C1 |                       |  |
      | D1 |                       |  |
    Then the label of link label should be display as following
      | 1 | 0 |  |
      | 2 | 0 |  |
      | 3 | 0 |  |
    #4. Expand parent from A1
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 4 |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 6 |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 8 |
      | B1 |                       |   |
      | C1 |                       |   |
      | D1 |                       |   |
      | M1 |                       |   |
      | L1 |                       |   |
      | K1 |                       |   |
    Then the label of link label should be display as following
      | 3 | 9 |  |
      | 2 | 9 |  |
      | 1 | 7 |  |
      | 2 | 7 |  |
      | 3 | 7 |  |
      | 3 | 5 |  |
      | 1 | 9 |  |
      | 1 | 5 |  |
      | 2 | 5 |  |
    #5. Expand children from A1
    When user expands children on node "5"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 4 |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 6 |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 8 |
      | B1 |                       |   |
      | C1 |                       |   |
      | D1 |                       |   |
      | M1 |                       |   |
      | L1 |                       |   |
      | K1 |                       |   |
      | H1 |                       | 9 |
      | I1 |                       | 9 |
      | J1 |                       | 9 |
      | H1 |                       | 7 |
      | I1 |                       | 7 |
      | J1 |                       | 7 |
      | H1 |                       | 5 |
      | I1 |                       | 5 |
      | J1 |                       | 5 |
    Then the label of link label should be display as following
      | 3 | 9 |  |
      | 2 | 9 |  |
      | 1 | 7 |  |
      | 2 | 7 |  |
      | 3 | 7 |  |
      | 3 | 5 |  |
      | 1 | 9 |  |
      | 1 | 5 |  |
      | 2 | 5 |  |
    #6. Expand target from A1
    When user expands target on node "5"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 4 |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 6 |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 8 |
      | B1 |                       |   |
      | C1 |                       |   |
      | D1 |                       |   |
      | M1 |                       |   |
      | L1 |                       |   |
      | K1 |                       |   |
      | H1 |                       | 9 |
      | I1 |                       | 9 |
      | J1 |                       | 9 |
      | H1 |                       | 7 |
      | I1 |                       | 7 |
      | J1 |                       | 7 |
      | H1 |                       | 5 |
      | I1 |                       | 5 |
      | J1 |                       | 5 |
      | E1 |                       |   |
      | F1 |                       |   |
      | G1 |                       |   |
    Then the label of link label should be display as following
      | 3 |  9 |  |
      | 2 |  9 |  |
      | 1 |  7 |  |
      | 2 |  7 |  |
      | 3 |  7 |  |
      | 3 |  5 |  |
      | 1 |  9 |  |
      | 1 |  5 |  |
      | 2 |  5 |  |
      | 7 | 20 |  |
      | 9 | 21 |  |
      | 9 | 19 |  |
      | 7 | 21 |  |
      | 5 | 19 |  |
      | 9 | 20 |  |
      | 7 | 19 |  |
      | 5 | 20 |  |
      | 5 | 21 |  |
    #7. Collapse sources from A1
    When user collapse source on node "5"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | L1 |                       |   |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 6 |
      | K1 |                       |   |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 8 |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 4 |
      | M1 |                       |   |
      | H1 |                       | 7 |
      | I1 |                       | 7 |
      | J1 |                       | 9 |
      | I1 |                       | 9 |
      | H1 |                       | 5 |
      | I1 |                       | 5 |
      | J1 |                       | 5 |
      | H1 |                       | 9 |
      | J1 |                       | 7 |
      | E1 |                       |   |
      | F1 |                       |   |
      | G1 |                       |   |
    Then the label of link label should be display as following
      | 7 | 20 |  |
      | 9 | 21 |  |
      | 9 | 19 |  |
      | 7 | 21 |  |
      | 5 | 19 |  |
      | 9 | 20 |  |
      | 7 | 19 |  |
      | 5 | 20 |  |
      | 5 | 21 |  |
    # 8. Collapse targets from A1
    When user collapse target on node "5"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | L1 |                       |   |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 6 |
      | K1 |                       |   |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 8 |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 4 |
      | M1 |                       |   |
      | H1 |                       | 7 |
      | I1 |                       | 7 |
      | J1 |                       | 9 |
      | I1 |                       | 9 |
      | H1 |                       | 5 |
      | I1 |                       | 5 |
      | J1 |                       | 5 |
      | H1 |                       | 9 |
      | J1 |                       | 7 |
    Then there is no link displayed
    #9. Collapse children from A1
    When user collapse children on node "5"
    Then the label of all nodes is displayed as following
      | L1 |                       |   |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 6 |
      | K1 |                       |   |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 8 |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 4 |
      | M1 |                       |   |
    Then there is no link displayed
    #10. Collapse parents from A1
    When user collapse parent on node "5"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT,TOP,BOTTOM |  |
    Then there is no link displayed

  Scenario: Data_191 - Check the display of nodes after expanding incase the node has more than one FK to another node with both lineage and containment type
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_191"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_191"
    Then the graph should be displayed
    #3. Expand source of A1
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,TOP |  |
      | B1 |          |  |
    Then the label of link label should be display as following
      | 1 | 0 |  | true |
    #4. Expand parent of A1
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,TOP | 3 |
      | B1 |          |   |
      | C1 |          |   |
    Then the label of link label should be display as following
      | 1 | 2 |  | true |

  Scenario: Data_192 - Check the display of nodes after expanding incase the node has many join table to another node with lineage and containment type
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "V100_M1"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_192"
    Then the graph should be displayed
    #3. Expand children of A1
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,BOTTOM |   |
      | D1 | RIGHT       | 0 |
    Then there is no link displayed
    #4. Expand source of A1
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,BOTTOM |   |
      | D1 |             | 0 |
    Then the label of link label should be display as following
      | 1 | 0 |  | true |

  Scenario: Data_193 - Check the display of nodes on the graph incase expand then collapse a node that both has one target node and has many parents in the same table
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_193"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_193"
    Then the graph should be displayed
    #3. Expand target (TableB) from A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,TOP |  |
      | B1 |           |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
    #4. Expand parents from A1
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,TOP | 3 |
      | A1 | RIGHT,TOP | 4 |
      | C1 |           |   |
      | C2 |           |   |
      | B1 |           |   |
    Then the label of link label should be display as following
      | 2 | 1 |  |
      | 5 | 1 |  |
    #5. Collapse target (TableB) of A1
    When user collapse target on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,TOP | 3 |
      | A1 | RIGHT,TOP | 4 |
      | C1 |           |   |
      | C2 |           |   |
    Then there is no link displayed
    #6. Collapse parents from A1
    When user collapse parent on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,TOP |  |
    Then there is no link displayed
    #7. Expand recursively parents from A1
    When user expands parent recursively on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,TOP | 3 |
      | A1 | RIGHT,TOP | 4 |
      | C1 |           |   |
      | C2 |           |   |
    Then there is no link displayed
    #8. Expand recursively targets from A1
    When user expands target recursively on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,TOP | 3 |
      | A1 | RIGHT,TOP | 4 |
      | C1 |           |   |
      | C2 |           |   |
      | B1 |           |   |
    Then the label of link label should be display as following
      | 2 | 1 |  |
      | 5 | 1 |  |

  Scenario: Data_195 - Check the display of node on the graph in case node has containment relation  (both parent and child) that is expanding from parent node then collapsing source node
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_194"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_194"
    Then the graph should be displayed
    #3. Expand targets from A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
    #4. Expand target from C
    When user expands target on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
      | F1 | TOP   |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 1 | 3 |  |
    #5. Expand parent from F
    When user expands parent on node "3"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT    |   |
      | B1 | RIGHT    |   |
      | C1 | RIGHT    |   |
      | F1 | TOP      | 4 |
      | E1 | LEFT,TOP |   |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 1 | 5 |  |
    #6. Expand parent from E
    When user expands parent on node "4"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT    |   |
      | B1 | RIGHT    |   |
      | C1 | RIGHT    |   |
      | F1 | TOP      | 8 |
      | E1 | LEFT,TOP | 6 |
      | D1 |          |   |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 1 | 7 |  |
    #7. Expand target from B
    When user expands target on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |   |
      | B1 | RIGHT |   |
      | C1 | RIGHT |   |
      | F1 | TOP   | 8 |
      | E1 | TOP   | 6 |
      | D1 |       |   |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 1 | 7 |  |
      | 2 | 8 |  |
    #8.1. Collapse target from B
    When user collapse target on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT    |   |
      | B1 | RIGHT    |   |
      | C1 | RIGHT    |   |
      | F1 | TOP      | 8 |
      | E1 | LEFT,TOP | 6 |
      | D1 |          |   |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 1 | 7 |  |
    #8.2. Collapse target from C
    When user collapse target on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |

  Scenario: Data_196 - Check the display of node on the graph. In case,expand then collapse both parent node and child node have foreign key from other node.
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_196"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_196"
    Then the graph should be displayed
    #3. Expand child from A
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,BOTTOM |   |
      | B1 | RIGHT        | 0 |
    Then there is no link displayed
    #4. Expand target from A
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,BOTTOM |   |
      | B1 | RIGHT        | 0 |
      | C1 | LEFT         |   |
    Then the label of link label should be display as following
      | 0 | 2 |  |
    #5. Expand target from B
    When user expands target on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,BOTTOM |   |
      | B1 | RIGHT        | 0 |
      | C1 |              |   |
    Then the label of link label should be display as following
      | 0 | 2 |  |
      | 1 | 2 |  |
    #6.1. Collapse target of A
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,BOTTOM |   |
      | B1 | RIGHT        | 0 |
    Then there is no link displayed
    #6.2. Collapse target of B
    When user collapse target on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,BOTTOM |   |
      | B1 | RIGHT        | 0 |
    Then there is no link displayed

  Scenario: Data_197 - Check the display of link in case the node has both containment type and lineage type to other node.
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_197"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_197"
    Then the graph should be displayed
    #3. Expand child from A
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,BOTTOM |   |
      | B1 | BOTTOM       | 0 |
    Then there is no link displayed
    #4. Expand child from B
    When user expands children on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,BOTTOM |   |
      | B1 | BOTTOM       | 0 |
      | C1 | LEFT         | 1 |
    Then there is no link displayed
    #5. Expand target from A
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,BOTTOM |   |
      | B1 | BOTTOM       | 0 |
      | C1 |              | 1 |
    Then the label of link label should be display as following
      | 0 | 2 |  |

  Scenario: Data_198 - Check the display of graph in case configuring both lineage and container relation on the graph .
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_198"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_198"
    Then the graph should be displayed
    #3. Expand parent from A
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,TOP | 2 |
      | B1 | TOP      |   |
    Then there is no link displayed
    #4. Expand parent from B
    When user expands parent on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,TOP | 4 |
      | B1 | TOP      | 5 |
      | E1 | RIGHT    |   |
    Then there is no link displayed
    #5. Expand target from E
    When user expands target on node "5"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | TOP   | 4 |
      | B1 | TOP   | 5 |
      | E1 | RIGHT |   |
    Then the label of link label should be display as following
      | 5 | 3 |  |

  Scenario: Data_199 - Check the display of graph in case three nodes have container relation that is expanded from the same node.
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_199"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_199"
    Then the graph should be displayed
    #3. Expand target from A
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |   |
      | B1 |       | 2 |
      | B2 |       | 3 |
      | B3 |       |   |
    Then the label of link label should be display as following
      | 0 | 3 |  |
      | 0 | 1 |  |
      | 0 | 2 |  |
