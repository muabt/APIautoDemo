@DMDV100-GraphData
Feature: Test graph data with configuration
  Background: 
    Given I login to EBX succesfully

@Line-FKtoSametable    
Scenario: Data_49 - Check displayed correctly relationship of nodes (that has an incoming node on same table by a FK) when was Expanded/ Collapsed
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_18"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "V100_Line_Data_49"
    Then the graph should be displayed
    Then the label of node "0" equal "A1"
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      | A1 |
      | A2 |
    Then the label of link label should be display as following
      | 1 | 0 |  |
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A1 |
      | A2 |
    Then the label of link label should be display as following
      | 1 | 0 |  |
      | 0 | 0 |  |
    When user collapse source on node "0"
    Then the label of all nodes is displayed as following
      | A1 |
    Then the label of link label should be display as following
      | 0 | 0 |  |
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      | A1 |
    Then there is no link displayed
    When user expands source recursively on node "0"
    Then the label of all nodes is displayed as following
      | A1 |
      | A2 |
    Then the label of link label should be display as following
      | 1 | 0 |  |    
    When user expands target recursively on node "0"
    Then the label of all nodes is displayed as following
      | A1 |
      | A2 |
    Then the label of link label should be display as following
      | 1 | 0 |  |
      | 0 | 0 |  |
    When user collapse source recursively on node "0"
    Then the label of all nodes is displayed as following
      | A1 |
    Then the label of link label should be display as following
      | 0 | 0 |  |
    When user collapse target recursively on node "0"
    Then the label of all nodes is displayed as following
      | A1 |
    Then there is no link displayed
    
Scenario: Data_50 - Check displayed correctly relationship of nodes (that has an outgoing node on same table by a FK) when was Expanded/ Collapsed
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_18"
    And user views "Visualization>Display data using configuration" of record has ID is "3"
    And user generates graph with configuration "V100_Line_Data_49"
    Then the graph should be displayed
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A3 |
      | A4 |
    Then the label of link label should be display as following
      | 0 | 1 |  |
   	When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      | A3 |
    Then there is no link displayed
    When user expands target recursively on node "0"
    Then the label of all nodes is displayed as following
      | A3 |
      | A4 |
    Then the label of link label should be display as following
      | 0 | 1 |  |
   	When user collapse target recursively on node "0"
    Then the label of all nodes is displayed as following
      | A3 |
    Then there is no link displayed
    
Scenario: Data_52 - Check displayed correctly relationship of nodes (that has an incoming node on same table by many FKs) when was Expanded/ Collapsed
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_18"
    And user views "Visualization>Display data using configuration" of record has ID is "8"
    And user generates graph with configuration "V100_Line_Data_49"
    Then the graph should be displayed
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A8 |
    Then the label of link label should be display as following
      | 0 | 0 |  |true|
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      | A8 |
      | A9 |
    Then the label of link label should be display as following
      | 0 | 0 |  |true|
      | 1 | 0 |  |true|
    When user collapse source on node "0"
    Then the label of all nodes is displayed as following
      | A8 |
    Then the label of link label should be display as following
      | 0 | 0 |  |true|
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      | A8 |
    Then there is no link displayed
    When user expands target recursively on node "0"
    Then the label of all nodes is displayed as following
      | A8 |
    Then the label of link label should be display as following
      | 0 | 0 |  |true|
    When user expands source recursively on node "0"
    Then the label of all nodes is displayed as following
      | A8 |
      | A9 |
    Then the label of link label should be display as following
      | 0 | 0 |  |true|
      | 1 | 0 |  |true|
    When user collapse source recursively on node "0"
    Then the label of all nodes is displayed as following
      | A8 |
    Then the label of link label should be display as following
      | 0 | 0 |  |true|
    When user collapse target recursively on node "0"
    Then the label of all nodes is displayed as following
      | A8 |
    Then there is no link displayed
    
Scenario: Data_53 - Check displayed correctly relationship of nodes (that has an outgoing node on same table by many FKs) when was Expanded/ Collapsed
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_18"
    And user views "Visualization>Display data using configuration" of record has ID is "10"
    And user generates graph with configuration "V100_Line_Data_49"
    Then the graph should be displayed
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A10 |
      | A11 |
    Then the label of link label should be display as following
      | 0 | 1 |  |true|
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      | A10 |
    Then there is no link displayed
    When user expands target recursively on node "0"
    Then the label of all nodes is displayed as following
      | A10 |
      | A11 |
    Then the label of link label should be display as following
      | 0 | 1 |  |true|
    When user collapse target recursively on node "0"
    Then the label of all nodes is displayed as following
      | A10 |
    Then there is no link displayed

Scenario: Data_55 - Check displayed correctly relationship of nodes (that have many incoming node on same table) when was Expanded/ Collapsed
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_24"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "V100_Line_Data_55"
    Then the graph should be displayed
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      | A1 |
      | A4 |
      | A3 |
      | A2 |
      | A8 |
      | A7 |
      | A6 |
      | A11 |
      | A5 |
      | A10 |
      | A12 |
      | A9 |
    Then the label of link label should be display as following
      | 1 | 0 |  |
      | 3 | 0 |  |
      | 2 | 0 |  |
      | 8 | 0 |  |
      | 6 | 0 |  |
      | 9 | 0 |  |
      | 7 | 0 |  |
      | 5 | 0 |  |
      | 10 | 0 |  |
      | 11 | 0 |  |
      | 4 | 0 |  |
   	When user collapse source on node "0"
   	Then the label of all nodes is displayed as following
    	| A1 |
    Then there is no link displayed

Scenario: Data_56 - Check displayed correctly relationship of nodes (that have many incoming node on same table) when was Expanded/ Collapsed
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_24"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "V100_Line_Data_55"
    Then the graph should be displayed
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      | A1 |LEFT	|
      | A4 |	|
      | A3 |	|
      | A2 |	|
      | A8 |	|
      | A7 |	|
      | A6 |	|
      | A11 |	|
      | A5 |	|
      | A10 |	|
      | A12 |	|
      | A9 |	|
    Then the label of link label should be display as following
      | 1 | 0 |  |
      | 3 | 0 |  |
      | 2 | 0 |  |
      | 8 | 0 |  |
      | 6 | 0 |  |
      | 9 | 0 |  |
      | 7 | 0 |  |
      | 5 | 0 |  |
      | 10 | 0 |  |
      | 11 | 0 |  |
      | 4 | 0 |  |
   	When user collapse source on node "0"
   	Then the label of all nodes is displayed as following
    	| A1 | LEFT	|
    Then there is no link displayed    
    When user expands source recursively on node "0"
    Then the label of all nodes is displayed as following
      | A1 |LEFT	|
      | A4 |	|
      | A3 |	|
      | A2 |	|
      | A8 |	|
      | A7 |	|
      | A6 |	|
      | A11 |	|
      | A5 |	|
      | A10 |	|
      | A12 |	|
      | A9 |	|
    Then the label of link label should be display as following
      | 1 | 0 |  |
      | 3 | 0 |  |
      | 2 | 0 |  |
      | 8 | 0 |  |
      | 6 | 0 |  |
      | 9 | 0 |  |
      | 7 | 0 |  |
      | 5 | 0 |  |
      | 10 | 0 |  |
      | 11 | 0 |  |
      | 4 | 0 |  |
   	When user collapse source recursively on node "0"
   	Then the label of all nodes is displayed as following
    	| A1 | LEFT	|
    Then there is no link displayed     

Scenario: Data_57 - Check displayed correctly relationship of nodes (that have many incoming node on same table) when was started by it and a incoming nodes then Expand/ Collapse them
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_24"
    And user views "Visualization>Display data using configuration" of records have ID are
    	| 1|
    	| 2|
    And user generates graph with configuration "V100_Line_Data_55"
    Then the graph should be displayed
    When user expands source on node "1"
    Then the label of all nodes is displayed as following
      | A1 |LEFT	|
      | A4 |	|
      | A3 |	|
      | A2 |	|
      | A8 |	|
      | A7 |	|
      | A6 |	|
      | A11 |	|
      | A5 |	|
      | A10 |	|
      | A12 |	|
      | A9 |	|
    Then the label of link label should be display as following
      | 2 | 1 |  |
      | 0 | 1 |  |
      | 3 | 1 |  |
      | 8 | 1 |  |
      | 6 | 1 |  |
      | 9 | 1 |  |
      | 7 | 1 |  |
      | 5 | 1 |  |
      | 10 | 1 |  |
      | 11 | 1 |  |
      | 4 | 1 |  |
    When user collapse source on node "1"
    Then the label of all nodes is displayed as following
      | A1 |LEFT	|
      | A2 |RIGHT	|
   	Then there is no link displayed
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A1 |LEFT	|
      | A2 |RIGHT	|
    Then the label of link label should be display as following
      | 0 | 1 |  |
    When user expands source on node "1"
    Then the label of all nodes is displayed as following
      | A1 |LEFT	|
      | A4 |	|
      | A3 |	|
      | A2 |RIGHT	|
      | A8 |	|
      | A7 |	|
      | A6 |	|
      | A11 |	|
      | A5 |	|
      | A10 |	|
      | A12 |	|
      | A9 |	|
    Then the label of link label should be display as following
      | 2 | 1 |  |
      | 0 | 1 |  |
      | 3 | 1 |  |
      | 8 | 1 |  |
      | 6 | 1 |  |
      | 9 | 1 |  |
      | 7 | 1 |  |
      | 5 | 1 |  |
      | 10 | 1 |  |
      | 11 | 1 |  |
      | 4 | 1 |  |
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      | A1 |LEFT	|
      | A2 |RIGHT	|
   	Then there is no link displayed
   	
