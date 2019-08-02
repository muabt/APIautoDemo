@DMDV120
Feature: US07-Provide service for incremental tree

  Background: 
    Given I login to EBX succesfully


@US07-24to29
 Scenario: US07-24 - Check displayed correctly the links and render nodes ( it have many incoming node on same table by a FK)
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_24"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A5 |		|
      |2	| A4 |		|
      |3	| A7 |		|
      |4	| A6 |		|
      |5	| A9 |		|
      |6	| A8 |		|
      |7	| A10 |		|
      |8	| A11 |		|
      |9	| A12 |		|
      |10	| A3 |		|
      |11	| A2 |		|


    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0|
      | 2 |	0|
      | 3 |	0|
      | 4 |	0|
      | 5 |	0|
      | 6 |	0|
      | 7 |	0|
      | 8 |	0|
      | 9 |	0|
      | 10 |	0|
      | 11 |	0|

      
    When user collapses on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|  
      
  Scenario: US07-25 - Check displayed correctly the links and render nodes (it have many incoming node on same table by a FK)
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_24"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A5 |		|
      |2	| A4 |		|
      |3	| A7 |		|
      |4	| A6 |		|
      |5	| A9 |		|
      |6	| A8 |		|
      |7	| A10 |		|
      |8	| A11 |		|
      |9	| A12 |		|
      |10	| A3 |		|
      |11	| A2 |		|


    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0|
      | 2 |	0|
      | 3 |	0|
      | 4 |	0|
      | 5 |	0|
      | 6 |	0|
      | 7 |	0|
      | 8 |	0|
      | 9 |	0|
      | 10 |	0|
      | 11 |	0|

      
    When user collapses on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
    
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A5 |		|
      |2	| A4 |		|
      |3	| A7 |		|
      |4	| A6 |		|
      |5	| A9 |		|
      |6	| A8 |		|
      |7	| A10 |		|
      |8	| A11 |		|
      |9	| A12 |		|
      |10	| A3 |		|
      |11	| A2 |		|


    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0|
      | 2 |	0|
      | 3 |	0|
      | 4 |	0|
      | 5 |	0|
      | 6 |	0|
      | 7 |	0|
      | 8 |	0|
      | 9 |	0|
      | 10 |	0|
      | 11 |	0|  
      
      
	Scenario: US07-26 - Check displayed correctly the links and render nodes (it have many incoming node on same table by many FKs) with 2 starting nodes
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_24"
    And user views "Visualization>Display selected data" of records have ID are
    	| 1|
    	| 2|
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
      |1	| A2 |	PLUS_SIGN	|
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |		|
      |2	| A5 |		|
      |3	| A4 |		|
      |4	| A7 |		|
      |5	| A6 |		|
      |6	| A9 |		|
      |7	| A8 |		|
      |8	| A10 |		|
      |9	| A11 |		|
      |10	| A12 |		|
      |11	| A3 |		|


    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0|
      | 2 |	0|
      | 3 |	0|
      | 4 |	0|
      | 5 |	0|
      | 6 |	0|
      | 7 |	0|
      | 8 |	0|
      | 9 |	0|
      | 10 |	0|
      | 11 |	0|

      
    When user collapses on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
      |1	| A2 |	PLUS_SIGN	|
    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|

    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0|   
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A5 |		|
      |3	| A4 |		|
      |4	| A7 |		|
      |5	| A6 |		|
      |6	| A9 |		|
      |7	| A8 |		|
      |8	| A10 |		|
      |9	| A11 |		|
      |10	| A12 |		|
      |11	| A3 |		|


    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0|
      | 2 |	0|
      | 3 |	0|
      | 4 |	0|
      | 5 |	0|
      | 6 |	0|
      | 7 |	0|
      | 8 |	0|
      | 9 |	0|
      | 10 |	0|
      | 11 |	0| 
      
    When user collapses on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
      |1	| A2 |	PLUS_SIGN	|  
      
	Scenario: US07-27 - Check displayed correctly the links and render nodes (it have many incoming node on same table by many FKs) with many starting nodes
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_24"
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
      |0	| A5 |	PLUS_SIGN	|
      |1	| A4 |	PLUS_SIGN	|
      |2	| A7 |	PLUS_SIGN	|
      |3	| A6 |	PLUS_SIGN	|
      |4	| A9 |	PLUS_SIGN	|
      |5	| A8 |	PLUS_SIGN	|
      |6	| A10|	PLUS_SIGN	|
      |7	| A11|	PLUS_SIGN	|
      |8	| A1 |	PLUS_SIGN	|
      |9  | A12|	PLUS_SIGN	|
      |10	| A3 |	PLUS_SIGN	|
      |11	| A2 |	PLUS_SIGN	|
      
    When user expands on node "11"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A5 |	PLUS_SIGN	|
      |1	| A4 |	PLUS_SIGN	|
      |2	| A7 |	PLUS_SIGN	|
      |3	| A6 |	PLUS_SIGN	|
      |4	| A9 |	PLUS_SIGN	|
      |5	| A8 |	PLUS_SIGN	|
      |6	| A10|	PLUS_SIGN	|
      |7	| A11|	PLUS_SIGN	|
      |8	| A1 |	PLUS_SIGN	|
      |9  | A12|	PLUS_SIGN	|
      |10	| A3 |	PLUS_SIGN	|
      |11	| A2 |	MINUS_SIGN	|


    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 11 |	8|
      
    When user expands on node "8"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A5 |	|
      |1	| A4 |	|
      |2	| A7 |	|
      |3	| A6 |	|
      |4	| A9 |	|
      |5	| A8 |	|
      |6	| A10|	|
      |7	| A11|	|
      |8	| A1 |	MINUS_SIGN|
      |9  | A12|	|
      |10	| A3 |	|
      |11	| A2 |	MINUS_SIGN|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	8|
      | 2 |	8|
      | 3 |	8|
      | 4 |	8|
      | 5 |	8|
      | 6 |	8|
      | 7 |	8|
      | 0 |	8|
      | 9 |	8|
      | 10 |	8|
      | 11 |	8|    
      
    When user collapses on node "8"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A5 |	PLUS_SIGN	|
      |1	| A4 |	PLUS_SIGN	|
      |2	| A7 |	PLUS_SIGN	|
      |3	| A6 |	PLUS_SIGN	|
      |4	| A9 |	PLUS_SIGN	|
      |5	| A8 |	PLUS_SIGN	|
      |6	| A10|	PLUS_SIGN	|
      |7	| A11|	PLUS_SIGN	|
      |8	| A1 |	PLUS_SIGN	|
      |9  | A12|	PLUS_SIGN	|
      |10	| A3 |	PLUS_SIGN	|
      |11	| A2 |	MINUS_SIGN	|  
      
   Then the graph should contains following links
      #| Start Node |	End Node	|
      | 11 |	8|  
  
    When user collapses on node "11"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A5 |	PLUS_SIGN	|
      |1	| A4 |	PLUS_SIGN	|
      |2	| A7 |	PLUS_SIGN	|
      |3	| A6 |	PLUS_SIGN	|
      |4	| A9 |	PLUS_SIGN	|
      |5	| A8 |	PLUS_SIGN	|
      |6	| A10|	PLUS_SIGN	|
      |7	| A11|	PLUS_SIGN	|
      |8	| A1 |	PLUS_SIGN	|
      |9  | A12|	PLUS_SIGN	|
      |10	| A3 |	PLUS_SIGN	|
      |11	| A2 |	PLUS_SIGN	|  
      
   When user expands on node "11"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A5 |	PLUS_SIGN	|
      |1	| A4 |	PLUS_SIGN	|
      |2	| A7 |	PLUS_SIGN	|
      |3	| A6 |	PLUS_SIGN	|
      |4	| A9 |	PLUS_SIGN	|
      |5	| A8 |	PLUS_SIGN	|
      |6	| A10|	PLUS_SIGN	|
      |7	| A11|	PLUS_SIGN	|
      |8	| A1 |	PLUS_SIGN	|
      |9  | A12|	PLUS_SIGN	|
      |10	| A3 |	PLUS_SIGN	|
      |11	| A2 |	MINUS_SIGN	|


    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 11 |	8|      
      
 	Scenario: US07-28 - Check displayed correctly the links and render nodes (it have many incoming node on same table by many FKs) when starting by 2 incomming nodes
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_24"
    And user views "Visualization>Display selected data" of records have ID are
    	| 2|
    	| 3|
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A3 |	PLUS_SIGN	|
      |1	| A2 |	PLUS_SIGN	|
      
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |2	| A1 |	PLUS_SIGN	|
      |0	| A3 |	MINUS_SIGN|
      |1	| A2 |	PLUS_SIGN	|


    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	2 |
      
    When user expands on node "2"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A3 | MINUS_SIGN|
      |1	| A2 |	|
      |2	| A1 | MINUS_SIGN|
      |3	| A5 |	|
      |4	| A4 |	|
      |5	| A7 |	|
      |6	| A6 |	|
      |7	| A9 |	|
      |8	| A8 |	|
      |9  | A10|	|
      |10	| A11 |	|
      |11	| A12 |	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	2|
      | 0 |	2|
      | 3 |	2|
      | 4 |	2|
      | 5 |	2|
      | 6 |	2|
      | 7 |	2|
      | 8 |	2|
      | 9 |	2|
      | 10 |	2|
      | 11 |	2|    
      
    When user collapses on node "2"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A3 |	MINUS_SIGN	|
      |1	| A2 |	PLUS_SIGN	|
      |2	| A1 |	PLUS_SIGN	|
      
   Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	2 |  
      
    When user expands on node "2"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A3 | MINUS_SIGN|
      |1	| A2 |	|
      |2	| A1 | MINUS_SIGN|
      |3	| A5 |	|
      |4	| A4 |	|
      |5	| A7 |	|
      |6	| A6 |	|
      |7	| A9 |	|
      |8	| A8 |	|
      |9  | A10|	|
      |10	| A11 |	|
      |11	| A12 |	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	2|
      | 0 |	2|
      | 3 |	2|
      | 4 |	2|
      | 5 |	2|
      | 6 |	2|
      | 7 |	2|
      | 8 |	2|
      | 9 |	2|
      | 10 |	2|
      | 11 |	2| 
        
    When user collapses on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A3 |	PLUS_SIGN	|
      |1	| A2 |	PLUS_SIGN	|
      
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A3 | MINUS_SIGN|
      |1	| A2 |	|
      |2	| A1 | MINUS_SIGN|
      |3	| A5 |	|
      |4	| A4 |	|
      |5	| A7 |	|
      |6	| A6 |	|
      |7	| A9 |	|
      |8	| A8 |	|
      |9  | A10|	|
      |10	| A11 |	|
      |11	| A12 |	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	2|
      | 0 |	2|
      | 3 |	2|
      | 4 |	2|
      | 5 |	2|
      | 6 |	2|
      | 7 |	2|
      | 8 |	2|
      | 9 |	2|
      | 10 |	2|
      | 11 |	2| 
      
	Scenario: US07-29 - Check displayed correctly the links and render nodes (it have many incoming node on same table by many FKs) when starting by 2 incomming nodes
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_24"
    And user views "Visualization>Display selected data" of records have ID are
    	| 2|
    	| 3|
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A3 |	PLUS_SIGN	|
      |1	| A2 |	PLUS_SIGN	|
      
    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |2	| A1 |	PLUS_SIGN	|
      |0	| A3 |	PLUS_SIGN |
      |1	| A2 |	MINUS_SIGN	|


    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	2 |

    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |2	| A1 |	PLUS_SIGN	|
      |0	| A3 |	MINUS_SIGN |
      |1	| A2 |	MINUS_SIGN	|


    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	2 |   
      | 1 |	2 |   
      
    When user collapses on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A3 |	MINUS_SIGN	|
      |1	| A2 |	PLUS_SIGN	|
      |2	| A1 |	PLUS_SIGN	|
      
   Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	2 |
       
    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |2	| A1 |	PLUS_SIGN	|
      |0	| A3 |	MINUS_SIGN |
      |1	| A2 |	MINUS_SIGN	|


    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	2 |   
      | 1 |	2 |     
      
    When user expands on node "2"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A3 | MINUS_SIGN|
      |1	| A2 | MINUS_SIGN|
      |2	| A1 | MINUS_SIGN|
      |3	| A5 |	|
      |4	| A4 |	|
      |5	| A7 |	|
      |6	| A6 |	|
      |7	| A9 |	|
      |8	| A8 |	|
      |9  | A10|	|
      |10	| A11 |	|
      |11	| A12 |	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	2|
      | 0 |	2|
      | 3 |	2|
      | 4 |	2|
      | 5 |	2|
      | 6 |	2|
      | 7 |	2|
      | 8 |	2|
      | 9 |	2|
      | 10 |	2|
      | 11 |	2|    
      
    When user collapses on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A3 | PLUS_SIGN	|
      |1	| A2 | MINUS_SIGN|
      |2	| A1 | PLUS_SIGN|
      |3	| A5 |	|
      |4	| A4 |	|
      |5	| A7 |	|
      |6	| A6 |	|
      |7	| A9 |	|
      |8	| A8 |	|
      |9  | A10|	|
      |10	| A11 |	|
      |11	| A12 |	|
      
   Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	2|
      | 3 |	2|
      | 4 |	2|
      | 5 |	2|
      | 6 |	2|
      | 7 |	2|
      | 8 |	2|
      | 9 |	2|
      | 10 |	2|
      | 11 |	2| 
      
                                 