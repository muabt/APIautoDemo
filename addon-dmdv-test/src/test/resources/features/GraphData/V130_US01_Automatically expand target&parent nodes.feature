#Author: tbui@tibco.com
@DMDV130
Feature: Test graph data with configuration

  Background: 
    Given I login to EBX succesfully

  Scenario: US01-03 - Check the data graph with auto expand the node that node has one source/target/parent/child
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-03"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-03"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 1 |
      | C1 |                       |   |
      | E1 |                       |   |
    Then the label of link label should be display as following
      | 0 | 2 |  |
    #5. Choose node and expand source
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 1 |
      | C1 |                       |   |
      | E1 |                       |   |
      | B1 |                       |   |
    Then the label of link label should be display as following
      | 0 | 2 |  |
      | 3 | 0 |  |
    #6. Choose node and expand child
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 1 |
      | C1 |                       |   |
      | E1 |                       |   |
      | B1 |                       |   |
      | D1 |                       | 0 |
    Then the label of link label should be display as following
      | 0 | 2 |  |
      | 3 | 0 |  |

  Scenario: US01-04 - Check the data graph with auto expand the node that node has many sources/targets/parents/children
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-04"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-04"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | E  |                       |   |
      | C  |                       |   |
      | C1 |                       |   |
      | C2 |                       |   |
      | E1 |                       |   |
      | E2 |                       |   |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 0 |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 4 |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 5 |
    Then the label of link label should be display as following
      | 7 | 1 |  |
      | 6 | 3 |  |
      | 6 | 2 |  |
      | 8 | 1 |  |
      | 8 | 3 |  |
      | 7 | 2 |  |
      | 7 | 3 |  |
      | 6 | 1 |  |
      | 8 | 2 |  |
    #5. Collapse target node
    When user collapse target on node "6"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | E  |                       |   |
      | E1 |                       |   |
      | E2 |                       |   |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 0 |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 4 |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 5 |
    Then there is no link displayed
    #6. Collapse parent node
    When user collapse parent on node "6"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT,TOP,BOTTOM |  |
    Then there is no link displayed
    #7. Expand recursively source node
    When user expands source recursively on node "9"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | B  |                       |  |
      | B1 |                       |  |
      | B2 |                       |  |
      | A1 | LEFT,RIGHT,TOP,BOTTOM |  |
    Then the label of link label should be display as following
      | 10 | 9 |  |
      | 12 | 9 |  |
      | 11 | 9 |  |
    #8. Expand recursively target node
    When user expands target recursively on node "9"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | B  |                       |  |
      | B1 |                       |  |
      | B2 |                       |  |
      | A1 | LEFT,RIGHT,TOP,BOTTOM |  |
      | C  |                       |  |
      | C1 |                       |  |
      | C2 |                       |  |
    Then the label of link label should be display as following
      | 10 | 9 |  |
      | 12 | 9 |  |
      | 11 | 9 |  |
      |  9 | 1 |  |
      |  9 | 3 |  |
      |  9 | 2 |  |
    #9. Expand recursively parent node
    When user expands parent recursively on node "9"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | B  |                       |   |
      | B1 |                       |   |
      | B2 |                       |   |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 0 |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 4 |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 5 |
      | C  |                       |   |
      | C1 |                       |   |
      | C2 |                       |   |
      | E  |                       |   |
      | E1 |                       |   |
      | E2 |                       |   |
    Then the label of link label should be display as following
      |  6 | 3 |  |
      | 12 | 6 |  |
      | 11 | 7 |  |
      |  8 | 1 |  |
      |  8 | 3 |  |
      |  7 | 3 |  |
      | 11 | 8 |  |
      |  8 | 2 |  |
      | 12 | 8 |  |
      | 11 | 6 |  |
      | 10 | 8 |  |
      |  7 | 1 |  |
      | 12 | 7 |  |
      |  6 | 2 |  |
      | 10 | 6 |  |
      |  7 | 2 |  |
      |  6 | 1 |  |
      | 10 | 7 |  |
    #10. Expand recursively children node
    When user expands children recursively on node "6"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | B  |                       |   |
      | B1 |                       |   |
      | B2 |                       |   |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 0 |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 4 |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 5 |
      | C  |                       |   |
      | C1 |                       |   |
      | C2 |                       |   |
      | E  |                       |   |
      | E1 |                       |   |
      | E2 |                       |   |
      | D  |                       | 6 |
      | D1 |                       | 6 |
      | D2 |                       | 6 |
      | D  |                       | 7 |
      | D1 |                       | 7 |
      | D2 |                       | 7 |
      | D  |                       | 8 |
      | D1 |                       | 8 |
      | D2 |                       | 8 |
    Then the label of link label should be display as following
      |  6 | 3 |  |
      | 12 | 6 |  |
      | 11 | 7 |  |
      |  8 | 1 |  |
      |  8 | 3 |  |
      |  7 | 3 |  |
      | 11 | 8 |  |
      |  8 | 2 |  |
      | 12 | 8 |  |
      | 11 | 6 |  |
      | 10 | 8 |  |
      |  7 | 1 |  |
      | 12 | 7 |  |
      |  6 | 2 |  |
      | 10 | 6 |  |
      |  7 | 2 |  |
      |  6 | 1 |  |
      | 10 | 7 |  |

  Scenario: US01-05 - Check the data graph with auto expand the node that node has one source/parent
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-03"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-05"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | E1 |          |   |
      | A1 | LEFT,TOP | 1 |
    Then there is no link displayed
    #5. Choose node and expand source
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | E1 |          |   |
      | A1 | LEFT,TOP | 1 |
      | B1 |          |   |
    Then the label of link label should be display as following
      | 2 | 0 |  |

  Scenario: US01-06 - Check the data graph with auto expand the node that node has one source/child
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-03"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-06"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,BOTTOM |  |
    Then there is no link displayed
    #5. Choose node and expand source
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,BOTTOM |  |
      | B1 |             |  |
    Then the label of link label should be display as following
      | 1 | 0 |  |
    #6. Choose node and expand child
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,BOTTOM |   |
      | B1 |             |   |
      | D1 |             | 0 |
    Then the label of link label should be display as following
      | 1 | 0 |  |

  Scenario: US01-07 - Check the data graph with auto expand the node that node has one target/parent
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-03"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-07"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,TOP | 1 |
      | C1 |           |   |
      | E1 |           |   |
    Then the label of link label should be display as following
      | 0 | 2 |  |
    #5. Collapse target node
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,TOP | 1 |
      | E1 |           |   |
    Then there is no link displayed
    #6. Collapse parent node
    When user collapse parent on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,TOP |  |
    Then there is no link displayed

  Scenario: US01-08 - Check the data graph with auto expand the node that node has one target/child
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-03"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-08"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,BOTTOM |  |
      | C1 |              |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
    #5. Collapse target node
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,BOTTOM |  |
    Then there is no link displayed
    #6. Expand child node
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,BOTTOM |   |
      | D1 |              | 0 |
    Then there is no link displayed

  Scenario: US01-09 - Check the data graph without auto expand the node that node has one source/target/parent/child
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-03"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-09"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT,TOP,BOTTOM |  |
    Then there is no link displayed

  Scenario: US01-10 - Check the data graph without auto expand the node that node has many sources/targets/parents/children
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-04"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-10"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT,TOP,BOTTOM |  |
    Then there is no link displayed
    #5. Expand source node
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | B  |                       |  |
      | B1 |                       |  |
      | B2 |                       |  |
      | A1 | LEFT,RIGHT,TOP,BOTTOM |  |
    Then the label of link label should be display as following
      | 1 | 0 |  |
      | 3 | 0 |  |
      | 2 | 0 |  |
    #6. Expand target node
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | B  |                       |  |
      | B1 |                       |  |
      | B2 |                       |  |
      | A1 | LEFT,RIGHT,TOP,BOTTOM |  |
      | C  |                       |  |
      | C1 |                       |  |
      | C2 |                       |  |
    Then the label of link label should be display as following
      | 1 | 0 |  |
      | 3 | 0 |  |
      | 2 | 0 |  |
      | 0 | 4 |  |
      | 0 | 5 |  |
      | 0 | 6 |  |
    #7. Expand parent node
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | B  |                       |   |
      | B1 |                       |   |
      | B2 |                       |   |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 7 |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 8 |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 9 |
      | C  |                       |   |
      | C1 |                       |   |
      | C2 |                       |   |
      | E  |                       |   |
      | E1 |                       |   |
      | E2 |                       |   |
    Then the label of link label should be display as following
      | 10 |  5 |  |
      |  3 | 10 |  |
      |  2 | 11 |  |
      | 12 |  4 |  |
      | 12 |  5 |  |
      | 11 |  5 |  |
      |  2 | 12 |  |
      | 12 |  6 |  |
      |  3 | 12 |  |
      |  1 | 12 |  |
      |  2 | 10 |  |
      | 11 |  4 |  |
      |  3 | 11 |  |
      | 10 |  6 |  |
      |  1 | 10 |  |
      | 11 |  6 |  |
      | 10 |  4 |  |
      |  1 | 11 |  |
    #8. Expand children node
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | B  |                       |   |
      | B1 |                       |   |
      | B2 |                       |   |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 7 |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 8 |
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 9 |
      | C  |                       |   |
      | C1 |                       |   |
      | C2 |                       |   |
      | E  |                       |   |
      | E1 |                       |   |
      | E2 |                       |   |
    Then the label of link label should be display as following
      | 10 |  5 |  |
      |  3 | 10 |  |
      |  2 | 11 |  |
      | 12 |  4 |  |
      | 12 |  5 |  |
      | 11 |  5 |  |
      |  2 | 12 |  |
      | 12 |  6 |  |
      |  3 | 12 |  |
      |  1 | 12 |  |
      |  2 | 10 |  |
      | 11 |  4 |  |
      |  3 | 11 |  |
      | 10 |  6 |  |
      |  1 | 10 |  |
      | 11 |  6 |  |
      | 10 |  4 |  |
      |  1 | 11 |  |

  Scenario: US01-11 - Check the data graph without auto expand the node that node has one source/parent
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-03"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-11"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,TOP |  |
    Then there is no link displayed
    #5. Expand source node
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,TOP |  |
      | B1 |          |  |
    Then the label of link label should be display as following
      | 1 | 0 |  |
    #6. Expand parent node
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,TOP | 3 |
      | B1 |          |   |
      | E1 |          |   |
    Then the label of link label should be display as following
      | 1 | 2 |  |

  Scenario: US01-12 - Check the data graph without auto expand the node that node has one source/child
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-03"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-12"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,BOTTOM |  |
    Then there is no link displayed
    #5. Expand child node
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,BOTTOM |   |
      | D1 |             | 0 |
    Then there is no link displayed

  Scenario: US01-13 - Check the data graph without auto expand the node that node has one target/parent
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-03"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-13"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,TOP |  |
    Then there is no link displayed
    #5. Expand target node
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,TOP |  |
      | C1 |           |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |

  Scenario: US01-14 - Check the data graph without auto expand the node that node has one target/child
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-03"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-14"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,BOTTOM |  |
    Then there is no link displayed

  Scenario: US01-15 - Check the data graph with auto expand the node that node has one target
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-03"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-15"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
      | C1 |       |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |

  Scenario: US01-16 - Check the data graph with auto expand the node that node has one source
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-03"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-16"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT |  |
    Then there is no link displayed

  Scenario: US01-17 - Check the data graph with auto expand the node that node has one target/source
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-03"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-17"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | C1 |            |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
    #5. Collapse target node
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
    Then there is no link displayed
    #6. Expand target node
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | C1 |            |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |

  Scenario: US01-18 - Check the data graph with auto expand the node that node has many targets/sources
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-04"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-18"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | C  |            |  |
      | C1 |            |  |
      | C2 |            |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 0 | 3 |  |
    #5. Expand source node
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | C  |            |  |
      | C1 |            |  |
      | C2 |            |  |
      | B  |            |  |
      | B2 |            |  |
      | B1 |            |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 0 | 3 |  |
      | 4 | 0 |  |
      | 5 | 0 |  |
      | 6 | 0 |  |

  Scenario: US01-19 - Check the data graph with auto expand the node that node has many targets
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-04"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-19"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
      | C  |       |  |
      | C1 |       |  |
      | C2 |       |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 0 | 3 |  |
    #5. Collapse target node
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
    Then there is no link displayed
    #6. Expand target node
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
      | C  |       |  |
      | C1 |       |  |
      | C2 |       |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 0 | 3 |  |

  Scenario: US01-20 - Check the data graph with auto expand the node that node has many sources
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-04"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-20"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT |  |
    Then there is no link displayed
    #5. Expand source node
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT |  |
      | B  |      |  |
      | B1 |      |  |
      | B2 |      |  |
    Then the label of link label should be display as following
      | 1 | 0 |  |
      | 2 | 0 |  |
      | 3 | 0 |  |

  Scenario: US01-21 - Check the data graph without auto expand the node that node has one target
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-03"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-21"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
    Then there is no link displayed

  Scenario: US01-22 - Check the data graph without auto expand the node that node has one source
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-03"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-22"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT |  |
    Then there is no link displayed

  Scenario: US01-23 - Check the data graph without auto expand the node that node has one target/source
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-03"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-23"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
    Then there is no link displayed
    #5. Expand target node
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | C1 |            |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |
    #6. Collapse target node
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
    Then there is no link displayed

  Scenario: US01-24 - Check the data graph without expand the node has many targets/sources
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-04"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-24"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
    Then there is no link displayed
    #5. Expand source node
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT |  |
      | B  |            |  |
      | B1 |            |  |
      | B2 |            |  |
    Then the label of link label should be display as following
      | 1 | 0 |  |
      | 2 | 0 |  |
      | 3 | 0 |  |

  Scenario: US01-25 - Check the data graph without auto expand the node that node has many targets
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-04"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-25"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
    Then there is no link displayed

  Scenario: US01-26 - Check the data graph without auto expand the node that node has many sources
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-04"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-26"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT |  |
    Then there is no link displayed
    #5. Expand source node
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT |  |
      | B  |      |  |
      | B1 |      |  |
      | B2 |      |  |
    Then the label of link label should be display as following
      | 1 | 0 |  |
      | 2 | 0 |  |
      | 3 | 0 |  |

  Scenario: US01-27 - Check the data graph without auto expand the node that node has target with 20 levels
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-27"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-27"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
    Then there is no link displayed
    #5. Recursively expand target node A1
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
      | 1 | 2 |  |
      | 2 | 4 |  |
      | 0 | 1 |  |
      | 4 | 5 |  |
      | 5 | 3 |  |
    #6. Recursively expand target node F1
    When user expands target recursively on node "3"
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
      |  1 |  2 |  |
      |  2 |  4 |  |
      |  0 |  1 |  |
      |  4 |  5 |  |
      |  5 |  3 |  |
      |  6 |  9 |  |
      |  7 |  6 |  |
      | 10 |  8 |  |
      |  3 |  7 |  |
      |  9 | 10 |  |
    #7. Recursively expand target node K1
    When user expands target recursively on node "8"
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
      |  1 |  2 |  |
      |  2 |  4 |  |
      |  0 |  1 |  |
      |  4 |  5 |  |
      |  5 |  3 |  |
      |  6 |  9 |  |
      |  7 |  6 |  |
      | 10 |  8 |  |
      |  3 |  7 |  |
      |  9 | 10 |  |
      | 15 | 14 |  |
      |  8 | 11 |  |
      | 11 | 13 |  |
      | 12 | 15 |  |
      | 13 | 12 |  |
    #8. Recursively expand target node P1
    When user expands target recursively on node "14"
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
      | V1 |       |  |
    Then the label of link label should be display as following
      |  1 |  2 |  |
      |  2 |  4 |  |
      |  0 |  1 |  |
      |  4 |  5 |  |
      |  5 |  3 |  |
      |  6 |  9 |  |
      |  7 |  6 |  |
      | 10 |  8 |  |
      |  3 |  7 |  |
      |  9 | 10 |  |
      | 15 | 14 |  |
      |  8 | 11 |  |
      | 11 | 13 |  |
      | 12 | 15 |  |
      | 13 | 12 |  |
      | 20 | 18 |  |
      | 18 | 16 |  |
      | 17 | 20 |  |
      | 14 | 17 |  |
      | 16 | 19 |  |

  Scenario: US01-28 - Check the data graph without auto expand the node that node has target with > 20 levels
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-27"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-28"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
    Then there is no link displayed
    #5. Recursively expand target node A1
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
      | 1 | 2 |  |
      | 2 | 4 |  |
      | 0 | 1 |  |
      | 4 | 5 |  |
      | 5 | 3 |  |
    #6. Recursively expand target node F1
    When user expands target recursively on node "3"
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
      |  1 |  2 |  |
      |  2 |  4 |  |
      |  0 |  1 |  |
      |  4 |  5 |  |
      |  5 |  3 |  |
      |  6 |  9 |  |
      |  7 |  6 |  |
      | 10 |  8 |  |
      |  3 |  7 |  |
      |  9 | 10 |  |
    #7. Recursively expand target node K1
    When user expands target recursively on node "8"
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
      |  1 |  2 |  |
      |  2 |  4 |  |
      |  0 |  1 |  |
      |  4 |  5 |  |
      |  5 |  3 |  |
      |  6 |  9 |  |
      |  7 |  6 |  |
      | 10 |  8 |  |
      |  3 |  7 |  |
      |  9 | 10 |  |
      | 15 | 14 |  |
      |  8 | 11 |  |
      | 11 | 13 |  |
      | 12 | 15 |  |
      | 13 | 12 |  |
    #8. Recursively expand target node P1
    When user expands target recursively on node "14"
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
      |  1 |  2 |  |
      |  2 |  4 |  |
      |  0 |  1 |  |
      |  4 |  5 |  |
      |  5 |  3 |  |
      |  6 |  9 |  |
      |  7 |  6 |  |
      | 10 |  8 |  |
      |  3 |  7 |  |
      |  9 | 10 |  |
      | 15 | 14 |  |
      |  8 | 11 |  |
      | 11 | 13 |  |
      | 12 | 15 |  |
      | 13 | 12 |  |
      | 20 | 18 |  |
      | 18 | 16 |  |
      | 17 | 20 |  |
      | 14 | 17 |  |
      | 16 | 19 |  |
    #8. Recursively expand target node V1
    When user expands target recursively on node "19"
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
      | X1 | RIGHT |  |
      | S1 | RIGHT |  |
      | Z1 |       |  |
    Then the label of link label should be display as following
      |  1 |  2 |  |
      |  2 |  4 |  |
      |  0 |  1 |  |
      |  4 |  5 |  |
      |  5 |  3 |  |
      |  6 |  9 |  |
      |  7 |  6 |  |
      | 10 |  8 |  |
      |  3 |  7 |  |
      |  9 | 10 |  |
      | 15 | 14 |  |
      |  8 | 11 |  |
      | 11 | 13 |  |
      | 12 | 15 |  |
      | 13 | 12 |  |
      | 20 | 18 |  |
      | 18 | 16 |  |
      | 17 | 20 |  |
      | 14 | 17 |  |
      | 16 | 19 |  |
      | 23 | 21 |  |
      | 22 | 23 |  |
      | 19 | 22 |  |

  Scenario: US01-29 - Check the data graph with auto expand the node that node has one parent
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-03"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-29"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | TOP | 1 |
      | E1 |     |   |
    Then there is no link displayed
    #5. Collapse parent node A1
    When user collapse parent on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | TOP |  |
    Then there is no link displayed
    #6. Expand parent node A1
    When user expands parent on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | TOP | 1 |
      | E1 |     |   |
    Then there is no link displayed

  Scenario: US01-30 - Check the data graph with auto expand the node that node has one child
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-03"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-30"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | BOTTOM |  |
    Then there is no link displayed
    #5. Expand child node
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | BOTTOM |   |
      | D1 |        | 0 |
    Then there is no link displayed

  Scenario: US01-31 - Check the data graph with auto expand the node that node has one parent/child
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-03"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-31"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | TOP,BOTTOM | 1 |
      | B1 |            |   |
    Then there is no link displayed
    #5. Collapse parent node
    When user collapse parent on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | TOP,BOTTOM |  |
    Then there is no link displayed
    #6. Expand parent node
    When user expands parent on node "2"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | TOP,BOTTOM | 1 |
      | B1 |            |   |
    Then there is no link displayed
    #7. Expand child node
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | TOP,BOTTOM | 1 |
      | B1 |            |   |
      | D1 |            | 0 |
    Then there is no link displayed

  Scenario: US01-32 - Check the data graph with auto expand the node that node has many parents
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-04"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-32"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | TOP | 0 |
      | E  |     |   |
      | A1 | TOP | 1 |
      | E1 |     |   |
      | A1 | TOP | 2 |
      | E2 |     |   |
    Then there is no link displayed
    #5. Collapse parent node
    When user collapse parent on node "3"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | TOP |  |
    Then there is no link displayed
    #6. Expand parent node
    When user expands parent on node "6"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | TOP | 0 |
      | E  |     |   |
      | A1 | TOP | 1 |
      | E1 |     |   |
      | A1 | TOP | 2 |
      | E2 |     |   |
    Then there is no link displayed

  Scenario: US01-33 - Check the data graph with auto expand the node that node has many children
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-04"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-33"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | BOTTOM |  |
    Then there is no link displayed
    #5. Expand children node
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | BOTTOM |   |
      | D  |        | 0 |
      | D1 |        | 0 |
      | D2 |        | 0 |
    Then there is no link displayed

  Scenario: US01-34 - Check the data graph with auto expand the node that node has many parents/children
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-04"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-34"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | TOP,BOTTOM | 0 |
      | E  |            |   |
      | A1 | TOP,BOTTOM | 1 |
      | E1 |            |   |
      | A1 | TOP,BOTTOM | 2 |
      | E2 |            |   |
    Then there is no link displayed
    #5. Collapse parent node
    When user collapse parent on node "3"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | TOP,BOTTOM |  |
    Then there is no link displayed
    #6. Expand parent node
    When user expands parent on node "6"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | TOP,BOTTOM | 0 |
      | E  |            |   |
      | A1 | TOP,BOTTOM | 1 |
      | E1 |            |   |
      | A1 | TOP,BOTTOM | 2 |
      | E2 |            |   |
    Then there is no link displayed
    #7. Expand children node
    When user expands children on node "3"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | E  |            |   |
      | E2 |            |   |
      | E1 |            |   |
      | A1 | TOP,BOTTOM | 0 |
      | A1 | TOP,BOTTOM | 1 |
      | A1 | TOP,BOTTOM | 2 |
      | D2 |            | 5 |
      | D1 |            | 5 |
      | D  |            | 5 |
      | D  |            | 3 |
      | D2 |            | 4 |
      | D1 |            | 4 |
      | D  |            | 4 |
      | D2 |            | 3 |
      | D1 |            | 3 |
    Then there is no link displayed

  Scenario: US01-35 - Check the data graph with the model that the node has target with 20 levels
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-27"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-35"
    Then the graph should be displayed
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
      | V1 |       |  |
    Then the label of link label should be display as following
      |  1 |  7 |  |
      | 11 | 14 |  |
      | 16 | 13 |  |
      |  5 |  6 |  |
      | 10 | 11 |  |
      |  8 |  5 |  |
      | 20 | 18 |  |
      | 15 |  4 |  |
      | 18 |  0 |  |
      |  4 |  3 |  |
      |  2 |  1 |  |
      | 14 | 15 |  |
      |  3 |  2 |  |
      | 17 | 20 |  |
      | 13 | 17 |  |
      |  7 |  8 |  |
      |  6 | 12 |  |
      |  0 | 19 |  |
      |  9 | 16 |  |
      | 12 |  9 |  |
    #5. Collapse target node level 19 (U1)
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
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
    Then the label of link label should be display as following
      |  1 |  7 |  |
      | 11 | 14 |  |
      | 16 | 13 |  |
      |  5 |  6 |  |
      | 10 | 11 |  |
      |  8 |  5 |  |
      | 20 | 18 |  |
      | 15 |  4 |  |
      | 18 |  0 |  |
      |  4 |  3 |  |
      |  2 |  1 |  |
      | 14 | 15 |  |
      |  3 |  2 |  |
      | 17 | 20 |  |
      | 13 | 17 |  |
      |  7 |  8 |  |
      |  6 | 12 |  |
      |  9 | 16 |  |
      | 12 |  9 |  |

  Scenario: US01-36 - Check the data graph with auto expand the node that node has parent with 20 levels
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-27"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-36"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | Q1 | TOP |  1 |
      | P1 | TOP |  0 |
      | G1 | TOP |  4 |
      | O1 | TOP |  2 |
      | I1 | TOP |  7 |
      | K1 | TOP |  9 |
      | J1 | TOP |  8 |
      | H1 | TOP |  6 |
      | R1 | TOP | 11 |
      | D1 | TOP | 13 |
      | C1 | TOP | 12 |
      | T1 | TOP | 10 |
      | L1 | TOP | 15 |
      | N1 | TOP |  5 |
      | B1 | TOP | 14 |
      | F1 | TOP |  3 |
      | E1 | TOP | 18 |
      | U1 | TOP | 19 |
      | M1 | TOP | 16 |
      | V1 |     |    |
      | A1 | TOP | 17 |
    Then there is no link displayed
    #5. Collapse parent node level 19
    When user collapse parent on node "11"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | U1 | TOP |    |
      | P1 | TOP | 23 |
      | A1 | TOP | 25 |
      | D1 | TOP | 27 |
      | I1 | TOP | 29 |
      | R1 | TOP | 21 |
      | C1 | TOP | 26 |
      | T1 | TOP | 30 |
      | H1 | TOP | 28 |
      | Q1 | TOP | 32 |
      | M1 | TOP | 35 |
      | K1 | TOP | 37 |
      | L1 | TOP | 34 |
      | N1 | TOP | 38 |
      | B1 | TOP | 31 |
      | J1 | TOP | 36 |
      | E1 | TOP | 39 |
      | F1 | TOP | 40 |
      | O1 | TOP | 22 |
      | G1 | TOP | 33 |
    Then there is no link displayed

  Scenario: US01-37 - Check the data graph with auto expand the node that node has target with > 20 levels
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-27"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-37"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | U1 | RIGHT |  |
      | H1 | RIGHT |  |
      | G1 | RIGHT |  |
      | F1 | RIGHT |  |
      | E1 | RIGHT |  |
      | K1 | RIGHT |  |
      | L1 | RIGHT |  |
      | I1 | RIGHT |  |
      | J1 | RIGHT |  |
      | N1 | RIGHT |  |
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | M1 | RIGHT |  |
      | P1 | RIGHT |  |
      | C1 | RIGHT |  |
      | D1 | RIGHT |  |
      | O1 | RIGHT |  |
      | Q1 | RIGHT |  |
      | R1 | RIGHT |  |
      | V1 | RIGHT |  |
      | T1 | RIGHT |  |
    Then the label of link label should be display as following
      |  1 |  7 |  |
      | 11 | 14 |  |
      | 16 | 13 |  |
      |  5 |  6 |  |
      | 10 | 11 |  |
      |  8 |  5 |  |
      | 20 | 18 |  |
      | 15 |  4 |  |
      | 18 |  0 |  |
      |  4 |  3 |  |
      |  2 |  1 |  |
      | 14 | 15 |  |
      |  3 |  2 |  |
      | 17 | 20 |  |
      | 13 | 17 |  |
      |  7 |  8 |  |
      |  6 | 12 |  |
      |  0 | 19 |  |
      |  9 | 16 |  |
      | 12 |  9 |  |
    #5. Expand target node of level 20 (V1)
    When user expands target on node "19"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | U1 | RIGHT |  |
      | H1 | RIGHT |  |
      | G1 | RIGHT |  |
      | F1 | RIGHT |  |
      | E1 | RIGHT |  |
      | K1 | RIGHT |  |
      | L1 | RIGHT |  |
      | I1 | RIGHT |  |
      | J1 | RIGHT |  |
      | N1 | RIGHT |  |
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | M1 | RIGHT |  |
      | P1 | RIGHT |  |
      | C1 | RIGHT |  |
      | D1 | RIGHT |  |
      | O1 | RIGHT |  |
      | Q1 | RIGHT |  |
      | R1 | RIGHT |  |
      | V1 | RIGHT |  |
      | T1 | RIGHT |  |
      | X1 | RIGHT |  |
      | S1 | RIGHT |  |
      | Z1 |       |  |
    Then the label of link label should be display as following
      |  1 |  7 |  |
      | 11 | 14 |  |
      | 16 | 13 |  |
      |  5 |  6 |  |
      | 10 | 11 |  |
      |  8 |  5 |  |
      | 20 | 18 |  |
      | 15 |  4 |  |
      | 18 |  0 |  |
      |  4 |  3 |  |
      |  2 |  1 |  |
      | 14 | 15 |  |
      |  3 |  2 |  |
      | 17 | 20 |  |
      | 13 | 17 |  |
      |  7 |  8 |  |
      |  6 | 12 |  |
      |  0 | 19 |  |
      |  9 | 16 |  |
      | 12 |  9 |  |
      | 23 | 21 |  |
      | 22 | 23 |  |
      | 19 | 22 |  |

  Scenario: US01-39 - Check the data graph without auto expand the node that node has one parent
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-03"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-39"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | TOP |  |
    Then there is no link displayed
    #5. Expand parent node
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | TOP | 2 |
      | E1 |     |   |
    Then there is no link displayed

  Scenario: US01-40 - Check the data graph without auto expand the node that node has one child
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-03"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-40"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | BOTTOM |  |
    Then there is no link displayed
    #5. Expand child node
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | BOTTOM |   |
      | D1 |        | 0 |
    Then there is no link displayed

  Scenario: US01-41 - Check the data graph without auto expand the node that node has one parent/child
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-03"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-41"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | TOP,BOTTOM |  |
    Then there is no link displayed
    #5. Expand parent node
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | TOP,BOTTOM | 2 |
      | B1 |            |   |
    Then there is no link displayed
    #6. Expand child node
    When user expands children on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | TOP,BOTTOM | 2 |
      | B1 |            |   |
      | D1 |            | 1 |
    Then there is no link displayed

  Scenario: US01-42 - Check the data graph without auto expand the node that node has many parents
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-04"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-42"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | TOP |  |
    Then there is no link displayed
    #5. Expand parent node
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | TOP | 1 |
      | A1 | TOP | 2 |
      | A1 | TOP | 3 |
      | E  |     |   |
      | E1 |     |   |
      | E2 |     |   |
    Then there is no link displayed

  Scenario: US01-43 - Check the data graph without auto expand the node that node has many children
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-04"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-43"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | BOTTOM |  |
    Then there is no link displayed
    #5. Expand children node
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | BOTTOM |   |
      | D  |        | 0 |
      | D1 |        | 0 |
      | D2 |        | 0 |
    Then there is no link displayed

  Scenario: US01-44 - Check the data graph without auto expand the node that node has many parents/children
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-04"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-44"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | TOP,BOTTOM |  |
    Then there is no link displayed
    #5. Expand children node
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | TOP,BOTTOM |   |
      | D  |            | 0 |
      | D1 |            | 0 |
      | D2 |            | 0 |
    Then there is no link displayed

  Scenario: US01-46 - Check the data graph without auto expand the node that node has parent with 20 levels
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-27"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-46"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | TOP |  |
    Then there is no link displayed
    #5.  Recursively expand parent node A1
    When user expands parent recursively on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | D1 | TOP | 2 |
      | F1 | TOP |   |
      | A1 | TOP | 5 |
      | E1 | TOP | 3 |
      | C1 | TOP | 1 |
      | B1 | TOP | 6 |
    Then there is no link displayed
    #6.  Recursively expand parent node F1
    When user expands parent recursively on node "3"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | E1 | TOP |  8 |
      | B1 | TOP | 10 |
      | I1 | TOP | 12 |
      | H1 | TOP | 11 |
      | F1 | TOP | 14 |
      | C1 | TOP | 15 |
      | K1 | TOP |    |
      | J1 | TOP | 16 |
      | D1 | TOP |  7 |
      | G1 | TOP | 13 |
      | A1 | TOP |  9 |
    Then there is no link displayed
    #7.  Recursively expand parent node K1
    When user expands parent recursively on node "16"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | O1 | TOP | 19 |
      | D1 | TOP | 21 |
      | M1 | TOP | 23 |
      | F1 | TOP | 25 |
      | A1 | TOP | 27 |
      | L1 | TOP | 22 |
      | G1 | TOP | 29 |
      | I1 | TOP | 31 |
      | C1 | TOP | 20 |
      | E1 | TOP | 24 |
      | J1 | TOP | 33 |
      | P1 | TOP |    |
      | N1 | TOP | 18 |
      | K1 | TOP | 28 |
      | H1 | TOP | 30 |
      | B1 | TOP | 32 |
    Then there is no link displayed
    #8.  Recursively expand parent node P1
    When user expands parent recursively on node "19"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | U1 | TOP |    |
      | P1 | TOP | 36 |
      | A1 | TOP | 38 |
      | D1 | TOP | 40 |
      | I1 | TOP | 42 |
      | R1 | TOP | 34 |
      | C1 | TOP | 39 |
      | T1 | TOP | 43 |
      | H1 | TOP | 41 |
      | Q1 | TOP | 45 |
      | M1 | TOP | 48 |
      | K1 | TOP | 50 |
      | L1 | TOP | 47 |
      | N1 | TOP | 51 |
      | B1 | TOP | 44 |
      | J1 | TOP | 49 |
      | E1 | TOP | 52 |
      | F1 | TOP | 53 |
      | O1 | TOP | 35 |
      | G1 | TOP | 46 |
    Then there is no link displayed

  Scenario: US01-49 - Check the data graph with the model that the node has parent with many level and "Display parent/target node automatically" with Yes and No
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-49"
    And I access table "TableD"
    And user views "Visualization>Display data using configuration" of record has ID is "D1"
    And user generates graph with configuration "V130_US01-49"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | C1 | TOP |   |
      | D1 | TOP | 1 |
    Then there is no link displayed
    #5.  Choose TableC and expand parent
    When user expands parent on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | C1 | TOP | 3 |
      | D1 | TOP | 2 |
      | A1 |     |   |
      | B1 | TOP | 5 |
    Then there is no link displayed

  Scenario: US01-50 - Check the data graph with the model that the node has target with many level and "Display parent/target node automatically" with Yes and No
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-49"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "V130_US01-50"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
    Then the label of link label should be display as following
      | 1 | 0 |  |
    #5.  Choose TableB and expand target
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT |  |
      | B1 | RIGHT |  |
      | C1 | RIGHT |  |
      | D1 |       |  |
    Then the label of link label should be display as following
      | 1 | 0 |  |
      | 0 | 3 |  |
      | 3 | 2 |  |

  Scenario Outline: US01-53 Check the data graph run from Perspective with service "Display data using configuration" that has expanded by default and graph configuration with auto expand
    Given user accesses select perspective menu
    Given user accesses perspective "<perspectivename>"
    And user select action "<actionname>"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 8 |
      | K1 |                       | 7 |
      | L1 |                       |   |
      | X1 |                       |   |
      | B1 | RIGHT                 |   |
      | C1 | RIGHT                 |   |
      | D1 | RIGHT                 |   |
      | E1 | RIGHT                 |   |
      | F1 | RIGHT                 |   |
      | G1 | RIGHT                 |   |
      | H1 | RIGHT                 |   |
      | I1 | RIGHT                 |   |
      | J1 |                       |   |
    Then the label of link label should be display as following
      |  7 |  2 |  |
      |  0 |  9 |  |
      |  2 |  3 |  |
      |  1 |  0 |  |
      |  3 |  5 |  |
      |  4 |  1 |  |
      |  9 | 10 |  |
      |  5 |  6 |  |
      |  6 |  4 |  |
      | 11 |  7 |  |

    Examples: 
      | perspectivename | actionname                                                            |
      | V130_US01       | Node has expanded by default and graph configuration with auto expand |

  Scenario Outline: US01-54 Check the data graph run from Perspective with service "Display data using configuration" that hasn't expanded by default and graph configuration without auto expand
    Given user accesses select perspective menu
    Given user accesses perspective "<perspectivename>"
    And user select action "<actionname>"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT,TOP,BOTTOM |  |
    Then there is no link displayed

    Examples: 
      | perspectivename | actionname                                                                   |
      | V130_US01       | Node has not expanded by default and graph configuration without auto expand |

  Scenario Outline: US01-55 Check the data graph run from Perspective with service "Display data using configuration" that hasn't expanded by default and graph configuration with auto expand
    Given user accesses select perspective menu
    Given user accesses perspective "<perspectivename>"
    And user select action "<actionname>"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 5 |
      | B1 |                       |   |
      | C1 |                       |   |
      | D1 |                       | 4 |
      | E1 |                       |   |
    Then the label of link label should be display as following
      | 4 | 1 |  |
      | 2 | 4 |  |

    Examples: 
      | perspectivename | actionname                                                               |
      | V130_US01       | Node has expanded by default and graph configuration without auto expand |

  Scenario Outline: US01-56 Check the data graph run from Perspective with service "Display data using configuration" that has expanded by default and graph configuration without auto expand
    Given user accesses select perspective menu
    Given user accesses perspective "<perspectivename>"
    And user select action "<actionname>"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 1 |
      | E1 |                       |   |
      | C1 |                       |   |
    Then the label of link label should be display as following
      | 0 | 2 |  |

    Examples: 
      | perspectivename | actionname                                                                |
      | V130_US01       | Node has not expanded by default and graph configuration with auto expand |

    Scenario Outline: US01-57 Check the data graph run from Workflow with service "Display data using configuration" that has expanded by default and graph configuration with auto expand
    Given user accesses Data workflows menu
    Given user accesses Workflow launchers
    And user lunch workflow model "<workflowname>"
    Given user accesses to Inbox
    And user start work item
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 8 |
      | K1 |                       | 7 |
      | L1 |                       |   |
      | X1 |                       |   |
      | B1 | RIGHT                 |   |
      | C1 | RIGHT                 |   |
      | D1 | RIGHT                 |   |
      | E1 | RIGHT                 |   |
      | F1 | RIGHT                 |   |
      | G1 | RIGHT                 |   |
      | H1 | RIGHT                 |   |
      | I1 | RIGHT                 |   |
      | J1 |                       |   |
    Then the label of link label should be display as following
      |  7 |  2 |  |
      |  0 |  9 |  |
      |  2 |  3 |  |
      |  1 |  0 |  |
      |  3 |  5 |  |
      |  4 |  1 |  |
      |  9 | 10 |  |
      |  5 |  6 |  |
      |  6 |  4 |  |
      | 11 |  7 |  |

    Examples: 
      | workflowname |
      | V130_US01    |

  Scenario Outline: US01-58 Check the data graph run from Workflow with service "Display data using configuration" that hasn't expanded by default and graph configuration without auto expand
    Given user accesses Data workflows menu
    Given user accesses Workflow launchers
    And user lunch workflow model "<workflowname>"
    Given user accesses to Inbox
    And user start work item
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT,TOP,BOTTOM |  |
    Then there is no link displayed

    Examples: 
      | workflowname |
      | V130_US01-2  |

  Scenario Outline: US01-59 Check the data graph run from Workflow with service "Display data using configuration" that hasn't expanded by default and graph configuration with auto expand
    Given user accesses Data workflows menu
    Given user accesses Workflow launchers
    And user lunch workflow model "<workflowname>"
    Given user accesses to Inbox
    And user start work item
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 5 |
      | B1 |                       |   |
      | C1 |                       |   |
      | D1 |                       | 4 |
      | E1 |                       |   |
    Then the label of link label should be display as following
      | 4 | 1 |  |
      | 2 | 4 |  |

    Examples: 
      | workflowname |
      | V130_US01-3  |

  Scenario Outline: US01-60 Check the data graph run from Workflow with service "Display data using configuration" that has expanded by default and graph configuration without auto expand
    Given user accesses Data workflows menu
    Given user accesses Workflow launchers
    And user lunch workflow model "<workflowname>"
    Given user accesses to Inbox
    And user start work item
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 1 |
      | E1 |                       |   |
      | C1 |                       |   |
    Then the label of link label should be display as following
      | 0 | 2 |  |

    Examples: 
      | workflowname |
      | V130_US01-4  |

  Scenario: US01-65 - Check the data graph has Xpath filter config with auto expand
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-65"
    And I access table "TableB"
    And user views "Visualization>Display data using configuration" of record has ID is "B1"
    And user generates graph with configuration "V130_US01-65"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 |       |  |
      | B1 | RIGHT |  |
    Then the label of link label should be display as following
      | 1 | 0 |  |

  Scenario: US01-66 - Check the data graph has Xpath class filter config without auto expand
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-65"
    And I access table "TableB"
    And user views "Visualization>Display data using configuration" of record has ID is "B1"
    And user generates graph with configuration "V130_US01-66"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | B1 | RIGHT |  |
    Then there is no link displayed
    #5. Expand target node of B1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 |       |  |
      | B1 | RIGHT |  |
    Then the label of link label should be display as following
      | 0 | 1 |  |

  Scenario: US01-68 - Check the data graph with auto expand the node that starts by two nodes has the same parent/target.
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-68"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | A1 |
      | A2 |
    And user generates graph with configuration "V130_US01-68"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | B1 |           |   |
      | A1 | RIGHT,TOP | 2 |
      | A2 | RIGHT,TOP | 2 |
      | D1 |           |   |
    Then the label of link label should be display as following
      | 1 | 0 |  |
      | 3 | 0 |  |
    #5. Collapse parent of node A1
    When user collapse parent on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,TOP |  |
      | A2 | RIGHT,TOP |  |
      | D1 |           |  |
    Then the label of link label should be display as following
      | 4 | 0 |  |
      | 5 | 0 |  |
    #6. Collapse target of node A1
    When user collapse target on node "5"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,TOP |  |
      | A2 | RIGHT,TOP |  |
    Then there is no link displayed
    #7. Expand target of node A1
    When user expands target on node "5"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | RIGHT,TOP |  |
      | A2 | RIGHT,TOP |  |
      | D1 | LEFT      |  |
    Then the label of link label should be display as following
      | 5 | 0 |  |
    #8. Expand parent of node A1
    When user expands parent on node "5"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | D1 | LEFT      |   |
      | A1 | RIGHT,TOP | 2 |
      | B1 |           |   |
      | A2 | RIGHT     | 2 |
    Then the label of link label should be display as following
      | 1 | 0 |  |

  Scenario: US01-69 - Check the data graph with auto expand the node that starts by two nodes has the same child/source
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-68"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | A1 |
      | A2 |
    And user generates graph with configuration "V130_US01-69"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,BOTTOM |  |
      | A2 | LEFT,BOTTOM |  |
    Then there is no link displayed
    #5. Expand child of node A2
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT        |   |
      | A2 | LEFT,BOTTOM |   |
      | E1 |             | 0 |
      | E1 | TOP         | 1 |
    Then there is no link displayed
    #6. Expand source of node A2
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 |             |   |
      | A2 | LEFT,BOTTOM |   |
      | E1 |             | 0 |
      | E1 | TOP         | 1 |
      | F1 | RIGHT       |   |
    Then the label of link label should be display as following
      | 4 | 0 |  |
      | 4 | 1 |  |

  Scenario: US01-70 - Check the data graph with auto expand the node that starts by two nodes has the same child/target/parent/source
    Given I access dataspace "Master Data - Reference>DMDV_v1.3.0"
    Given I access dataset "V130_US01-68"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | A1 |
      | A2 |
    And user generates graph with configuration "V130_US01-70"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 2 |
      | A2 | LEFT,RIGHT,TOP,BOTTOM | 2 |
      | B1 |                       |   |
      | D1 |                       |   |
    Then the label of link label should be display as following
      | 1 | 0 |  |
      | 3 | 0 |  |
    #5. Collapse parent of node A1
    When user collapse parent on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT,TOP,BOTTOM |  |
      | A2 | LEFT,RIGHT,TOP,BOTTOM |  |
      | D1 |                       |  |
    Then the label of link label should be display as following
      | 4 | 0 |  |
      | 5 | 0 |  |
    #6. Collapse target of node A1
    When user collapse target on node "5"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT,TOP,BOTTOM |  |
      | A2 | LEFT,RIGHT,TOP,BOTTOM |  |
    Then there is no link displayed
    #7. Expand parent of node A1
    When user expands parent on node "5"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 2 |
      | A2 | LEFT,RIGHT,BOTTOM     | 2 |
      | B1 |                       |   |
    Then there is no link displayed
    #8. Expand target of node A1
    When user expands target on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 2 |
      | A2 | LEFT,RIGHT,BOTTOM     | 2 |
      | B1 |                       |   |
      | D1 | LEFT                  |   |
    Then the label of link label should be display as following
      | 1 | 0 |  |
    #9. Expand source of node A1
    When user expands source on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 2 |
      | A2 | RIGHT,BOTTOM          | 2 |
      | B1 |                       |   |
      | D1 | LEFT                  |   |
      | F1 | RIGHT                 |   |
    Then the label of link label should be display as following
      | 1 | 0 |  |
      | 6 | 3 |  |
      | 6 | 1 |  |
    #10. Expand child of node A1
    When user expands children on node "1"
    Then the label of all nodes is displayed as following
      #|Label|Indicator|node key of parent|
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 2 |
      | A2 | RIGHT                 | 2 |
      | B1 |                       |   |
      | D1 | LEFT                  |   |
      | F1 | RIGHT                 |   |
      | E1 |                       | 1 |
      | E1 | TOP                   | 3 |
    Then the label of link label should be display as following
      | 1 | 0 |  |
      | 6 | 3 |  |
      | 6 | 1 |  |