Scenario: Data_58 - Check displayed correctly relationship of nodes (that have many incoming node on same table) when was started by all nodes then Expand/ Collapse them
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_24"
    And user views "Visualization>Display data using configuration" of records have ID are
    	| 1|
    	| 2|
    	| 3|
    	| 4|
    	| 5|
    	| 6|
    	| 7|
    	| 8|
    	| 9|
    	| 10|
    	| 11|
    	| 12|
    And user generates graph with configuration "V100_Line_Data_55"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      | A1 |LEFT	|
      | A4 |RIGHT	|
      | A3 |RIGHT	|
      | A2 |RIGHT	|
      | A8 |RIGHT	|
      | A7 |RIGHT	|
      | A6 |RIGHT	|
      | A11 |RIGHT	|
      | A5 |RIGHT	|
      | A10 |RIGHT	|
      | A12 |RIGHT	|
      | A9 |RIGHT	|
    When user expands target on node "2"
    Then the label of all nodes is displayed as following
      | A1 |LEFT	|
      | A4 |RIGHT	|
      | A3 |RIGHT	|
      | A2 |RIGHT	|
      | A8 |RIGHT	|
      | A7 |RIGHT	|
      | A6 |RIGHT	|
      | A11 |RIGHT	|
      | A5 |RIGHT	|
      | A10 |RIGHT	|
      | A12 |RIGHT	|
      | A9 |RIGHT	|
    Then the label of link label should be display as following
      | 2 | 3 |  |
    When user expands source on node "3"
    Then the label of all nodes is displayed as following
      | A1 |LEFT	|
      | A4 |	|
      | A3 |	|
      | A2 |RIGHT	|
      | A8 |	|
      | A7 |	|
      | A6 |	|
      | A11 |	|
      | A5 |	|
      | A10 |	|
      | A12 |	|
      | A9 |	|    
    Then the label of link label should be display as following
      | 1 | 3 |  |
      | 2 | 3 |  |
      | 0 | 3 |  |
      | 8 | 3 |  |
      | 6 | 3 |  |
      | 9 | 3 |  |
      | 7 | 3 |  |
      | 5 | 3 |  |
      | 10 | 3 |  |
      | 11 | 3 |  |
      | 4 | 3 |  |
    When user collapse source on node "3"
    Then the label of all nodes is displayed as following
      | A1 |LEFT	|
      | A4 |RIGHT	|
      | A3 |RIGHT	|
      | A2 |RIGHT	|
      | A8 |RIGHT	|
      | A7 |RIGHT	|
      | A6 |RIGHT	|
      | A11 |RIGHT	|
      | A5 |RIGHT	|
      | A10 |RIGHT	|
      | A12 |RIGHT	|
      | A9 |RIGHT	|
    Then the label of link label should be display as following
      | 2 | 3 |  |
    When user collapse target on node "2"
    Then the label of all nodes is displayed as following
      | A1 |LEFT	|
      | A4 |RIGHT	|
      | A3 |RIGHT	|
      | A2 |RIGHT	|
      | A8 |RIGHT	|
      | A7 |RIGHT	|
      | A6 |RIGHT	|
      | A11 |RIGHT	|
      | A5 |RIGHT	|
      | A10 |RIGHT	|
      | A12 |RIGHT	|
      | A9 |RIGHT	|
		Then there is no link displayed
    When user expands target on node "2"
    Then the label of all nodes is displayed as following
      | A1 |LEFT	|
      | A4 |RIGHT	|
      | A3 |RIGHT	|
      | A2 |RIGHT	|
      | A8 |RIGHT	|
      | A7 |RIGHT	|
      | A6 |RIGHT	|
      | A11 |RIGHT	|
      | A5 |RIGHT	|
      | A10 |RIGHT	|
      | A12 |RIGHT	|
      | A9 |RIGHT	|
    Then the label of link label should be display as following
      | 2 | 3 |  |
    When user collapse target on node "2"
    Then the label of all nodes is displayed as following
      | A1 |LEFT	|
      | A4 |RIGHT	|
      | A3 |RIGHT	|
      | A2 |RIGHT	|
      | A8 |RIGHT	|
      | A7 |RIGHT	|
      | A6 |RIGHT	|
      | A11 |RIGHT	|
      | A5 |RIGHT	|
      | A10 |RIGHT	|
      | A12 |RIGHT	|
      | A9 |RIGHT	|
		Then there is no link displayed
    #test recursively
    When user expands target recursively on node "2"
    Then the label of all nodes is displayed as following
      | A1 |LEFT	|
      | A4 |RIGHT	|
      | A3 |RIGHT	|
      | A2 |RIGHT	|
      | A8 |RIGHT	|
      | A7 |RIGHT	|
      | A6 |RIGHT	|
      | A11 |RIGHT	|
      | A5 |RIGHT	|
      | A10 |RIGHT	|
      | A12 |RIGHT	|
      | A9 |RIGHT	|
    Then the label of link label should be display as following
      | 2 | 3 |  |
    When user expands source recursively on node "3"
    Then the label of all nodes is displayed as following
      | A1 |LEFT	|
      | A4 |	|
      | A3 |	|
      | A2 |RIGHT	|
      | A8 |	|
      | A7 |	|
      | A6 |	|
      | A11 |	|
      | A5 |	|
      | A10 |	|
      | A12 |	|
      | A9 |	|    
    Then the label of link label should be display as following
      | 1 | 3 |  |
      | 2 | 3 |  |
      | 0 | 3 |  |
      | 8 | 3 |  |
      | 6 | 3 |  |
      | 9 | 3 |  |
      | 7 | 3 |  |
      | 5 | 3 |  |
      | 10 | 3 |  |
      | 11 | 3 |  |
      | 4 | 3 |  |
    When user collapse source recursively on node "3"
    Then the label of all nodes is displayed as following
      | A1 |LEFT	|
      | A4 |RIGHT	|
      | A3 |RIGHT	|
      | A2 |RIGHT	|
      | A8 |RIGHT	|
      | A7 |RIGHT	|
      | A6 |RIGHT	|
      | A11 |RIGHT	|
      | A5 |RIGHT	|
      | A10 |RIGHT	|
      | A12 |RIGHT	|
      | A9 |RIGHT	|
    Then the label of link label should be display as following
      | 2 | 3 |  |
    When user collapse target recursively on node "2"
    Then the label of all nodes is displayed as following
      | A1 |LEFT	|
      | A4 |RIGHT	|
      | A3 |RIGHT	|
      | A2 |RIGHT	|
      | A8 |RIGHT	|
      | A7 |RIGHT	|
      | A6 |RIGHT	|
      | A11 |RIGHT	|
      | A5 |RIGHT	|
      | A10 |RIGHT	|
      | A12 |RIGHT	|
      | A9 |RIGHT	|
		Then there is no link displayed
    When user expands target recursively on node "2"
    Then the label of all nodes is displayed as following
      | A1 |LEFT	|
      | A4 |RIGHT	|
      | A3 |RIGHT	|
      | A2 |RIGHT	|
      | A8 |RIGHT	|
      | A7 |RIGHT	|
      | A6 |RIGHT	|
      | A11 |RIGHT	|
      | A5 |RIGHT	|
      | A10 |RIGHT	|
      | A12 |RIGHT	|
      | A9 |RIGHT	|
    Then the label of link label should be display as following
      | 2 | 3 |  |
    When user collapse target recursively on node "2"
    Then the label of all nodes is displayed as following
      | A1 |LEFT	|
      | A4 |RIGHT	|
      | A3 |RIGHT	|
      | A2 |RIGHT	|
      | A8 |RIGHT	|
      | A7 |RIGHT	|
      | A6 |RIGHT	|
      | A11 |RIGHT	|
      | A5 |RIGHT	|
      | A10 |RIGHT	|
      | A12 |RIGHT	|
      | A9 |RIGHT	|
		Then there is no link displayed   	
   	
Scenario: Data_59 - Check displayed correctly relationship of nodes (that have many incoming node on same table) when was started by two incoming nodes then Expand/ Collapse them many time
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_24"
    And user views "Visualization>Display data using configuration" of records have ID are
    	| 2|
    	| 3|
    And user generates graph with configuration "V100_Line_Data_55"
    Then the graph should be displayed
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A3 |RIGHT	|
      | A2 |RIGHT	|
      | A1 |LEFT	|
    Then the label of link label should be display as following
      | 0 | 2 |  |
    When user expands source on node "2"
    Then the label of all nodes is displayed as following
      | A1 |LEFT	|
      | A4 |	|
      | A3 |RIGHT	|
      | A2 |	|
      | A8 |	|
      | A7 |	|
      | A6 |	|
      | A11 |	|
      | A5 |	|
      | A10 |	|
      | A12 |	|
      | A9 |	|    
    Then the label of link label should be display as following
      | 1 | 2 |  |
      | 3 | 2 |  |
      | 0 | 2 |  |
      | 8 | 2 |  |
      | 6 | 2 |  |
      | 9 | 2 |  |
      | 7 | 2 |  |
      | 5 | 2 |  |
      | 10 | 2 |  |
      | 11 | 2 |  |
      | 4 | 2 |  |
		When user collapse source on node "2"
    Then the label of all nodes is displayed as following
      | A3 |RIGHT	|
      | A2 |RIGHT	|
      | A1 |LEFT	|
    Then the label of link label should be display as following
      | 0 | 2 |  |    
    When user expands source on node "2"
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      | A3 |RIGHT	|
      | A2 |RIGHT	|
    Then there is no link displayed
		When user expands target on node "0"    
		Then the label of all nodes is displayed as following
      | A3 |RIGHT	|
      | A2 |RIGHT	|
      | A1 |LEFT	|
    Then the label of link label should be display as following
      | 0 | 2 |  |      	

Scenario: Data_61 - Check displayed correctly relationship of nodes (that have many outgoing nodes on same table) when was Expanded/ Collapsed
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_30"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "V100_Line_Data_61"
    Then the graph should be displayed
    When user expands target on node "0"
   	Then the label of all nodes is displayed as following
      | A1 |RIGHT|
      | A3 |	|
      | A2 |	|
      | A7 |	|
      | A6 |	|
      | A10 |	|
      | A5 |	|
      | A4 |	|
      | A11 |	|
      | A12 |	|
      | A9 |	|
      | A8 |	|
		Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 0 | 3 |  |
      | 0 | 4 |  |
      | 0 | 5 |  |
      | 0 | 6 |  |
      | 0 | 7 |  |
      | 0 | 8 |  |
      | 0 | 9 |  |
      | 0 | 10 |  |
      | 0 | 11 |  |
   	When user collapse target on node "0"
   	Then the label of all nodes is displayed as following
   		| A1 |RIGHT|
   	Then there is no link displayed
   	
Scenario: Data_62 - Check displayed correctly relationship of nodes (that have many outgoing nodes on same table) when was Expanded/ Collapsed many time
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_30"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "V100_Line_Data_61"
    Then the graph should be displayed
    When user expands target on node "0"
   	Then the label of all nodes is displayed as following
      | A1 |RIGHT|
      | A3 |	|
      | A2 |	|
      | A7 |	|
      | A6 |	|
      | A10 |	|
      | A5 |	|
      | A4 |	|
      | A11 |	|
      | A12 |	|
      | A9 |	|
      | A8 |	|
		Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 0 | 3 |  |
      | 0 | 4 |  |
      | 0 | 5 |  |
      | 0 | 6 |  |
      | 0 | 7 |  |
      | 0 | 8 |  |
      | 0 | 9 |  |
      | 0 | 10 |  |
      | 0 | 11 |  |
   	When user collapse target on node "0"
   	Then the label of all nodes is displayed as following
   		| A1 |RIGHT|
   	Then there is no link displayed
    When user expands target recursively on node "0"
   	Then the label of all nodes is displayed as following
      | A1 |RIGHT|
      | A3 |	|
      | A2 |	|
      | A7 |	|
      | A6 |	|
      | A10 |	|
      | A5 |	|
      | A4 |	|
      | A11 |	|
      | A12 |	|
      | A9 |	|
      | A8 |	|
		Then the label of link label should be display as following
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 0 | 3 |  |
      | 0 | 4 |  |
      | 0 | 5 |  |
      | 0 | 6 |  |
      | 0 | 7 |  |
      | 0 | 8 |  |
      | 0 | 9 |  |
      | 0 | 10 |  |
      | 0 | 11 |  |
   	When user collapse target recursively on node "0"
   	Then the label of all nodes is displayed as following
   		| A1 |RIGHT|
   	Then there is no link displayed   	
   	
Scenario: Data_63 - Check displayed correctly relationship of nodes (that have many outgoing nodes on same table) when was started by it and a incoming nodes then Expand/ Collapse them
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_30"
    And user views "Visualization>Display data using configuration" of records have ID are
    	| 1|
    	| 2|
    And user generates graph with configuration "V100_Line_Data_61"
    Then the graph should be displayed
   	Then the label of all nodes is displayed as following
      | A2 |LEFT|
      | A1 |RIGHT	|
    When user expands target on node "1"
   	Then the label of all nodes is displayed as following
      | A1 |RIGHT|
      | A2 |	|
      | A3 |	|
      | A7 |	|
      | A6 |	|
      | A10 |	|
      | A5 |	|
      | A4 |	|
      | A11 |	|
      | A12 |	|
      | A9 |	|
      | A8 |	|
		Then the label of link label should be display as following
      | 1 | 0 |  |
      | 1 | 2 |  |
      | 1 | 3 |  |
      | 1 | 4 |  |
      | 1 | 5 |  |
      | 1 | 6 |  |
      | 1 | 7 |  |
      | 1 | 8 |  |
      | 1 | 9 |  |
      | 1 | 10 |  |
      | 1 | 11 |  |
    When user collapse target on node "1"
   	Then the label of all nodes is displayed as following
      | A2 |LEFT|
      | A1 |RIGHT	|
    Then there is no link displayed    
    When user expands source on node "0"
   	Then the label of all nodes is displayed as following
      | A2 |LEFT|
      | A1 |RIGHT	|
		Then the label of link label should be display as following
      | 1 | 0 |  |
    When user expands target on node "1"
   	Then the label of all nodes is displayed as following
      | A1 |RIGHT|
      | A2 |LEFT	|
      | A3 |	|
      | A7 |	|
      | A6 |	|
      | A10 |	|
      | A5 |	|
      | A4 |	|
      | A11 |	|
      | A12 |	|
      | A9 |	|
      | A8 |	|
		Then the label of link label should be display as following
      | 1 | 0 |  |
      | 1 | 2 |  |
      | 1 | 3 |  |
      | 1 | 4 |  |
      | 1 | 5 |  |
      | 1 | 6 |  |
      | 1 | 7 |  |
      | 1 | 8 |  |
      | 1 | 9 |  |
      | 1 | 10 |  |
      | 1 | 11 |  |
    When user collapse source on node "0"
   	Then the label of all nodes is displayed as following
      | A2 |LEFT|
      | A1 |RIGHT	|
		Then there is no link displayed       	
		
