@DMDV120
Feature: US07-Provide service for incremental tree

  Background: 
    Given I login to EBX succesfully


@US07-30to35
 Scenario: US07-30 - Check displayed correctly the links and render nodes ( it have many outgoing node on same table by a FK)
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_30"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A10 |		|
      |2	| A11 |		|
      |3	| A12 |		|
      |4	| A2 |		|
      |5	| A4 |		|
      |6	| A3 |		|
      |7	| A6 |		|
      |8	| A5 |		|
      |9	| A8 |		|
      |10	| A7 |		|
      |11	| A9 |		|


    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1|
      | 0 |	2|
      | 0 |	3|
      | 0 |	4|
      | 0 |	5|
      | 0 |	6|
      | 0 |	7|
      | 0 |	8|
      | 0 |	9|
      | 0 |	10|
      | 0 |	11|
         
    When user collapses on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|  
      
  Scenario: US07-31 - Check displayed correctly the links and render nodes (it have many outgoing node on same table by a FK)
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_30"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A10 |		|
      |2	| A11 |		|
      |3	| A12 |		|
      |4	| A2 |		|
      |5	| A4 |		|
      |6	| A3 |		|
      |7	| A6 |		|
      |8	| A5 |		|
      |9	| A8 |		|
      |10	| A7 |		|
      |11	| A9 |		|


    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1|
      | 0 |	2|
      | 0 |	3|
      | 0 |	4|
      | 0 |	5|
      | 0 |	6|
      | 0 |	7|
      | 0 |	8|
      | 0 |	9|
      | 0 |	10|
      | 0 |	11|

      
    When user collapses on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
    
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A10 |		|
      |2	| A11 |		|
      |3	| A12 |		|
      |4	| A2 |		|
      |5	| A4 |		|
      |6	| A3 |		|
      |7	| A6 |		|
      |8	| A5 |		|
      |9	| A8 |		|
      |10	| A7 |		|
      |11	| A9 |		|


    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1|
      | 0 |	2|
      | 0 |	3|
      | 0 |	4|
      | 0 |	5|
      | 0 |	6|
      | 0 |	7|
      | 0 |	8|
      | 0 |	9|
      | 0 |	10|
      | 0 |	11|
      
      
	Scenario: US07-32 - Check displayed correctly the links and render nodes (it have many outgoing node on same table by many FKs) with 2 starting nodes
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_30"
    And user views "Visualization>Display selected data" of records have ID are
    	| 1|
    	| 2|
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |	PLUS_SIGN	|
      |1	| A1 |	PLUS_SIGN	|
    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |1	| A1 |	MINUS_SIGN	|
      |0	| A2 |		|
      |2	| A10 |		|
      |3	| A11 |		|
      |4	| A12 |		|
      |5	| A4 |		|
      |6	| A3 |		|
      |7	| A6 |		|
      |8	| A5 |		|
      |9	| A8 |		|
      |10	| A7 |		|
      |11	| A9 |		|


    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0|
      | 1 |	2|
      | 1 |	3|
      | 1 |	4|
      | 1 |	5|
      | 1 |	6|
      | 1 |	7|
      | 1 |	8|
      | 1 |	9|
      | 1 |	10|
      | 1 |	11|

      
    When user collapses on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |1	| A1 |	PLUS_SIGN	|
      |0	| A2 |	PLUS_SIGN	|
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |1	| A1 |	PLUS_SIGN	|
      |0	| A2 |	MINUS_SIGN	|

    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0|   
    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |1	| A1 |	MINUS_SIGN	|
      |0	| A2 |	MINUS_SIGN	|
      |2	| A10 |		|
      |3	| A11 |		|
      |4	| A12 |		|
      |5	| A4 |		|
      |6	| A3 |		|
      |7	| A6 |		|
      |8	| A5 |		|
      |9	| A8 |		|
      |10	| A7 |		|
      |11	| A9 |		|


    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0|
      | 1 |	2|
      | 1 |	3|
      | 1 |	4|
      | 1 |	5|
      | 1 |	6|
      | 1 |	7|
      | 1 |	8|
      | 1 |	9|
      | 1 |	10|
      | 1 |	11|
      
    When user collapses on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |1	| A1 |	PLUS_SIGN	|
      |0	| A2 |	PLUS_SIGN	|  
      
	Scenario: US07-33 - Check displayed correctly the links and render nodes (it have many outgoing node on same table by many FKs) with many starting nodes
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_30"
    And user views "Visualization>Display selected data" of records have ID are
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
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A10 |	PLUS_SIGN	|
      |1	| A11 |	PLUS_SIGN	|
      |2	| A12 |	PLUS_SIGN	|
      |3	| A2 |	PLUS_SIGN	|
      |4	| A1 |	PLUS_SIGN	|
      |5	| A4 |	PLUS_SIGN	|
      |6	| A3 |	PLUS_SIGN	|
      |7	| A6 |	PLUS_SIGN	|
      |8	| A5 |	PLUS_SIGN	|
      |9  | A8 |	PLUS_SIGN	|
      |10	| A7 |	PLUS_SIGN	|
      |11	| A9 |	PLUS_SIGN	|
      
    When user expands on node "3"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A10 |	PLUS_SIGN	|
      |1	| A11 |	PLUS_SIGN	|
      |2	| A12 |	PLUS_SIGN	|
      |3	| A2 |	MINUS_SIGN	|
      |4	| A1 |	PLUS_SIGN	|
      |5	| A4 |	PLUS_SIGN	|
      |6	| A3 |	PLUS_SIGN	|
      |7	| A6 |	PLUS_SIGN	|
      |8	| A5 |	PLUS_SIGN	|
      |9  | A8 |	PLUS_SIGN	|
      |10	| A7 |	PLUS_SIGN	|
      |11	| A9 |	PLUS_SIGN	|

    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 4 |	3 |
      
    When user expands on node "4"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A10 |		|
      |1	| A11 |		|
      |2	| A12 |		|
      |3	| A2 |	MINUS_SIGN	|
      |4	| A1 |	MINUS_SIGN	|
      |5	| A4 |		|
      |6	| A3 |		|
      |7	| A6 |		|
      |8	| A5 |		|
      |9  | A8 |		|
      |10	| A7 |		|
      |11	| A9 |		|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 4 |	1|
      | 4 |	2|
      | 4 |	3|
      | 4 |	0|
      | 4 |	5|
      | 4 |	6|
      | 4 |	7|
      | 4 |	8|
      | 4 |	9|
      | 4 |	10|
      | 4 |	11|   
      
    When user collapses on node "4"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A10 |	PLUS_SIGN	|
      |1	| A11 |	PLUS_SIGN	|
      |2	| A12 |	PLUS_SIGN	|
      |3	| A2 |	MINUS_SIGN	|
      |4	| A1 |	PLUS_SIGN	|
      |5	| A4 |	PLUS_SIGN	|
      |6	| A3 |	PLUS_SIGN	|
      |7	| A6 |	PLUS_SIGN	|
      |8	| A5 |	PLUS_SIGN	|
      |9  | A8 |	PLUS_SIGN	|
      |10	| A7 |	PLUS_SIGN	|
      |11	| A9 |	PLUS_SIGN	|

    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 4 |	3 |
  
    When user collapses on node "3"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A10 |	PLUS_SIGN	|
      |1	| A11 |	PLUS_SIGN	|
      |2	| A12 |	PLUS_SIGN	|
      |3	| A2 |	PLUS_SIGN	|
      |4	| A1 |	PLUS_SIGN	|
      |5	| A4 |	PLUS_SIGN	|
      |6	| A3 |	PLUS_SIGN	|
      |7	| A6 |	PLUS_SIGN	|
      |8	| A5 |	PLUS_SIGN	|
      |9  | A8 |	PLUS_SIGN	|
      |10	| A7 |	PLUS_SIGN	|
      |11	| A9 |	PLUS_SIGN	| 
      
   When user expands on node "3"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A10 |	PLUS_SIGN	|
      |1	| A11 |	PLUS_SIGN	|
      |2	| A12 |	PLUS_SIGN	|
      |3	| A2 |	MINUS_SIGN	|
      |4	| A1 |	PLUS_SIGN	|
      |5	| A4 |	PLUS_SIGN	|
      |6	| A3 |	PLUS_SIGN	|
      |7	| A6 |	PLUS_SIGN	|
      |8	| A5 |	PLUS_SIGN	|
      |9  | A8 |	PLUS_SIGN	|
      |10	| A7 |	PLUS_SIGN	|
      |11	| A9 |	PLUS_SIGN	|

    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 4 |	3 |      
      
 	Scenario: US07-34 - Check displayed correctly the links and render nodes (it have many outgoing node on same table by many FKs) when starting by 2 incomming nodes
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_30"
    And user views "Visualization>Display selected data" of records have ID are
    	| 2|
    	| 3|
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |	PLUS_SIGN	|
      |1	| A3 |	PLUS_SIGN	|
      
    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |2	| A1 |	PLUS_SIGN	|
      |0	| A2 |	PLUS_SIGN |
      |1	| A3 |	MINUS_SIGN|

    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 2 |	1 |
      
    When user expands on node "2"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |  |
      |1	| A3 | MINUS_SIGN	|
      |2	| A1 | MINUS_SIGN |
      |3	| A10 |	|
      |4	| A11 |	|
      |5	| A12 |	|
      |6	| A4 |	|
      |7	| A6 |	|
      |8	| A5 |	|
      |9  | A8|	|
      |10	| A7 |	|
      |11	| A9 |	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 2 |	0|
      | 2 |	1|
      | 2 |	3|
      | 2 |	4|
      | 2 |	5|
      | 2 |	6|
      | 2 |	7|
      | 2 |	8|
      | 2 |	9|
      | 2 |	10|
      | 2 |	11|    
      
    When user collapses on node "2"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |2	| A1 |	PLUS_SIGN	|
      |0	| A2 |	PLUS_SIGN |
      |1	| A3 |	MINUS_SIGN|

    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 2 |	1 |
      
    When user expands on node "2"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |  |
      |1	| A3 | MINUS_SIGN	|
      |2	| A1 | MINUS_SIGN |
      |3	| A10 |	|
      |4	| A11 |	|
      |5	| A12 |	|
      |6	| A4 |	|
      |7	| A6 |	|
      |8	| A5 |	|
      |9  | A8|	|
      |10	| A7 |	|
      |11	| A9 |	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 2 |	0|
      | 2 |	1|
      | 2 |	3|
      | 2 |	4|
      | 2 |	5|
      | 2 |	6|
      | 2 |	7|
      | 2 |	8|
      | 2 |	9|
      | 2 |	10|
      | 2 |	11|  
        
    When user collapses on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |	PLUS_SIGN	|
      |1	| A3 |	PLUS_SIGN	|
      
    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |  |
      |1	| A3 | MINUS_SIGN	|
      |2	| A1 | MINUS_SIGN |
      |3	| A10 |	|
      |4	| A11 |	|
      |5	| A12 |	|
      |6	| A4 |	|
      |7	| A6 |	|
      |8	| A5 |	|
      |9  | A8|	|
      |10	| A7 |	|
      |11	| A9 |	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 2 |	0|
      | 2 |	1|
      | 2 |	3|
      | 2 |	4|
      | 2 |	5|
      | 2 |	6|
      | 2 |	7|
      | 2 |	8|
      | 2 |	9|
      | 2 |	10|
      | 2 |	11|     
      
	Scenario: US07-35 - Check displayed correctly the links and render nodes (it have many outgoing node on same table by many FKs) when starting by 2 incomming nodes
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_30"
    And user views "Visualization>Display selected data" of records have ID are
    	| 2|
    	| 3|
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |	PLUS_SIGN	|
      |1	| A3 |	PLUS_SIGN	|
      
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |2	| A1 |	PLUS_SIGN	|
      |0	| A2 |	MINUS_SIGN	|
      |1	| A3 |	PLUS_SIGN	|

    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 2 |	0 |

    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |2	| A1 |	PLUS_SIGN	|
      |0	| A2 |	MINUS_SIGN	|
      |1	| A3 |	MINUS_SIGN	|

    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 2 |	0 |   
      | 2 |	1 |   
      
    When user collapses on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |1	| A3 |	MINUS_SIGN	|
      |0	| A2 |	PLUS_SIGN	|
      |2	| A1 |	PLUS_SIGN	|
      
   Then the graph should contains following links
      #| Start Node |	End Node	|
      | 2 |	1 |
       
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |2	| A1 |	PLUS_SIGN	|
      |1	| A3 |	MINUS_SIGN |
      |0	| A2 |	MINUS_SIGN	|


    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 2 |	0 |   
      | 2 |	1 |      
      
    When user expands on node "2"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 | MINUS_SIGN|
      |1	| A3 | MINUS_SIGN|
      |2	| A1 | MINUS_SIGN|
      |3	| A10 |	|
      |4	| A11 |	|
      |5	| A12 |	|
      |6	| A4 |	|
      |7	| A6 |	|
      |8	| A5 |	|
      |9  | A8|	|
      |10	| A7 |	|
      |11	| A9 |	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 2 |	0|
      | 2 |	1|
      | 2 |	3|
      | 2 |	4|
      | 2 |	5|
      | 2 |	6|
      | 2 |	7|
      | 2 |	8|
      | 2 |	9|
      | 2 |	10|
      | 2 |	11|    
      
    When user collapses on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 | PLUS_SIGN	|
      |1	| A3 | MINUS_SIGN|
      |2	| A1 | PLUS_SIGN|
      |3	| A10 |	|
      |4	| A11 |	|
      |5	| A12 |	|
      |6	| A4 |	|
      |7	| A6 |	|
      |8	| A5 |	|
      |9  | A8|	|
      |10	| A7 |	|
      |11	| A9 |	|
      
   Then the graph should contains following links
      #| Start Node |	End Node	|
      | 2 |	1|
      | 2 |	3|
      | 2 |	4|
      | 2 |	5|
      | 2 |	6|
      | 2 |	7|
      | 2 |	8|
      | 2 |	9|
      | 2 |	10|
      | 2 |	11| 
      
                                 