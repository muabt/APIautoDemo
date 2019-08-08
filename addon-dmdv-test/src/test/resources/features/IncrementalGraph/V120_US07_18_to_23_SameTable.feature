@DMDV120
Feature: US07-Provide service for incremental tree

  Background: 
    Given I login to EBX succesfully
    
#	Scenario: Check generated data correctly
#	  Given I access dataspace "Master Data - Reference"
    #Given I access dataset "Burgers"
    #And I access table "Products"
    #And user views "Visualization>Display selected data" of record has ID is "2"
    #Then the incremental graph should be displayed
    #Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      #|0	| Big Mac |	PLUS_SIGN	|
    #When user expands on node "0"
    #Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      #|0	| Big Mac |	MINUS_SIGN	|
      #|1	| Big Mac Meal - Big Mac |	PLUS_SIGN	|
      #|2	| Big Mac - Big Mac Bun |	PLUS_SIGN	|
      #|3	| Burgers & Sandwiches - Big Mac |	PLUS_SIGN	|
      #|4	| Big Mac - Onions |	PLUS_SIGN	|
      #|5	| Big Mac - Big Mac Sauce |	PLUS_SIGN	|
      #|6	| Big Mac - Pickle Slices |	PLUS_SIGN	|
      #|7	| Big Mac - 100% Beef Patty |	PLUS_SIGN	|
      #|8	| Big Mac - Pasteurized Process American Cheese |	PLUS_SIGN	|
      #|9	| Big Mac - Shredded Lettuce |	PLUS_SIGN	|
    #Then the graph should contains following links
      #| Start Node |	End Node	|
      #| 6 |	0|
      #| 7 |	0|
      #| 3 |	0|
      #| 8 |	0|
      #| 9 |	0|
      #| 2 |	0|
      #| 4 |	0|
      #| 5 |	0|
      #| 1 |	0|
    #When user collapses on node "0"
    #Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      #|0	| Big Mac |	PLUS_SIGN	|

@US07-18to23
	Scenario: US07-18 - Check displayed correctly the links and render nodes (it has a incoming node on same table by a FK) 
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_18"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |		|

    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	0|
      | 1 |	0|
    When user collapses on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|      
      
 	Scenario: US07-19 - Check displayed correctly the links and render nodes (it has a outgoing node on same table by a FK)
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_18"
    And user views "Visualization>Display selected data" of record has ID is "3"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A3 |	PLUS_SIGN	|
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A3 |	MINUS_SIGN	|
      |1	| A4 |		|

    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1|
      
    When user collapses on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A3 |	PLUS_SIGN	|     
      
      
	Scenario: US07-20 - Check displayed correctly the links and render nodes (it has a incoming & outgoing node on same table by a FK)
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_18"
    And user views "Visualization>Display selected data" of record has ID is "5"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A5 |	PLUS_SIGN	|
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A5 |	MINUS_SIGN	|
      |1	| A6 |		|
      |2	| A7 |		|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	0|
      | 1 |	0|
      | 0 |	2|
    When user collapses on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A5 |	PLUS_SIGN	|      
      
      
 	Scenario: US07-21 - Check displayed correctly the links and render nodes (it has a incoming node on same table by many FKs)
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_18"
    And user views "Visualization>Display selected data" of record has ID is "8"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A8 |	PLUS_SIGN	|
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A8 |	MINUS_SIGN	|
      |1	| A9 |		|

    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	0|
      | 0 |	0|
      | 0 |	0|
      | 0 |	0|
      | 0 |	0|
      | 0 |	0|
      | 1 |	0|
      | 1 |	0|
      | 1 |	0|
      | 1 |	0|
      | 1 |	0|
      | 1 |	0|
      
    When user collapses on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A8 |	PLUS_SIGN	|     

	Scenario: US07-22 - Check displayed correctly the links and render nodes (it has a outgoing node on same table by many FKs)
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_18"
    And user views "Visualization>Display selected data" of record has ID is "10"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A10 |	PLUS_SIGN	|
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A10 |	MINUS_SIGN	|
      |1	| A11 |		|

    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1|
      | 0 |	1|
      | 0 |	1|
      | 0 |	1|
      | 0 |	1|
      | 0 |	1|
      
    When user collapses on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A10 |	PLUS_SIGN	|   
      
  Scenario: US07-23 - Check displayed correctly the links and render nodes (it has a incoming & outgoing node on same table by many FKs)
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_18"
    And user views "Visualization>Display selected data" of record has ID is "12"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A12 |	PLUS_SIGN	|
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A12 |	MINUS_SIGN	|
      |1	| A13 |		|
      |2	| A14 |		|

    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	0|
      | 0 |	0|
      | 0 |	0|
      | 0 |	0|
      | 0 |	0|
      | 1 |	0|
      | 1 |	0|
      | 1 |	0|
      | 1 |	0|
      | 1 |	0|
      | 1 |	0|
      | 0 |	2|
      | 0 |	2|
      | 0 |	2|
      | 0 |	2|
      | 0 |	2|
      | 0 |	2|
      
    When user collapses on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A12 |	PLUS_SIGN	|        
      
      
	