Scenario: Data_64 - Check displayed correctly relationship of nodes (that have many outgoing nodes on same table) when was started by all nodes then Expand/ Collapse them
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_30"
    And user views "Visualization>Display data using configuration" of records have ID are
    	| 1|
    	| 2|
    	| 3|
    	| 4|
    	| 5|
    	| 6|
    	| 7|
    	| 8|
    	| 9|
    	| 10|
    	| 11|
    	| 12|
    And user generates graph with configuration "V100_Line_Data_61"
    Then the graph should be displayed
   	Then the label of all nodes is displayed as following
      | A3 |LEFT	|
      | A2 |LEFT|
      | A1 |RIGHT	|
      | A7 |LEFT	|
      | A6 |LEFT	|
      | A10 |LEFT	|
      | A5 |LEFT	|
      | A4 |LEFT	|
      | A11 |LEFT	|
      | A12 |LEFT	|
      | A9 |LEFT	|
      | A8 |LEFT	|
    When user expands source on node "1"
   	Then the label of all nodes is displayed as following
      | A3 |LEFT	|
      | A2 |LEFT|
      | A1 |RIGHT	|
      | A7 |LEFT	|
      | A6 |LEFT	|
      | A10 |LEFT	|
      | A5 |LEFT	|
      | A4 |LEFT	|
      | A11 |LEFT	|
      | A12 |LEFT	|
      | A9 |LEFT	|
      | A8 |LEFT	|
		Then the label of link label should be display as following
      | 2 | 1 |  |
    When user expands target on node "2"
   	Then the label of all nodes is displayed as following
      | A3 |	|
      | A2 |LEFT|
      | A1 |RIGHT	|
      | A7 |	|
      | A6 |	|
      | A10 |	|
      | A5 |	|
      | A4 |	|
      | A11 |	|
      | A12 |	|
      | A9 |	|
      | A8 |	|
		Then the label of link label should be display as following
      | 2 | 0 |  |
      | 2 | 1 |  |
      | 2 | 3 |  |
      | 2 | 4 |  |
      | 2 | 5 |  |
      | 2 | 6 |  |
      | 2 | 7 |  |
      | 2 | 8 |  |
      | 2 | 9 |  |
      | 2 | 10 |  |
      | 2 | 11 |  |
    When user collapse target on node "2"
   	Then the label of all nodes is displayed as following
      | A3 |LEFT	|
      | A2 |LEFT|
      | A1 |RIGHT	|
      | A7 |LEFT	|
      | A6 |LEFT	|
      | A10 |LEFT	|
      | A5 |LEFT	|
      | A4 |LEFT	|
      | A11 |LEFT	|
      | A12 |LEFT	|
      | A9 |LEFT	|
      | A8 |LEFT	|
		Then the label of link label should be display as following
      | 2 | 1 |  |
    When user collapse source on node "1"
    Then the label of all nodes is displayed as following
      | A3 |LEFT	|
      | A2 |LEFT|
      | A1 |RIGHT	|
      | A7 |LEFT	|
      | A6 |LEFT	|
      | A10 |LEFT	|
      | A5 |LEFT	|
      | A4 |LEFT	|
      | A11 |LEFT	|
      | A12 |LEFT	|
      | A9 |LEFT	|
      | A8 |LEFT	|
    Then there is no link displayed
    #recursively
    When user expands source recursively on node "1"
   	Then the label of all nodes is displayed as following
      | A3 |LEFT	|
      | A2 |LEFT|
      | A1 |RIGHT	|
      | A7 |LEFT	|
      | A6 |LEFT	|
      | A10 |LEFT	|
      | A5 |LEFT	|
      | A4 |LEFT	|
      | A11 |LEFT	|
      | A12 |LEFT	|
      | A9 |LEFT	|
      | A8 |LEFT	|
		Then the label of link label should be display as following
      | 2 | 1 |  |
    When user expands target recursively on node "2"
   	Then the label of all nodes is displayed as following
      | A3 |	|
      | A2 |LEFT|
      | A1 |RIGHT	|
      | A7 |	|
      | A6 |	|
      | A10 |	|
      | A5 |	|
      | A4 |	|
      | A11 |	|
      | A12 |	|
      | A9 |	|
      | A8 |	|
		Then the label of link label should be display as following
      | 2 | 0 |  |
      | 2 | 1 |  |
      | 2 | 3 |  |
      | 2 | 4 |  |
      | 2 | 5 |  |
      | 2 | 6 |  |
      | 2 | 7 |  |
      | 2 | 8 |  |
      | 2 | 9 |  |
      | 2 | 10 |  |
      | 2 | 11 |  |
    When user collapse target recursively on node "2"
   	Then the label of all nodes is displayed as following
      | A3 |LEFT	|
      | A2 |LEFT|
      | A1 |RIGHT	|
      | A7 |LEFT	|
      | A6 |LEFT	|
      | A10 |LEFT	|
      | A5 |LEFT	|
      | A4 |LEFT	|
      | A11 |LEFT	|
      | A12 |LEFT	|
      | A9 |LEFT	|
      | A8 |LEFT	|
		Then the label of link label should be display as following
      | 2 | 1 |  |
    When user collapse source recursively on node "1"
    Then the label of all nodes is displayed as following
      | A3 |LEFT	|
      | A2 |LEFT|
      | A1 |RIGHT	|
      | A7 |LEFT	|
      | A6 |LEFT	|
      | A10 |LEFT	|
      | A5 |LEFT	|
      | A4 |LEFT	|
      | A11 |LEFT	|
      | A12 |LEFT	|
      | A9 |LEFT	|
      | A8 |LEFT	|
    Then there is no link displayed
    
Scenario: Data_65 - Check displayed correctly relationship of nodes (that have many outgoing nodes on same table) when was started by two incoming nodes then Expand/ Collapse them many time
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_30"
    And user views "Visualization>Display data using configuration" of records have ID are
    	| 2|
    	| 3|
    And user generates graph with configuration "V100_Line_Data_61"
    Then the graph should be displayed
   	Then the label of all nodes is displayed as following
      | A3 |LEFT	|
      | A2 |LEFT|
    When user expands source on node "0"
   	Then the label of all nodes is displayed as following
      | A3 |LEFT	|
      | A2 |LEFT|
      | A1 |RIGHT|
		Then the label of link label should be display as following
      | 2 | 0 |  |
    When user expands target on node "2"
   	Then the label of all nodes is displayed as following
      | A3 |LEFT	|
      | A2 |	|
      | A1 |RIGHT	|
      | A7 |	|
      | A6 |	|
      | A10 |	|
      | A5 |	|
      | A4 |	|
      | A11 |	|
      | A12 |	|
      | A9 |	|
      | A8 |	|
		Then the label of link label should be display as following
      | 2 | 0 |  |
      | 2 | 1 |  |
      | 2 | 3 |  |
      | 2 | 4 |  |
      | 2 | 5 |  |
      | 2 | 6 |  |
      | 2 | 7 |  |
      | 2 | 8 |  |
      | 2 | 9 |  |
      | 2 | 10 |  |
      | 2 | 11 |  |
    When user collapse target on node "2"
   	Then the label of all nodes is displayed as following
      | A3 |LEFT	|
      | A2 |LEFT|
      | A1 |RIGHT|
		Then the label of link label should be display as following
      | 2 | 0 |  |
    When user expands target on node "2"
   	Then the label of all nodes is displayed as following
      | A3 |LEFT	|
      | A2 |	|
      | A1 |RIGHT	|
      | A7 |	|
      | A6 |	|
      | A10 |	|
      | A5 |	|
      | A4 |	|
      | A11 |	|
      | A12 |	|
      | A9 |	|
      | A8 |	|
		Then the label of link label should be display as following
      | 2 | 0 |  |
      | 2 | 1 |  |
      | 2 | 3 |  |
      | 2 | 4 |  |
      | 2 | 5 |  |
      | 2 | 6 |  |
      | 2 | 7 |  |
      | 2 | 8 |  |
      | 2 | 9 |  |
      | 2 | 10 |  |
      | 2 | 11 |  |
    When user collapse source on node "0"
   	Then the label of all nodes is displayed as following
      | A3 |LEFT	|
      | A2 |LEFT|
    Then there is no link displayed
    When user expands source on node "0"
   	Then the label of all nodes is displayed as following
      | A3 |LEFT	|
      | A2 |LEFT|
      | A1 |RIGHT|
		Then the label of link label should be display as following
      | 2 | 0 |  |    
    
Scenario: Data_67 - Check displayed correctly relationship of nodes (that have many incoming&outgoing nodes on same table) when was Expanded
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_36"
    And user views "Visualization>Display data using configuration" of record has ID is "1" 
    And user generates graph with configuration "V100_Line_Data_67"
    Then the graph should be displayed
    When user expands target on node "0"
   	Then the label of all nodes is displayed as following
      | A1 |LEFT,RIGHT|
      | A2 |	|
      | A3 |	|
		Then the label of link label should be display as following
      | 0 | 0 |  |
      | 0 | 1 |  |
      | 0 | 2 |  |
    When user expands source on node "0"
   	Then the label of all nodes is displayed as following
      | A1 |LEFT,RIGHT|
      | A2 |	|
      | A3 |	|
      | A5 |	|
      | A4 |	|
		Then the label of link label should be display as following
      | 0 | 0 |  |
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 3 | 0 |  |
      | 4 | 0 |  |
		When user collapse source on node "0"
   	Then the label of all nodes is displayed as following
      | A1 |LEFT,RIGHT|
      | A2 |	|
      | A3 |	|
		Then the label of link label should be display as following
      | 0 | 0 |  |
      | 0 | 1 |  |
      | 0 | 2 |  |
		When user collapse target on node "0"
   	Then the label of all nodes is displayed as following
      | A1 |LEFT,RIGHT|
    Then there is no link displayed
    #recursively
    When user expands target recursively on node "0"
   	Then the label of all nodes is displayed as following
      | A1 |LEFT,RIGHT|
      | A2 |	|
      | A3 |	|
		Then the label of link label should be display as following
      | 0 | 0 |  |
      | 0 | 1 |  |
      | 0 | 2 |  |
    When user expands source recursively on node "0"
   	Then the label of all nodes is displayed as following
      | A1 |LEFT,RIGHT|
      | A2 |	|
      | A3 |	|
      | A5 |	|
      | A4 |	|
		Then the label of link label should be display as following
      | 0 | 0 |  |
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 3 | 0 |  |
      | 4 | 0 |  |
		When user collapse source recursively on node "0"
   	Then the label of all nodes is displayed as following
      | A1 |LEFT,RIGHT|
      | A2 |	|
      | A3 |	|
		Then the label of link label should be display as following
      | 0 | 0 |  |
      | 0 | 1 |  |
      | 0 | 2 |  |
		When user collapse target recursively on node "0"
   	Then the label of all nodes is displayed as following
      | A1 |LEFT,RIGHT|
    Then there is no link displayed    
    
Scenario: Data_68 - Check displayed correctly relationship of nodes (that have many incoming&outgoing nodes on same table) when was started by it and a outgoing nodes then Expand/ Collapse them
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_36"
    And user views "Visualization>Display data using configuration" of records have ID are
    	| 1|
    	| 2| 
    	| 4| 
    And user generates graph with configuration "V100_Line_Data_67"
    Then the graph should be displayed
    When user expands source on node "1"
   	Then the label of all nodes is displayed as following
      | A4 |RIGHT|
      | A2 |LEFT	|
      | A1 |LEFT,RIGHT	|
		Then the label of link label should be display as following
      | 2 | 1 |  |
		When user expands target on node "2"
   	Then the label of all nodes is displayed as following
      | A4 |RIGHT|
      | A2 |LEFT	|
      | A1 |LEFT,RIGHT	|
      | A3 |	|
		Then the label of link label should be display as following
      | 2 | 1 |  |
      | 2 | 2 |  |
      | 2 | 3 |  |
		When user expands source on node "2"
   	Then the label of all nodes is displayed as following
      | A4 |	|
      | A2 |LEFT	|
      | A1 |LEFT,RIGHT	|
      | A3 |	|
      | A5 |	|
		Then the label of link label should be display as following
      | 2 | 1 |  |
      | 2 | 2 |  |
      | 2 | 3 |  |
      | 0 | 2 |  |
      | 4 | 2 |  |
		When user collapse target on node "2"
   	Then the label of all nodes is displayed as following
      | A4 ||
      | A2 |LEFT	|
      | A1 |LEFT,RIGHT	|
      | A5 |	|
		Then the label of link label should be display as following
      | 2 | 1 |  |
      | 0 | 2 |  |
      | 4 | 2 |  |
		When user collapse source on node "2"
   	Then the label of all nodes is displayed as following
      | A4 |RIGHT|
      | A2 |LEFT	|
      | A1 |LEFT,RIGHT	|
		Then the label of link label should be display as following
      | 2 | 1 |  |
		When user expands source on node "2"
   	Then the label of all nodes is displayed as following
      | A4 |	|
      | A2 |LEFT	|
      | A1 |LEFT,RIGHT	|
      | A5 |	|
		Then the label of link label should be display as following
      | 2 | 1 |  |
      | 0 | 2 |  |
      | 4 | 2 |  |
		When user collapse source on node "1"
   	Then the label of all nodes is displayed as following
      | A4 |RIGHT|
      | A2 |LEFT	|
      | A1 |LEFT,RIGHT	|
   	Then there is no link displayed
		When user expands source on node "1"
   	Then the label of all nodes is displayed as following
      | A4 |RIGHT|
      | A2 |LEFT	|
      | A1 |LEFT,RIGHT	|
		Then the label of link label should be display as following
      | 2 | 1 |  |
		When user collapse source on node "1"
   	Then the label of all nodes is displayed as following
      | A4 |RIGHT|
      | A2 |LEFT	|
      | A1 |LEFT,RIGHT	|
   	Then there is no link displayed
		#recursively
    When user expands source recursively on node "1"
   	Then the label of all nodes is displayed as following
      | A4 |	|
      | A2 |LEFT	|
      | A1 |LEFT,RIGHT	|
      | A5 |	|
		Then the label of link label should be display as following
      | 2 | 1 |  |
      | 0 | 2 |  |
      | 4 | 2 |  |
		When user expands target recursively on node "2"
   	Then the label of all nodes is displayed as following
      | A4 |	|
      | A2 |LEFT	|
      | A1 |LEFT,RIGHT	|
      | A3 |	|
      | A5 |	|
		Then the label of link label should be display as following
      | 2 | 1 |  |
      | 2 | 2 |  |
      | 2 | 3 |  |
      | 0 | 2 |  |
      | 4 | 2 |  |
		When user expands source recursively on node "2"
   	Then the label of all nodes is displayed as following
      | A4 |	|
      | A2 |LEFT	|
      | A1 |LEFT,RIGHT	|
      | A3 |	|
      | A5 |	|
		Then the label of link label should be display as following
      | 2 | 1 |  |
      | 2 | 2 |  |
      | 2 | 3 |  |
      | 0 | 2 |  |
      | 4 | 2 |  |
		When user collapse target recursively on node "2"
   	Then the label of all nodes is displayed as following
      | A4 ||
      | A2 |LEFT	|
      | A1 |LEFT,RIGHT	|
      | A5 |	|
		Then the label of link label should be display as following
      | 2 | 1 |  |
      | 0 | 2 |  |
      | 4 | 2 |  |
		When user collapse source recursively on node "2"
   	Then the label of all nodes is displayed as following
      | A4 |RIGHT|
      | A2 |LEFT	|
      | A1 |LEFT,RIGHT	|
		Then the label of link label should be display as following
      | 2 | 1 |  |
		When user expands source recursively on node "2"
   	Then the label of all nodes is displayed as following
      | A4 |	|
      | A2 |LEFT	|
      | A1 |LEFT,RIGHT	|
      | A5 |	|
		Then the label of link label should be display as following
      | 2 | 1 |  |
      | 0 | 2 |  |
      | 4 | 2 |  |
      
Scenario: Data_69 - Check displayed correctly relationship of nodes (that have many incoming/outgoing nodes-n level on same table) when was started by it then Expand all levels
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_38"
    And user views "Visualization>Display data using configuration" of record has ID is "30"
    And user generates graph with configuration "V100_Line_Data_69"
    Then the graph should be displayed
    When user expands target on node "0"
   	Then the label of all nodes is displayed as following
      | A30 |RIGHT|
      | A31 |RIGHT|
		Then the label of link label should be display as following
      | 0 | 1 |  |
    When user expands target on node "1"
   	Then the label of all nodes is displayed as following
      | A30 |RIGHT|
      | A31 |RIGHT|
      | A32 |RIGHT|
		Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
    When user expands target on node "2"
   	Then the label of all nodes is displayed as following
      | A30 |RIGHT|
      | A31 |RIGHT|
      | A32 |RIGHT|
      | A33 |RIGHT|
		Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 3 |  |
    When user expands target on node "3"
   	Then the label of all nodes is displayed as following
      | A30 |RIGHT|
      | A31 |RIGHT|
      | A32 |RIGHT|
      | A33 |RIGHT|
      | A34 |RIGHT|
		Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 3 |  |
      | 3 | 4 |  |
    When user expands target on node "4"
   	Then the label of all nodes is displayed as following
      | A30 |RIGHT|
      | A31 |RIGHT|
      | A32 |RIGHT|
      | A33 |RIGHT|
      | A34 |RIGHT|
      | A35 |RIGHT|
		Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 3 |  |
      | 3 | 4 |  |
      | 4 | 5 |  |
    When user expands target on node "5"
   	Then the label of all nodes is displayed as following
      | A30 |RIGHT|
      | A31 |RIGHT|
      | A32 |RIGHT|
      | A33 |RIGHT|
      | A34 |RIGHT|
      | A35 |RIGHT|
      | A36 |RIGHT|
		Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 3 |  |
      | 3 | 4 |  |
      | 4 | 5 |  |
      | 5 | 6 |  |
    When user expands target on node "6"
   	Then the label of all nodes is displayed as following
      | A30 |RIGHT|
      | A31 |RIGHT|
      | A32 |RIGHT|
      | A33 |RIGHT|
      | A34 |RIGHT|
      | A35 |RIGHT|
      | A36 |RIGHT|
      | A37 |RIGHT|
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
      | A30 |RIGHT|
      | A31 |RIGHT|
      | A32 |RIGHT|
      | A33 |RIGHT|
      | A34 |RIGHT|
      | A35 |RIGHT|
      | A36 |RIGHT|
      | A37 |RIGHT|
      | A38 |RIGHT|
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
      | A30 |RIGHT|
      | A31 |RIGHT|
      | A32 |RIGHT|
      | A33 |RIGHT|
      | A34 |RIGHT|
      | A35 |RIGHT|
      | A36 |RIGHT|
      | A37 |RIGHT|
      | A38 |RIGHT|
      | A39 |RIGHT|
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
      | A30 |RIGHT|
      | A31 |RIGHT|
      | A32 |RIGHT|
      | A33 |RIGHT|
      | A34 |RIGHT|
      | A35 |RIGHT|
      | A36 |RIGHT|
      | A37 |RIGHT|
      | A38 |RIGHT|
      | A39 |RIGHT|
      | A40 |RIGHT|
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
      | 9 | 10 |  |
    When user expands target on node "10"
   	Then the label of all nodes is displayed as following
      | A30 |RIGHT|
      | A31 |RIGHT|
      | A32 |RIGHT|
      | A33 |RIGHT|
      | A34 |RIGHT|
      | A35 |RIGHT|
      | A36 |RIGHT|
      | A37 |RIGHT|
      | A38 |RIGHT|
      | A39 |RIGHT|
      | A40 |RIGHT|
      | A41 |RIGHT|
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
      | 9 | 10 |  |
      | 10 | 11 |  |
    When user expands target on node "11"
   	Then the label of all nodes is displayed as following
      | A30 |RIGHT|
      | A31 |RIGHT|
      | A32 |RIGHT|
      | A33 |RIGHT|
      | A34 |RIGHT|
      | A35 |RIGHT|
      | A36 |RIGHT|
      | A37 |RIGHT|
      | A38 |RIGHT|
      | A39 |RIGHT|
      | A40 |RIGHT|
      | A41 |RIGHT|
      | A42 ||
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
      | 9 | 10 |  |
      | 10 | 11 |  |
      | 11 | 12 |  |
    When user collapse target on node "11"
    When user collapse target on node "10"
    When user collapse target on node "9"
    When user collapse target on node "8"
    When user collapse target on node "7"
    When user collapse target on node "6"
    When user collapse target on node "5"
    When user collapse target on node "4"
    When user collapse target on node "3"
    When user collapse target on node "2"
    When user collapse target on node "1"
    When user collapse target on node "0"
   	Then the label of all nodes is displayed as following
      | A30 |RIGHT	|
   	Then there is no link displayed  
   	When user expands target recursively on node "0"
   	Then the label of all nodes is displayed as following
      | A30 |RIGHT|
      | A31 |RIGHT|
      | A32 |RIGHT|
      | A33 |RIGHT|
      | A34 |RIGHT|
      | A35 |RIGHT|
		Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 3 |  |
      | 3 | 4 |  |
      | 4 | 5 |  |
   	When user expands target recursively on node "5"
   	Then the label of all nodes is displayed as following
      | A30 |RIGHT|
      | A31 |RIGHT|
      | A32 |RIGHT|
      | A33 |RIGHT|
      | A34 |RIGHT|
      | A35 |RIGHT|
      | A36 |RIGHT|
      | A37 |RIGHT|
      | A38 |RIGHT|
      | A39 |RIGHT|
      | A40 |RIGHT|
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
      | 9 | 10 |  |
   	When user expands target recursively on node "10"
   	Then the label of all nodes is displayed as following
      | A30 |RIGHT|
      | A31 |RIGHT|
      | A32 |RIGHT|
      | A33 |RIGHT|
      | A34 |RIGHT|
      | A35 |RIGHT|
      | A36 |RIGHT|
      | A37 |RIGHT|
      | A38 |RIGHT|
      | A39 |RIGHT|
      | A40 |RIGHT|
      | A41 |RIGHT|
      | A42 ||
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
      | 9 | 10 |  |
      | 10 | 11 |  |
      | 11 | 12 |  |
    When user collapse target recursively on node "10"
    When user collapse target recursively on node "5"
    When user collapse target recursively on node "0"
   	Then the label of all nodes is displayed as following
      | A30 |RIGHT	|
   	Then there is no link displayed  
   	
Scenario: Data_70 - Check displayed correctly relationship of nodes (that have many incoming/outgoing nodes-n level on same table) when was started by it then Expand all levels and Collapse by any node.
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_38"
    And user views "Visualization>Display data using configuration" of record has ID is "30"
    And user generates graph with configuration "V100_Line_Data_69"
    Then the graph should be displayed
    When user expands target on node "0"
    When user expands target on node "1"
    When user expands target on node "2"
    When user expands target on node "3"
    When user expands target on node "4"
    When user expands target on node "5"
    When user expands target on node "6"
    When user expands target on node "7"
    When user expands target on node "8"
    When user expands target on node "9"
    When user expands target on node "10"
    When user expands target on node "11"
   	Then the label of all nodes is displayed as following
      | A30 |RIGHT|
      | A31 |RIGHT|
      | A32 |RIGHT|
      | A33 |RIGHT|
      | A34 |RIGHT|
      | A35 |RIGHT|
      | A36 |RIGHT|
      | A37 |RIGHT|
      | A38 |RIGHT|
      | A39 |RIGHT|
      | A40 |RIGHT|
      | A41 |RIGHT|
      | A42 ||
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
      | 9 | 10 |  |
      | 10 | 11 |  |
      | 11 | 12 |  |
    When user collapse target on node "4"
   	Then the label of all nodes is displayed as following
      | A30 |RIGHT|
      | A31 |RIGHT|
      | A32 |RIGHT|
      | A33 |RIGHT|
      | A34 |RIGHT|
		Then the label of link label should be display as following
      | 0 | 1 |  |
      | 1 | 2 |  |
      | 2 | 3 |  |
      | 3 | 4 |  |
    When user collapse target on node "0"
   	Then the label of all nodes is displayed as following
      | A30 |RIGHT	|
   	Then there is no link displayed  
    When user expands target on node "0"
   	Then the label of all nodes is displayed as following
      | A30 |RIGHT|
      | A31 |RIGHT|
		Then the label of link label should be display as following
      | 0 | 1 |  |
   	When user expands target recursively on node "1"
   	When user expands target recursively on node "6"
   	When user expands target recursively on node "11"
   	Then the label of all nodes is displayed as following
      | A30 |RIGHT|
      | A31 |RIGHT|
      | A32 |RIGHT|
      | A33 |RIGHT|
      | A34 |RIGHT|
      | A35 |RIGHT|
      | A36 |RIGHT|
      | A37 |RIGHT|
      | A38 |RIGHT|
      | A39 |RIGHT|
      | A40 |RIGHT|
      | A41 |RIGHT|
      | A42 ||
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
      | 9 | 10 |  |
      | 10 | 11 |  |
      | 11 | 12 |  |
    When user collapse target recursively on node "10"
    When user collapse target recursively on node "5"
    When user collapse target recursively on node "0"
   	Then the label of all nodes is displayed as following
      | A30 |RIGHT	|
   	Then there is no link displayed  
   	
Scenario: Data_71 - Check displayed correctly relationship of nodes (that have many incoming/outgoing nodes-n level on same table) when was started by it and outgoing nodes then Expand/Collapse them 
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_38"
    And user views "Visualization>Display data using configuration" of records have ID are
     	| 30|
    	| 31|    	
    And user generates graph with configuration "V100_Line_Data_69"
    Then the graph should be displayed
    When user expands target on node "0"
   	Then the label of all nodes is displayed as following
      | A31 |LEFT,RIGHT|
      | A30 |RIGHT	|
      | A32 |RIGHT	|
		Then the label of link label should be display as following
      | 0 | 2 |  |
    When user expands target on node "2"
   	Then the label of all nodes is displayed as following
      | A31 |LEFT,RIGHT|
      | A30 |RIGHT	|
      | A32 |RIGHT	|
      | A33 |RIGHT	|
		Then the label of link label should be display as following
      | 0 | 2 |  |
      | 2 | 3 |  |
    When user expands target on node "1"
   	Then the label of all nodes is displayed as following
      | A31 |RIGHT|
      | A30 |RIGHT	|
      | A32 |RIGHT	|
      | A33 |RIGHT	|
		Then the label of link label should be display as following
      | 0 | 2 |  |
      | 2 | 3 |  |
      | 1 | 0 |  |
    When user collapse target on node "0"
   	Then the label of all nodes is displayed as following
      | A31 |RIGHT|
      | A30 |RIGHT	|
		Then the label of link label should be display as following
      | 1 | 0 |  |
    When user expands target on node "0"
   	Then the label of all nodes is displayed as following
      | A31 |RIGHT|
      | A30 |RIGHT	|
      | A32 |RIGHT	|
		Then the label of link label should be display as following
      | 1 | 0 |  |
      | 0 | 2 |  |
    When user collapse target on node "1"
   	Then the label of all nodes is displayed as following
      | A31 |LEFT,RIGHT|
      | A30 |RIGHT	|
		Then there is no link displayed  
		
Scenario: Data_72 - Check displayed correctly relationship of nodes (that have many incoming/outgoing nodes-n level on same table) when was started all nodes then Expand/Collapse any node  
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_38"
    And user views "Visualization>Display data using configuration" of records have ID are
     	| 30|
    	| 31|    	
    	| 32|    	
    	| 33|    	
    	| 34|    	
    	| 35|    	
    	| 36|    	
    	| 37|    	
    	| 38|    	
    	| 39|    	
    	| 40|    	
    	| 41|    	
    	| 42|    	
    And user generates graph with configuration "V100_Line_Data_69"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      | A31 |LEFT,RIGHT|
      | A42 |LEFT|
      | A32 |LEFT,RIGHT|
      | A40 |LEFT,RIGHT|
      | A30 |RIGHT|
      | A41 |LEFT,RIGHT|
      | A35 |LEFT,RIGHT|
      | A36 |LEFT,RIGHT|
      | A33 |LEFT,RIGHT|
      | A34 |LEFT,RIGHT|
      | A39 |LEFT,RIGHT|
      | A37 |LEFT,RIGHT|
      | A38 |LEFT,RIGHT|
    When user expands target on node "0"
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      | A31 |LEFT,RIGHT|
      | A42 |LEFT|
      | A32 |RIGHT|
      | A40 |LEFT,RIGHT|
      | A30 ||
      | A41 |LEFT,RIGHT|
      | A35 |LEFT,RIGHT|
      | A36 |LEFT,RIGHT|
      | A33 |LEFT,RIGHT|
      | A34 |LEFT,RIGHT|
      | A39 |LEFT,RIGHT|
      | A37 |LEFT,RIGHT|
      | A38 |LEFT,RIGHT|
		Then the label of link label should be display as following
      | 4 | 0 |  |
      | 0 | 2 |  |
    When user expands target on node "5"
    When user expands source on node "5"
    Then the label of all nodes is displayed as following
      | A31 |LEFT,RIGHT|
      | A42 ||
      | A32 |RIGHT|
      | A40 |LEFT|
      | A30 ||
      | A41 |LEFT,RIGHT|
      | A35 |LEFT,RIGHT|
      | A36 |LEFT,RIGHT|
      | A33 |LEFT,RIGHT|
      | A34 |LEFT,RIGHT|
      | A39 |LEFT,RIGHT|
      | A37 |LEFT,RIGHT|
      | A38 |LEFT,RIGHT|
		Then the label of link label should be display as following
      | 4 | 0 |  |
      | 0 | 2 |  |
      | 3 | 5 |  |
      | 5 | 1 |  |
    When user expands source on node "3"
    Then the label of all nodes is displayed as following
      | A31 |LEFT,RIGHT|
      | A42 ||
      | A32 |RIGHT|
      | A40 |LEFT|
      | A30 ||
      | A41 |LEFT,RIGHT|
      | A35 |LEFT,RIGHT|
      | A36 |LEFT,RIGHT|
      | A33 |LEFT,RIGHT|
      | A34 |LEFT,RIGHT|
      | A39 |LEFT|
      | A37 |LEFT,RIGHT|
      | A38 |LEFT,RIGHT|
		Then the label of link label should be display as following
      | 4 | 0 |  |
      | 0 | 2 |  |
      | 3 | 5 |  |
      | 5 | 1 |  |
      | 10 | 3 |  |
    When user collapse target on node "5"
    When user collapse source on node "5"
    Then the label of all nodes is displayed as following
      | A31 |LEFT,RIGHT|
      | A42 |LEFT|
      | A32 |RIGHT|
      | A40 |LEFT,RIGHT|
      | A30 ||
      | A41 |LEFT,RIGHT|
      | A35 |LEFT,RIGHT|
      | A36 |LEFT,RIGHT|
      | A33 |LEFT,RIGHT|
      | A34 |LEFT,RIGHT|
      | A39 |LEFT,RIGHT|
      | A37 |LEFT,RIGHT|
      | A38 |LEFT,RIGHT|
		Then the label of link label should be display as following
      | 0 | 2 |  |
      | 4 | 0 |  |
		
		
Scenario: Data_72 - Check displayed correctly relationship of nodes (that have many incoming/outgoing nodes-n level on same table) when was started all nodes then Expand/Collapse any node  
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_38"
    And user views "Visualization>Display data using configuration" of records have ID are
     	| 30|
    	| 31|    	
    	| 32|    	
    	| 33|    	
    	| 34|    	
    	| 35|    	
    	| 36|    	
    	| 37|    	
    	| 38|    	
    	| 39|    	
    	| 40|    	
    	| 41|    	
    	| 42|    	
    And user generates graph with configuration "V100_Line_Data_69"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      | A31 |LEFT,RIGHT|
      | A42 |LEFT|
      | A32 |LEFT,RIGHT|
      | A40 |LEFT,RIGHT|
      | A30 |RIGHT|
      | A41 |LEFT,RIGHT|
      | A35 |LEFT,RIGHT|
      | A36 |LEFT,RIGHT|
      | A33 |LEFT,RIGHT|
      | A34 |LEFT,RIGHT|
      | A39 |LEFT,RIGHT|
      | A37 |LEFT,RIGHT|
      | A38 |LEFT,RIGHT|
    When user expands target on node "0"
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      | A31 |LEFT,RIGHT|
      | A42 |LEFT|
      | A32 |RIGHT|
      | A40 |LEFT,RIGHT|
      | A30 ||
      | A41 |LEFT,RIGHT|
      | A35 |LEFT,RIGHT|
      | A36 |LEFT,RIGHT|
      | A33 |LEFT,RIGHT|
      | A34 |LEFT,RIGHT|
      | A39 |LEFT,RIGHT|
      | A37 |LEFT,RIGHT|
      | A38 |LEFT,RIGHT|
		Then the label of link label should be display as following
      | 4 | 0 |  |
      | 0 | 2 |  |
    When user expands target on node "5"
    When user expands source on node "5"
    Then the label of all nodes is displayed as following
      | A31 |LEFT,RIGHT|
      | A42 ||
      | A32 |RIGHT|
      | A40 |LEFT|
      | A30 ||
      | A41 |LEFT,RIGHT|
      | A35 |LEFT,RIGHT|
      | A36 |LEFT,RIGHT|
      | A33 |LEFT,RIGHT|
      | A34 |LEFT,RIGHT|
      | A39 |LEFT,RIGHT|
      | A37 |LEFT,RIGHT|
      | A38 |LEFT,RIGHT|
		Then the label of link label should be display as following
      | 4 | 0 |  |
      | 0 | 2 |  |
      | 3 | 5 |  |
      | 5 | 1 |  |
    When user expands source on node "3"
    Then the label of all nodes is displayed as following
      | A31 |LEFT,RIGHT|
      | A42 ||
      | A32 |RIGHT|
      | A40 |LEFT|
      | A30 ||
      | A41 |LEFT,RIGHT|
      | A35 |LEFT,RIGHT|
      | A36 |LEFT,RIGHT|
      | A33 |LEFT,RIGHT|
      | A34 |LEFT,RIGHT|
      | A39 |LEFT|
      | A37 |LEFT,RIGHT|
      | A38 |LEFT,RIGHT|
		Then the label of link label should be display as following
      | 4 | 0 |  |
      | 0 | 2 |  |
      | 3 | 5 |  |
      | 5 | 1 |  |
      | 10 | 3 |  |
    When user collapse target on node "5"
    When user collapse source on node "5"
    Then the label of all nodes is displayed as following
      | A31 |LEFT,RIGHT|
      | A42 |LEFT|
      | A32 |RIGHT|
      | A40 |LEFT,RIGHT|
      | A30 ||
      | A41 |LEFT,RIGHT|
      | A35 |LEFT,RIGHT|
      | A36 |LEFT,RIGHT|
      | A33 |LEFT,RIGHT|
      | A34 |LEFT,RIGHT|
      | A39 |LEFT,RIGHT|
      | A37 |LEFT,RIGHT|
      | A38 |LEFT,RIGHT|
		Then the label of link label should be display as following
      | 0 | 2 |  |
      | 4 | 0 |  |
    #recursively
    When user expands target recursively on node "5"
    When user expands source recursively on node "5"
    Then the label of all nodes is displayed as following
      | A31 |LEFT,RIGHT|
      | A42 ||
      | A32 |RIGHT|
      | A40 |LEFT|
      | A30 ||
      | A41 |LEFT,RIGHT|
      | A35 |LEFT,RIGHT|
      | A36 |LEFT|
      | A33 |LEFT,RIGHT|
      | A34 |LEFT,RIGHT|
      | A39 |LEFT|
      | A37 |LEFT|
      | A38 |LEFT|
		Then the label of link label should be display as following
      | 0 | 2 |  |
      | 4 | 0 |  |
      | 5 | 1 |  |
      | 12 | 10 |  |
      | 3 | 5 |  |
      | 11 | 12 |  |
      | 7 | 11 |  |
      | 10 | 3 |  |
    When user collapse target recursively on node "5"
    When user collapse source recursively on node "5"
    Then the label of all nodes is displayed as following
      | A31 |LEFT,RIGHT|
      | A42 |LEFT|
      | A32 |RIGHT|
      | A40 |LEFT,RIGHT|
      | A30 ||
      | A41 |LEFT,RIGHT|
      | A35 |LEFT,RIGHT|
      | A36 |LEFT,RIGHT|
      | A33 |LEFT,RIGHT|
      | A34 |LEFT,RIGHT|
      | A39 |LEFT,RIGHT|
      | A37 |LEFT,RIGHT|
      | A38 |LEFT,RIGHT|
		Then the label of link label should be display as following
      | 0 | 2 |  |
      | 4 | 0 |  |
		
Scenario: Data_73 - Check displayed correctly relationship of nodes (that have many incoming/outgoing nodes-n level on same table) when was started by node at last level then Expand all levels and Collapse by start node.  
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_38"
    And user views "Visualization>Display data using configuration" of record has ID is "25"  	
    And user generates graph with configuration "V100_Line_Data_69"
    Then the graph should be displayed
    When user expands source on node "0"
    When user expands source on node "1"
    When user expands source on node "2"
    When user expands source on node "3"
    When user expands source on node "4"
    When user expands source on node "5"
    When user expands source on node "6"
    When user expands source on node "7"
    When user expands source on node "8"
    When user expands source on node "9"
    When user expands source on node "10"
    When user expands source on node "11"
    When user expands source on node "12"
    When user expands source on node "13"
    When user expands source on node "14"
    When user expands source on node "15"
    When user expands source on node "16"
    When user expands source on node "17"
    When user expands source on node "18"
    When user expands source on node "19"
    When user expands source on node "20"
    When user expands source on node "21"
    When user expands source on node "22"
    When user expands source on node "23"
    When user expands source on node "24"
    Then the label of all nodes is displayed as following
      | A25 |LEFT|
      | A24 |LEFT|
      | A23 |LEFT|
      | A22 |LEFT|
      | A21 |LEFT|
      | A20 |LEFT|
      | A19 |LEFT|
      | A18 |LEFT|
      | A17 |LEFT|
      | A16 |LEFT|
      | A15 |LEFT|
      | A14 |LEFT|
      | A13 |LEFT|
      | A12 |LEFT|
      | A11 |LEFT|
      | A10 |LEFT|
      | A9 |LEFT|
      | A8 |LEFT|
      | A7 |LEFT|
      | A6 |LEFT|
      | A5 |LEFT|
      | A4 |LEFT|
      | A3 |LEFT|
      | A2 |LEFT|
      | A1 ||
		Then the label of link label should be display as following
      | 1 | 0 |  |
      | 2 | 1 |  |
      | 3 | 2 |  |
      | 4 | 3 |  |
      | 5 | 4 |  |
      | 6 | 5 |  |
      | 7 | 6 |  |
      | 8 | 7 |  |
      | 9 | 8 |  |
      | 10 | 9 |  |
      | 11 | 10 |  |
      | 12 | 11 |  |
      | 13 | 12 |  |
      | 14 | 13 |  |
      | 15 | 14 |  |
      | 16 | 15 |  |
      | 17 | 16 |  |
      | 18 | 17 |  |
      | 19 | 18 |  |
      | 20 | 19 |  |
      | 21 | 20 |  |
      | 22 | 21 |  |
      | 23 | 22 |  |
      | 24 | 23 |  |
    When user collapse source on node "0"
    Then the label of all nodes is displayed as following
      | A25 |LEFT|
    Then there is no link displayed  
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      | A25 |LEFT|
      | A24 |LEFT|
		Then the label of link label should be display as following
      | 1 | 0 |  |
      
Scenario: Data_74 - Check displayed correctly relationship of nodes (that have many incoming/outgoing nodes-more than 20 level on same table) when was started by it then Expand all levels  
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_38"
    And user views "Visualization>Display data using configuration" of record has ID is "1"  	
    And user generates graph with configuration "V100_Line_Data_69"
    Then the graph should be displayed
    When user expands target recursively on node "0"
    When user expands target recursively on node "1"
    When user expands target recursively on node "8"
    When user expands target recursively on node "14"
    When user expands target recursively on node "16"
    Then the label of all nodes is displayed as following
      | A25 ||
      | A24 |RIGHT|
      | A23 |RIGHT|
      | A22 |RIGHT|
      | A21 |RIGHT|
      | A20 |RIGHT|
      | A19 |RIGHT|
      | A18 |RIGHT|
      | A17 |RIGHT|
      | A16 |RIGHT|
      | A15 |RIGHT|
      | A14 |RIGHT|
      | A13 |RIGHT|
      | A12 |RIGHT|
      | A11 |RIGHT|
      | A10 |RIGHT|
      | A9 |RIGHT|
      | A8 |RIGHT|
      | A7 |RIGHT|
      | A6 |RIGHT|
      | A5 |RIGHT|
      | A4 |RIGHT|
      | A3 |RIGHT|
      | A2 |RIGHT|
      | A1 |RIGHT|
		Then the label of link label should be display as following
			 | 5 | 4 |  |
			 | 3 | 2 |  |
			 | 4 | 3 |  |
			 | 2 | 1 |  |
			 | 0 | 5 |  |
			 | 1 | 6 |  |
			 | 10 | 9 |  |
			 | 7 | 8 |  |
			 | 6 | 10 |  |
			 | 9 | 7 |  |
			 | 15 | 14 |  |
			 | 8 | 11 |  |
			 | 13 | 12 |  |
			 | 11 | 13 |  |
			 | 12 | 15 |  |
			 | 20 | 17 |  |
			 | 19 | 18 |  |
			 | 14 | 19 |  |
			 | 18 | 20 |  |
			 | 17 | 16 |  |
			 | 21 | 24 |  |
			 | 16 | 22 |  |
			 | 22 | 21 |  |
			 | 24 | 23 |  |
      When user collapse target on node "20"
      Then the label of all nodes is displayed as following
      | A19 |RIGHT|
      | A18 |RIGHT|
      | A17 |RIGHT|
      | A16 |RIGHT|
      | A15 |RIGHT|
      | A14 |RIGHT|
      | A13 |RIGHT|
      | A12 |RIGHT|
      | A11 |RIGHT|
      | A10 |RIGHT|
      | A9 |RIGHT|
      | A8 |RIGHT|
      | A7 |RIGHT|
      | A6 |RIGHT|
      | A5 |RIGHT|
      | A4 |RIGHT|
      | A3 |RIGHT|
      | A2 |RIGHT|
      | A1 |RIGHT|
		Then the label of link label should be display as following
			 | 5 | 4 |  |
			 | 3 | 2 |  |
			 | 4 | 3 |  |
			 | 2 | 1 |  |
			 | 0 | 5 |  |
			 | 1 | 6 |  |
			 | 10 | 9 |  |
			 | 7 | 8 |  |
			 | 6 | 10 |  |
			 | 9 | 7 |  |
			 | 15 | 14 |  |
			 | 8 | 11 |  |
			 | 13 | 12 |  |
			 | 11 | 13 |  |
			 | 12 | 15 |  |
			 | 19 | 18 |  |
			 | 14 | 19 |  |
			 | 18 | 20 |  |
		When user expands target recursively on node "20"    
		Then the label of all nodes is displayed as following
      | A24 |RIGHT|
      | A23 |RIGHT|
      | A22 |RIGHT|
      | A21 |RIGHT|
      | A20 |RIGHT|
      | A19 |RIGHT|
      | A18 |RIGHT|
      | A17 |RIGHT|
      | A16 |RIGHT|
      | A15 |RIGHT|
      | A14 |RIGHT|
      | A13 |RIGHT|
      | A12 |RIGHT|
      | A11 |RIGHT|
      | A10 |RIGHT|
      | A9 |RIGHT|
      | A8 |RIGHT|
      | A7 |RIGHT|
      | A6 |RIGHT|
      | A5 |RIGHT|
      | A4 |RIGHT|
      | A3 |RIGHT|
      | A2 |RIGHT|
      | A1 |RIGHT|
		Then the label of link label should be display as following
			 | 5 | 4 |  |
			 | 3 | 2 |  |
			 | 4 | 3 |  |
			 | 2 | 1 |  |
			 | 0 | 5 |  |
			 | 1 | 6 |  |
			 | 10 | 9 |  |
			 | 7 | 8 |  |
			 | 6 | 10 |  |
			 | 9 | 7 |  |
			 | 15 | 14 |  |
			 | 8 | 11 |  |
			 | 13 | 12 |  |
			 | 11 | 13 |  |
			 | 12 | 15 |  |
			 | 19 | 18 |  |
			 | 14 | 19 |  |
			 | 18 | 20 |  |
			 | 21 | 24 |  |
			 | 16 | 22 |  |
			 | 20 | 17 |  |
			 | 17 | 16 |  |
			 | 22 | 21 |  |
			 
Scenario: Data_75 - Check displayed correctly relationship of nodes (that have many incoming/outgoing nodes-more than 20 level on same table) when was started by node at last level then Expand all levels and Collapse by start node.  
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_38"
    And user views "Visualization>Display data using configuration" of record has ID is "25"  	
    And user generates graph with configuration "V100_Line_Data_69"
    Then the graph should be displayed
    When user expands source recursively on node "0"
    When user expands source recursively on node "2"
    When user expands source recursively on node "7"
    When user expands source recursively on node "11"
    When user expands source recursively on node "18"
    Then the label of all nodes is displayed as following
      | A25 |LEFT|
      | A24 |LEFT|
      | A23 |LEFT|
      | A22 |LEFT|
      | A21 |LEFT|
      | A20 |LEFT|
      | A19 |LEFT|
      | A18 |LEFT|
      | A17 |LEFT|
      | A16 |LEFT|
      | A15 |LEFT|
      | A14 |LEFT|
      | A13 |LEFT|
      | A12 |LEFT|
      | A11 |LEFT|
      | A10 |LEFT|
      | A9 |LEFT|
      | A8 |LEFT|
      | A7 |LEFT|
      | A6 |LEFT|
      | A5 |LEFT|
      | A4 |LEFT|
      | A3 |LEFT|
      | A2 |LEFT|
      | A1 ||
		Then the label of link label should be display as following
		 | 3 | 5 |  |
		 | 1 | 4 |  |
		 | 2 | 1 |  |
		 | 4 | 3 |  |
		 | 5 | 0 |  |
		 | 7 | 6 |  |
		 | 9 | 8 |  |
		 | 10 | 2 |  |
		 | 6 | 9 |  |
		 | 8 | 10 |  |
		 | 13 | 12 |  |
		 | 15 | 14 |  |
		 | 12 | 15 |  |
		 | 11 | 13 |  |
		 | 14 | 7 |  |
		 | 17 | 16 |  |
		 | 20 | 19 |  |
		 | 16 | 20 |  |
		 | 18 | 17 |  |
		 | 19 | 11 |  |
		 | 22 | 21 |  |
		 | 24 | 18 |  |
		 | 21 | 24 |  |
		 | 23 | 22 |  |
   When user collapse source on node "0"
   When user expands source on node "0"
   Then the label of all nodes is displayed as following
      | A25 |LEFT|
      | A24 |LEFT|
	Then the label of link label should be display as following
		 | 5 | 0 |  |

#Failed
Scenario: Data_77 -Failed- Check displayed correctly relationship of nodes (that has a recursive nodes-n level on same table) when was started by it and outgoing nodes then Expand/Collapse them  
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_43"
    And user views "Visualization>Display data using configuration" of records have ID are
    	|1|
    	|2|  	
    And user generates graph with configuration "V100_Line_Data_76"
    Then the graph should be displayed
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
			| A1 | LEFT,RIGHT |	|
			| A2 | RIGHT |	|
		Then the label of link label should be display as following
 			| 0 | 1 |  |
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
			| A1 | LEFT,RIGHT |	|
			| A2 | RIGHT |	|
      | A3 | LEFT |	|
		Then the label of link label should be display as following
 			| 0 | 1 |  |
		 	| 2 | 0 |  |
		When user expands target on node "1"
		Then the label of all nodes is displayed as following
			| A1 | LEFT,RIGHT |	|
			| A2 | RIGHT |	|
      | A3 |  |	|
		Then the label of link label should be display as following
 			| 0 | 1 |  |
		 	| 2 | 0 |  |
		  | 1 | 2 |  |
		When user collapse target on node "0"
		Then the label of all nodes is displayed as following
			| A1 | LEFT,RIGHT |	|
			| A2 | LEFT,RIGHT |	|
      | A3 | LEFT |	|
		Then the label of link label should be display as following
		 	| 2 | 0 |  |
		When user expands target on node "1"
		Then the label of all nodes is displayed as following
			| A1 | LEFT,RIGHT |	|
			| A2 | LEFT,RIGHT |	|
      | A3 |  |	|
		Then the label of link label should be display as following
		 	| 2 | 0 |  |
		  | 1 | 2 |  |
#10. Collapse source of A1 Failed
		When user collapse source on node "0"
		Then the label of all nodes is displayed as following
			| A1 | LEFT,RIGHT |	|
			| A2 | LEFT,RIGHT |	|
      | A3 | RIGHT |	|
		Then the label of link label should be display as following
		 	| 1 | 2 |  |

		 
Scenario: Data_78 - Check displayed correctly relationship of nodes (that has a recursive nodes-n level on same table) when was started by it and incoming nodes then Expand/Collapse them  
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_43"
    And user views "Visualization>Display data using configuration" of records have ID are
    	|1|
    	|3|  	
    And user generates graph with configuration "V100_Line_Data_76"
    Then the graph should be displayed
    When user expands target on node "1"
    Then the label of all nodes is displayed as following
      | A1 |RIGHT|
      | A3 |LEFT,RIGHT|
		Then the label of link label should be display as following
 			| 1 | 0 |  |
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A1 |RIGHT|
      | A3 |LEFT,RIGHT|
      | A2 |RIGHT|
		Then the label of link label should be display as following
		 	| 0 | 2 |  |
		 	| 1 | 0 |  |
		When user expands target on node "2"
		Then the label of all nodes is displayed as following
      | A1 |RIGHT|
      | A3 |RIGHT|
      | A2 |RIGHT|
		Then the label of link label should be display as following
		 | 0 | 2 |  |
		 | 1 | 0 |  |
		 | 2 | 1 |  |
		When user collapse target on node "1"
		Then the label of all nodes is displayed as following
      | A1 |LEFT,RIGHT|
      | A3 |LEFT,RIGHT|
   	Then there is no link displayed  
   	When user expands target recursively on node "1"
		Then the label of all nodes is displayed as following
      | A1 |RIGHT|
      | A3 |RIGHT|
      | A2 |RIGHT|
		Then the label of link label should be display as following
		 | 0 | 2 |  |
		 | 1 | 0 |  |
		 | 2 | 1 |  |
		When user collapse target on node "1"
		Then the label of all nodes is displayed as following
      | A1 |LEFT,RIGHT|
      | A3 |LEFT,RIGHT|
   	Then there is no link displayed  
   	
Scenario: Data_79 - Check displayed correctly relationship of nodes (that has a recursive nodes-n level on same table) when was started by outgoing and incoming nodes then Expand/Collapse them  
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_43"
    And user views "Visualization>Display data using configuration" of records have ID are
    	|2|
    	|3|  	
    And user generates graph with configuration "V100_Line_Data_76"
    Then the graph should be displayed
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A3 |LEFT,RIGHT|
      | A2 |LEFT,RIGHT|
      | A1 |RIGHT|
		Then the label of link label should be display as following
 			 | 0 | 2 |  |
 		When user expands target on node "1"
    Then the label of all nodes is displayed as following
      | A3 |RIGHT|
      | A2 |LEFT,RIGHT|
      | A1 |RIGHT|
		Then the label of link label should be display as following
		 | 0 | 2 |  |
		 | 1 | 0 |  |
 		When user expands target on node "2"
    Then the label of all nodes is displayed as following
      | A3 |RIGHT|
      | A2 |RIGHT|
      | A1 |RIGHT|
		Then the label of link label should be display as following
		 | 0 | 2 |  |
		 | 1 | 0 |  |
		 | 2 | 1 |  |
 		When user collapse target on node "1"
    Then the label of all nodes is displayed as following
      | A3 |LEFT,RIGHT|
      | A2 |LEFT,RIGHT|
    Then there is no link displayed
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A3 |LEFT,RIGHT|
      | A2 |LEFT,RIGHT|
      | A1 |RIGHT|
		Then the label of link label should be display as following
 			 | 0 | 2 |  |
 		When user expands target recursively on node "1"
   	Then the label of all nodes is displayed as following
      | A3 |RIGHT|
      | A2 |RIGHT|
      | A1 |RIGHT|
		Then the label of link label should be display as following
		 | 0 | 2 |  |
		 | 1 | 0 |  |
		 | 2 | 1 |  |
		 
Scenario: Data_80 - Check displayed correctly relationship of nodes (that has a recursive nodes-n level on same table) when was started by all nodes then Expand/Collapse them  
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_43"
    And user views "Visualization>Display data using configuration" of records have ID are
    	|1|
    	|2|
    	|3|  	
    And user generates graph with configuration "V100_Line_Data_76"
    Then the graph should be displayed
    #5. Expand target of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A1 |LEFT,RIGHT|
      | A3 |LEFT,RIGHT|
      | A2 |RIGHT|
		Then the label of link label should be display as following
 			 | 0 | 2 |  |
		#6. Expand source of A3
    When user expands source on node "1"
    Then the label of all nodes is displayed as following
      | A1 |LEFT,RIGHT|
      | A3 |LEFT,RIGHT|
      | A2 ||
		Then the label of link label should be display as following
 			 | 0 | 2 |  |
 			 | 2 | 1 |  |
		#7. Expand target of  A3
    When user expands target on node "1"
    Then the label of all nodes is displayed as following
      | A1 |RIGHT|
      | A3 |LEFT,RIGHT|
      | A2 ||
		Then the label of link label should be display as following
 			 | 0 | 2 |  |
 			 | 2 | 1 |  |
 			 | 1 | 0 |  |
		#8. Collapse target of A1
		When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      | A1 |RIGHT|
      | A3 |LEFT,RIGHT|
      | A2 |LEFT,RIGHT|
		Then the label of link label should be display as following
 			 | 1 | 0 |  |
		#9. Collapse target of A3
		When user collapse target on node "1"
    Then the label of all nodes is displayed as following
      | A1 |LEFT,RIGHT|
      | A3 |LEFT,RIGHT|
      | A2 |LEFT,RIGHT|
		Then there is no link displayed
		
Scenario: Data_81 - Check displayed correctly relationship of nodes (it have recursives node(n level) on same table) when starting by it and expand&collapse render nodes after that.   
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_48"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "V100_Line_Data_81"
    Then the graph should be displayed
#5. Expand target of A1
		When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A1 |LEFT,RIGHT|
      | A3 |LEFT,RIGHT|
      | A2 |RIGHT|
		Then the label of link label should be display as following
				| 0 | 1 |  |
 			 	| 0 | 2 |  |
#6. Expand target of A2
		When user expands target on node "2"
    Then the label of all nodes is displayed as following
      | A1 |LEFT,RIGHT|
      | A3 |RIGHT|
      | A2 |RIGHT|
		Then the label of link label should be display as following
				| 0 | 1 |  |
 			 	| 0 | 2 |  |
 			 	| 2 | 1 |  |
#7. Collapse target of A2
		When user collapse target on node "2"
    Then the label of all nodes is displayed as following
      | A1 |LEFT,RIGHT|
      | A3 |LEFT,RIGHT|
      | A2 |RIGHT|
		Then the label of link label should be display as following
				| 0 | 1 |  |
 			 	| 0 | 2 |  |
#8. Expand target of A3
		When user expands target on node "1"
    Then the label of all nodes is displayed as following
      | A1 |RIGHT|
      | A3 |LEFT,RIGHT|
      | A2 |RIGHT|
		Then the label of link label should be display as following
		 | 0 | 1 |  |
		 | 0 | 2 |  |
		 | 1 | 0 |  |
#9. Collapse target of A1
		When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      | A1 |LEFT,RIGHT|
		Then there is no link displayed
#10. Repeated step 5 with recursively service
		When user expands target recursively on node "0"
    Then the label of all nodes is displayed as following
      | A1 |RIGHT|
      | A3 |RIGHT|
      | A2 |RIGHT|
		Then the label of link label should be display as following
		 | 1 | 0 |  |
		 | 0 | 1 |  |
		 | 2 | 1 |  |
		 | 0 | 2 |  |
		 
Scenario: Data_82 - Check displayed correctly relationship of nodes (it have recursives node(n level) on same table) when starting by it and expand&collapse them after that.    
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_48"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "V100_Line_Data_81"
    Then the graph should be displayed
#5. Expand target of A1
		When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A1 |LEFT,RIGHT|
      | A3 |LEFT,RIGHT|
      | A2 |RIGHT|
		Then the label of link label should be display as following
				| 0 | 1 |  |
 			 	| 0 | 2 |  |
#6. Expand target recursively of A2
		When user expands target recursively on node "2"
    Then the label of all nodes is displayed as following
      | A1 |RIGHT|
      | A3 |RIGHT|
      | A2 |RIGHT|
		Then the label of link label should be display as following
		 | 1 | 0 |  |
		 | 0 | 1 |  |
		 | 2 | 1 |  |
		 | 0 | 2 |  |
#7. Collapse target of A1
		When user collapse target on node "0"
		Then the label of all nodes is displayed as following
      | A1 |LEFT,RIGHT|
    Then there is no link displayed
#8. Expand target of A1
		When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A1 |LEFT,RIGHT|
      | A3 |LEFT,RIGHT|
      | A2 |RIGHT|
		Then the label of link label should be display as following
				| 0 | 1 |  |
 			 	| 0 | 2 |  |

Scenario: Data_83 - Check displayed correctly relationship of nodes (it have recursives node(n level) on same table) when starting by all nodes and expand&collapse them after that. 
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_48"
    And user views "Visualization>Display data using configuration" of records have ID are
    	|1|
    	|2| 
    	|3| 	
    And user generates graph with configuration "V100_Line_Data_84"
    Then the graph should be displayed
#5. Expand target of A2    
    When user expands target on node "1"
    Then the label of all nodes is displayed as following
			| A1 | LEFT,RIGHT |	|
			| A2 | LEFT,RIGHT |	|
			| A3 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
 			| 1 | 0 |  |
#6. Expand target of A3 			
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
			| A1 | RIGHT |	|
			| A2 | LEFT,RIGHT |	|
			| A3 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
 			| 1 | 0 |  |
 			| 0 | 2 |  |
 #7. Expand target of A1			
		When user expands target on node "2"
		Then the label of all nodes is displayed as following
			| A1 | RIGHT |	|
			| A2 | RIGHT |	|
			| A3 | RIGHT |	|
		Then the label of link label should be display as following
 			| 1 | 0 |  |
 			| 0 | 2 |  |
 			| 2 | 0 |  |
 			| 2 | 1 |  |
#8. Expand source of A2		  
		When user collapse target on node "1"
		Then the label of all nodes is displayed as following
			| A1 | LEFT,RIGHT |	|
			| A2 | LEFT,RIGHT |	|
			| A3 | LEFT,RIGHT |	|
		Then there is no link displayed
#9. Expand target recursively of A2
		When user expands target recursively on node "1"
  	Then the label of all nodes is displayed as following
			| A1 | RIGHT |	|
			| A2 | RIGHT |	|
			| A3 | RIGHT |	|
		Then the label of link label should be display as following
 			| 1 | 0 |  |
 			| 0 | 2 |  |
 			| 2 | 0 |  |
 			| 2 | 1 |  |
 			 	
Scenario: Data_85 - Check displayed correctly relationship of nodes (it have recursives and outgoing and incoming nodes(n level) on same table) when starting by recursive nodes and expand&collapse render after that    
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_51"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "V100_Line_Data_84"
    Then the graph should be displayed
#5. Expand target of A1
		When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A1 |LEFT,RIGHT|
      | A2 |LEFT,RIGHT|
		Then the label of link label should be display as following
				| 0 | 1 |  |
#6. Expand target of A2
		When user expands target on node "1"
    Then the label of all nodes is displayed as following
      | A1 |RIGHT|
      | A2 |LEFT,RIGHT|
      | A4 |RIGHT|
		Then the label of link label should be display as following
				| 0 | 1 |  |
				| 1 | 2 |  |
				| 1 | 0 |  |
#7. Collapse target of A2
		When user collapse target on node "1"
		When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A1 |LEFT,RIGHT|
      | A2 |LEFT,RIGHT|
		Then the label of link label should be display as following
				| 0 | 1 |  |
#8. Collapse target of A1
		When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      | A1 |LEFT,RIGHT|
		Then there is no link displayed
#9. Expand target of A1
		When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A1 |LEFT,RIGHT|
      | A2 |LEFT,RIGHT|
		Then the label of link label should be display as following
				| 0 | 1 |  |
#10. Repeated step 6 with recursively service
		When user expands target recursively on node "1"
    Then the label of all nodes is displayed as following
      | A1 |RIGHT|
      | A2 |LEFT,RIGHT|
      | A4 |RIGHT|
      | A5 |RIGHT|
      | A6 |RIGHT|
      | A7 |RIGHT|
      | A8 ||
		Then the label of link label should be display as following
		 | 0 | 1 |  |
		 | 3 | 6 |  |
		 | 6 | 5 |  |
		 | 1 | 2 |  |
		 | 2 | 4 |  |
		 | 4 | 3 |  |
		 | 1 | 0 |  |
		 
Scenario: Data_86 - Check displayed correctly state of relationship of nodes (it have recursives and outgoing and incoming nodes(n level) on same table)  when starting by it and expand&collapse them after that    
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_51"
    And user views "Visualization>Display data using configuration" of record has ID is "2"
    And user generates graph with configuration "V100_Line_Data_84"
    Then the graph should be displayed
#5. Expand target of A2
		When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A2 |LEFT,RIGHT|
      | A4 |RIGHT|
      | A1 |RIGHT|
		Then the label of link label should be display as following
				| 0 | 1 |  |
				| 0 | 2 |  |
#6. Expand source of A2
		When user expands source on node "0"
    Then the label of all nodes is displayed as following
      | A2 |LEFT,RIGHT|
      | A4 |RIGHT|
      | A1 ||
      | A3 ||
		Then the label of link label should be display as following
				| 0 | 1 |  |
				| 0 | 2 |  |
				| 1 | 0 |  |
				| 3 | 0 |  |
#8. Expand recursively target of A4
		When user expands target recursively on node "2"
    Then the label of all nodes is displayed as following
      | A2 |LEFT,RIGHT|
      | A1 ||
      | A4 |RIGHT|
      | A3 ||
      | A6 |RIGHT|
      | A5 |RIGHT|
      | A8 ||
      | A7 |RIGHT|
		Then the label of link label should be display as following
		 | 0 | 2 |  |
		 | 0 | 1 |  |
		 | 1 | 0 |  |
		 | 3 | 0 |  |
		 | 4 | 7 |  |
		 | 7 | 6 |  |
		 | 2 | 5 |  |
		 | 5 | 4 |  |
		 
Scenario: Data_91 - (Special case 06) Check displayed correctly of relationship of nodes (it have same outgoing and incoming nodes(n level) on same table) when starting by incoming node and expand&collapse them and render nodes after that    
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_58"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "V100_Line_Data_91"
    Then the graph should be displayed
#5. Expand target of A1
		When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A1 |RIGHT|
      | A3 |LEFT,RIGHT|
      | A2 |RIGHT|
		Then the label of link label should be display as following
				| 0 | 1 |  |
				| 0 | 2 |  |
#6. Expand target of A2
		When user expands target on node "2"
    Then the label of all nodes is displayed as following
      | A1 |RIGHT|
      | A3 |RIGHT|
      | A2 |RIGHT|
      | A4 |LEFT,RIGHT|
		Then the label of link label should be display as following
				| 0 | 1 |  |
				| 0 | 2 |  |
				| 2 | 3 |  |
 				| 2 | 1 |  |
#7. Expand target & source of A4
		When user expands target on node "3"
		When user expands source on node "3"
    Then the label of all nodes is displayed as following
      | A1 |RIGHT|
      | A3 ||
      | A2 |RIGHT|
      | A4 |LEFT,RIGHT|
      | A5 ||
		Then the label of link label should be display as following
		 | 0 | 1 |  |
		 | 0 | 2 |  |
		 | 2 | 3 |  |
		 | 2 | 1 |  |
		 | 3 | 4 |  |
		 | 1 | 3 |  |
#8. Collapse A2
		When user collapse target on node "2"
		When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A1 |RIGHT|
      | A3 |LEFT,RIGHT|
      | A2 |RIGHT|
		Then the label of link label should be display as following
				| 0 | 1 |  |
				| 0 | 2 |  |
#9. Expand recursively target of A2
		When user expands target recursively on node "2"
    Then the label of all nodes is displayed as following
      | A1 |RIGHT|
      | A3 |RIGHT|
      | A2 |RIGHT|
      | A4 |RIGHT|
      | A5 ||
		Then the label of link label should be display as following
		 | 0 | 1 |  |
		 | 0 | 2 |  |
		 | 2 | 3 |  |
		 | 2 | 1 |  |
		 | 3 | 4 |  |
		 | 1 | 3 |  |
		 
Scenario: Data_93 - Check displayed correctly of relationship of nodes (it have same many outgoing&incoming nodes(n level) on same table) when starting by incoming node and expand&collapse them and render nodes after that    
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_61"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "V100_Line_Data_93"
    Then the graph should be displayed
#5. Expand source of A1
		When user expands source on node "0"
    Then the label of all nodes is displayed as following
				| A1 | LEFT |	|
				| A3 | LEFT |	|
				| A2 | LEFT,RIGHT |	|
				| A6 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				| 1 | 0 |  |
				| 2 | 0 |  |
				| 3 | 0 |  |				
#6. Expand target & source of A2
		When user expands target on node "2"
  	When user expands source on node "2"
    Then the label of all nodes is displayed as following
				| A1 | LEFT |	|
				| A3 | LEFT |	|
				| A2 | LEFT,RIGHT |	|
				| A6 | LEFT,RIGHT |	|
				| A5 | RIGHT |	|
				| A4 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				 | 1 | 0 |  |
				 | 2 | 0 |  |
				 | 3 | 0 |  |
				 | 2 | 1 |  |
				 | 3 | 2 |  |
				 | 4 | 2 |  |
				 | 5 | 2 |  |
#7. Expand source of A3
		When user expands source on node "1"
    Then the label of all nodes is displayed as following
				| A1 | LEFT |	|
				| A3 | LEFT |	|
				| A2 | LEFT,RIGHT |	|
				| A6 | LEFT |	|
				| A5 | RIGHT |	|
				| A4 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				 | 1 | 0 |  |
				 | 2 | 0 |  |
				 | 3 | 0 |  |
				 | 2 | 1 |  |
				 | 3 | 2 |  |
				 | 4 | 2 |  |
				 | 5 | 2 |  |
				 | 3 | 1 |  |
#8. Expand source of A4
		When user expands source on node "5"
    Then the label of all nodes is displayed as following
				| A1 | LEFT |	|
				| A3 | LEFT |	|
				| A2 | LEFT,RIGHT |	|
				| A6 | LEFT |	|
				| A5 | RIGHT |	|
				| A4 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				 | 1 | 0 |  |
				 | 2 | 0 |  |
				 | 3 | 0 |  |
				 | 2 | 1 |  |
				 | 3 | 2 |  |
				 | 4 | 2 |  |
				 | 5 | 2 |  |
				 | 3 | 1 |  |		
				 | 4 | 5 |  |		 
#9.  Expand target of A5
		When user expands target on node "4"
    Then the label of all nodes is displayed as following
				| A1 | LEFT |	|
				| A3 | LEFT |	|
				| A2 | LEFT,RIGHT |	|
				| A6 | LEFT |	|
				| A5 | RIGHT |	|
				| A4 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				 | 1 | 0 |  |
				 | 2 | 0 |  |
				 | 3 | 0 |  |
				 | 2 | 1 |  |
				 | 3 | 2 |  |
				 | 4 | 2 |  |
				 | 5 | 2 |  |
				 | 3 | 1 |  |		
				 | 4 | 5 |  |		 
				 | 4 | 3 |  |		
#10. Expand source of A6
		When user expands source on node "3"
    Then the label of all nodes is displayed as following
				| A1 | LEFT |	|
				| A3 | LEFT |	|
				| A2 | LEFT,RIGHT |	|
				| A6 | LEFT |	|
				| A5 | RIGHT |	|
				| A4 | LEFT |	|
		Then the label of link label should be display as following
				 | 1 | 0 |  |
				 | 2 | 0 |  |
				 | 3 | 0 |  |
				 | 2 | 1 |  |
				 | 3 | 2 |  |
				 | 4 | 2 |  |
				 | 5 | 2 |  |
				 | 3 | 1 |  |		
				 | 4 | 5 |  |		 
				 | 4 | 3 |  |		
				 | 5 | 3 |  |
#11. Collapse source of A1
		When user collapse source on node "0"
    Then the label of all nodes is displayed as following
      | A1 |LEFT|
		Then there is no link displayed
#12. Expand source of A1
		When user expands source on node "0"
    Then the label of all nodes is displayed as following
				| A1 | LEFT |	|
				| A3 | LEFT |	|
				| A2 | LEFT,RIGHT |	|
				| A6 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				| 1 | 0 |  |
				| 2 | 0 |  |
				| 3 | 0 |  |	
#13. Expand recursively target of A2
		When user expands target recursively on node "2"
  	When user expands source recursively on node "2"
    Then the label of all nodes is displayed as following
				| A1 | LEFT |	|
				| A3 | LEFT |	|
				| A2 | LEFT,RIGHT |	|
				| A6 | LEFT,RIGHT |	|
				| A5 |  |	|
				| A4 | LEFT |	|
		Then the label of link label should be display as following
				 | 1 | 0 |  |
				 | 2 | 0 |  |
				 | 3 | 0 |  |
				 | 2 | 1 |  |
				 | 4 | 3 |  |
				 | 5 | 3 |  |
				 | 3 | 2 |  |
				 | 4 | 5 |  |
				 | 4 | 2 |  |
				 | 5 | 2 |  |
#14. Collapse target & source of A2
		When user collapse target on node "2"
  	When user collapse source on node "2"
    Then the label of all nodes is displayed as following
				| A1 | LEFT |	|
				| A3 | LEFT |	|
				| A2 | LEFT,RIGHT |	|
				| A6 | LEFT,RIGHT |	|

		Then the label of link label should be display as following
				 | 1 | 0 |  |
				 | 2 | 0 |  |
				 | 3 | 0 |  |
#15. Expand target & source of A6
  	When user expands source on node "3"
		When user expands target on node "3"
    Then the label of all nodes is displayed as following
				| A1 | LEFT |	|
				| A3 | LEFT |	|
				| A2 | LEFT,RIGHT |	|
				| A6 | LEFT,RIGHT |	|
				| A5 | RIGHT |	|
				| A4 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				 | 1 | 0 |  |
				 | 2 | 0 |  |
				 | 3 | 0 |  |
				 | 4 | 3 |  |
				 | 5 | 3 |  |
				 | 3 | 2 |  |
				 | 3 | 1 |  |
				 
#16. Collapse source of A1
		When user collapse source on node "0"
    Then the label of all nodes is displayed as following
      | A1 |LEFT|
		Then there is no link displayed			
		
Scenario: Data_94 - Check displayed correctly of relationship of nodes (it have same many outgoing&incoming nodes(n level) on same table) when starting by incoming node and expand&collapse them and render nodes after that    
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_62"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "V100_Line_Data_94"
    Then the graph should be displayed
#5. Expand target of A1
		When user expands target on node "0"
    Then the label of all nodes is displayed as following
				| A1 | RIGHT |	|
				| A3 | RIGHT |	|
				| A2 | LEFT,RIGHT |	|
				| A6 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				| 0 | 1 |  |
				| 0 | 2 |  |
				| 0 | 3 |  |				
#6. Expand target & source of A2
		When user expands target on node "1"
  	When user expands source on node "1"
    Then the label of all nodes is displayed as following
				| A1 | RIGHT |	|
				| A3 | RIGHT |	|
				| A2 | LEFT,RIGHT |	|
				| A6 | LEFT,RIGHT |	|
				| A5 | LEFT |	|
				| A4 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				 | 0 | 1 |  |
				 | 0 | 3 |  |
				 | 0 | 2 |  |
				 | 1 | 2 |  |
				 | 1 | 4 |  |
				 | 1 | 5 |  |
				 | 3 | 1 |  |
#7. Expand target of A3
		When user expands target on node "3"
    Then the label of all nodes is displayed as following
				| A1 | RIGHT |	|
				| A3 | RIGHT |	|
				| A2 | LEFT,RIGHT |	|
				| A6 | RIGHT |	|
				| A5 | LEFT |	|
				| A4 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				 | 0 | 1 |  |
				 | 0 | 3 |  |
				 | 0 | 2 |  |
				 | 1 | 2 |  |
				 | 1 | 4 |  |
				 | 1 | 5 |  |
				 | 3 | 1 |  |
				 | 3 | 2 |  |
#8. Expand target of A4
		When user expands target on node "5"
    Then the label of all nodes is displayed as following
				| A1 | RIGHT |	|
				| A3 | RIGHT |	|
				| A2 | LEFT,RIGHT |	|
				| A6 | RIGHT |	|
				| A5 | LEFT  |	|
				| A4 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				 | 0 | 1 |  |
				 | 0 | 3 |  |
				 | 0 | 2 |  |
				 | 1 | 2 |  |
				 | 1 | 4 |  |
				 | 1 | 5 |  |
				 | 3 | 1 |  |
				 | 3 | 2 |  |
				 | 5 | 4 |  | 
#9.  Expand source of A5
		When user expands source on node "4"
    Then the label of all nodes is displayed as following
				| A1 | RIGHT |	|
				| A3 | RIGHT |	|
				| A2 | LEFT,RIGHT |	|
				| A6 | RIGHT |	|
				| A5 | LEFT  |	|
				| A4 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				 | 0 | 1 |  |
				 | 0 | 3 |  |
				 | 0 | 2 |  |
				 | 1 | 2 |  |
				 | 1 | 4 |  |
				 | 1 | 5 |  |
				 | 3 | 1 |  |
				 | 3 | 2 |  |
				 | 5 | 4 |  |
				 | 2 | 4 |  |
#10. Expand target of A6
		When user expands target on node "2"
    Then the label of all nodes is displayed as following
				| A1 | RIGHT |	|
				| A3 | RIGHT |	|
				| A2 | LEFT,RIGHT |	|
				| A6 | RIGHT |	|
				| A5 | LEFT  |	|
				| A4 | RIGHT |	|
		Then the label of link label should be display as following
				 | 0 | 1 |  |
				 | 0 | 3 |  |
				 | 0 | 2 |  |
				 | 1 | 2 |  |
				 | 1 | 4 |  |
				 | 1 | 5 |  |
				 | 3 | 1 |  |
				 | 3 | 2 |  |
				 | 5 | 4 |  |
				 | 2 | 4 |  |
				 | 2 | 5 |  |
#11. Collapse target of A1
		When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      | A1 |RIGHT|
		Then there is no link displayed
#12. Expand target of A1
		When user expands target on node "0"
    Then the label of all nodes is displayed as following
				| A1 | RIGHT |	|
				| A3 | RIGHT |	|
				| A2 | LEFT,RIGHT |	|
				| A6 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				| 0 | 1 |  |
				| 0 | 2 |  |
				| 0 | 3 |  |	
#13. Expand recursively target of A2
		When user expands target recursively on node "1"
  	When user expands source recursively on node "1"
    Then the label of all nodes is displayed as following
				| A1 | RIGHT |	|
				| A3 | RIGHT |	|
				| A2 | LEFT,RIGHT |	|
				| A6 | LEFT,RIGHT |	|
				| A5 |   |	|
				| A4 | RIGHT |	|
		Then the label of link label should be display as following
				 | 0 | 3 |  |
				 | 0 | 2 |  |
				 | 0 | 1 |  |
				 | 5 | 4 |  |
				 | 2 | 5 |  |
				 | 1 | 5 |  |
				 | 2 | 4 |  |
				 | 1 | 4 |  |
				 | 1 | 2 |  |
				 | 3 | 1 |  |

#13. Expand recursively source of A6
  	When user expands source recursively on node "2"
    Then the label of all nodes is displayed as following
				| A1 | RIGHT |	|
				| A3 |  |	|
				| A2 | LEFT,RIGHT |	|
				| A6 | LEFT,RIGHT |	|
				| A5 |   |	|
				| A4 | RIGHT |	|
		Then the label of link label should be display as following
				 | 0 | 3 |  |
				 | 0 | 2 |  |
				 | 0 | 1 |  |
				 | 5 | 4 |  |
				 | 2 | 5 |  |
				 | 1 | 5 |  |
				 | 2 | 4 |  |
				 | 1 | 4 |  |
				 | 1 | 2 |  |
				 | 3 | 1 |  |
				 | 3 | 2 |  |			 
#14. Collapse target & source of A4
		When user collapse source on node "5"
		When user collapse target on node "5"
    Then the label of all nodes is displayed as following
				| A1 | RIGHT |	|
				| A3 |  |	|
				| A2 | LEFT,RIGHT |	|
				| A6 | LEFT,RIGHT |	|
				| A5 | LEFT  |	|
				| A4 | RIGHT |	|
		Then the label of link label should be display as following
				 | 0 | 3 |  |
				 | 0 | 2 |  |
				 | 0 | 1 |  |
				 | 2 | 5 |  |
				 | 1 | 5 |  |
				 | 2 | 4 |  |
				 | 1 | 4 |  |
				 | 1 | 2 |  |
				 | 3 | 1 |  |
				 | 3 | 2 |  |
				 
#15. Collapse source of A6
		When user collapse source on node "2"
    Then the label of all nodes is displayed as following
				| A1 | RIGHT |	|
				| A3 | RIGHT |	|
				| A2 | LEFT,RIGHT |	|
				| A6 | LEFT,RIGHT |	|
				| A5 | LEFT  |	|
				| A4 | RIGHT |	|
		Then the label of link label should be display as following
					 | 0 | 3 |  |
					 | 0 | 2 |  |
					 | 0 | 1 |  |
					 | 2 | 5 |  |
					 | 1 | 5 |  |
					 | 2 | 4 |  |
					 | 1 | 4 |  |
					 | 1 | 2 |  |
					 | 3 | 1 |  | 			 	
					 
Scenario: Data_95 - Check displayed correctly of relationship of nodes (it have same many outgoing&incoming nodes(n level) on same table) when starting by incoming node and expand&collapse them and render nodes after that    
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_64"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "V100_Line_Data_95"
    Then the graph should be displayed
#5. Expand target of A1
		When user expands target on node "0"
		When user expands source on node "0"		
    Then the label of all nodes is displayed as following
				| A1 | LEFT,RIGHT |	|
				| A3 | RIGHT |	|
				| A2 | RIGHT |	|
		Then the label of link label should be display as following
				 | 0 | 0 |  |
				 | 0 | 1 |  |
				 | 0 | 2 |  |
				 | 2 | 0 |  |
				 | 1 | 0 |  |
#6. Expand target of A2
		When user expands target on node "2"
    Then the label of all nodes is displayed as following
				| A1 | LEFT,RIGHT |	|
				| A3 | RIGHT |	|
				| A2 | RIGHT |	|
		Then the label of link label should be display as following
					 | 0 | 0 |  |
					 | 0 | 1 |  |
					 | 0 | 2 |  |
					 | 2 | 0 |  |
					 | 1 | 0 |  |
        	 | 2 | 2 |  |
#7. Expand target of A3
		When user expands target on node "1"
    Then the label of all nodes is displayed as following
				| A1 | LEFT,RIGHT |	|
				| A3 | RIGHT |	|
				| A2 | RIGHT |	|
		Then the label of link label should be display as following
				 | 0 | 0 |  |
				 | 0 | 1 |  |
				 | 0 | 2 |  |
				 | 2 | 0 |  |
				 | 1 | 0 |  |
        | 2 | 2 |  |
        | 1 | 1 |  |
#8. Collapse target & source of A1
		When user collapse target on node "0"
		When user collapse source on node "0"		
    Then the label of all nodes is displayed as following
      | A1 |LEFT,RIGHT|
		Then there is no link displayed
#9. Expand recursively target & source of A1
		When user expands target recursively on node "0"
  	When user expands source recursively on node "0"
    Then the label of all nodes is displayed as following
				| A1 | RIGHT |	|
				| A3 | RIGHT |	|
				| A2 | RIGHT |	|
		Then the label of link label should be display as following
				 | 0 | 0 |  |
				 | 0 | 1 |  |
				 | 0 | 2 |  |
				 | 2 | 0 |  |
				 | 1 | 0 |  |
         | 2 | 2 |  |
         | 1 | 1 |  |
		 
#10. Collapse target of A2
		When user collapse target on node "2"
    Then the label of all nodes is displayed as following
				| A1 | LEFT,RIGHT |	|
				| A3 | RIGHT |	|
				| A2 | RIGHT |	|
		Then the label of link label should be display as following
				 | 0 | 0 |  |
				 | 0 | 1 |  |
				 | 0 | 2 |  |
				 | 1 | 0 |  |
         | 1 | 1 |  |
        
#11. Expand recursively target of A2
		When user expands target recursively on node "2"
    Then the label of all nodes is displayed as following
				| A1 | RIGHT |	|
				| A3 | RIGHT |	|
				| A2 | RIGHT |	|
		Then the label of link label should be display as following
				 | 0 | 0 |  |
				 | 0 | 1 |  |
				 | 0 | 2 |  |
				 | 2 | 0 |  |
				 | 1 | 0 |  |
         | 2 | 2 |  |
         | 1 | 1 |  |  					 	 