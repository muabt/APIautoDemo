@DMDV120
Feature: US07-Provide service for incremental tree

  Background: 
    Given I login to EBX succesfully
    
 
 @US07-36to42    
	Scenario: US07-36 - Check displayed correctly the links and render nodes (it have many incoming & outgoing node on same table by a FK) when starting by owner node
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_36"
    And user views "Visualization>Display selected data" of records have ID are
    	| 1|
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
 
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A5 |		|
      |2	| A2 |		|
      |3	| A4 |		|
      |4	| A3 |		|

    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	0 |
      | 1 |	0 |
      | 3 |	0 |
      | 0 |	4 |
      | 0 |	2 |

   Scenario: US07-37 - Check displayed correctly the links and render nodes (it have many outgoing node on same table by many FKs) when starting by owner and outgoing  nodes
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_36"
    And user views "Visualization>Display selected data" of records have ID are
    	| 1|
    	| 2|
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |	PLUS_SIGN	|
      |1	| A1 |	PLUS_SIGN	|
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |1	| A1 |	PLUS_SIGN	|
      |0	| A2 |	MINUS_SIGN	|

    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |  
    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |1	| A1 |	MINUS_SIGN	|
      |2	| A5 |		|
      |0	| A2 |	MINUS_SIGN	|
      |3	| A4 |		|
      |4	| A3 |		|

    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	1 |
      | 2 |	1 |
      | 3 |	1 |
      | 1 |	4 |
      | 1 |	0 |
    When user collapses on node "1"  
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |1	| A1 |	PLUS_SIGN	|
      |0	| A2 |	MINUS_SIGN	|

    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 | 
    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |1	| A1 |	MINUS_SIGN	|
      |2	| A5 |		|
      |0	| A2 |	MINUS_SIGN	|
      |3	| A4 |		|
      |4	| A3 |		|

    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	1 |
      | 2 |	1 |
      | 3 |	1 |
      | 1 |	4 |
      | 1 |	0 |    
        
    When user collapses on node "0"  
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |1	| A1 |	PLUS_SIGN	|
      |0	| A2 |	PLUS_SIGN	|
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |1	| A1 |	MINUS_SIGN	|
      |2	| A5 |		|
      |0	| A2 |	MINUS_SIGN	|
      |3	| A4 |		|
      |4	| A3 |		|

    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	1 |
      | 2 |	1 |
      | 3 |	1 |
      | 1 |	4 |
      | 1 |	0 |
      
	Scenario: US07-38 - Check displayed correctly the links and render nodes (it have many outgoing node(n level) on same table) when starting by a owner nodes
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_38"
    And user views "Visualization>Display selected data" of records have ID are
    	| 1|
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |  

    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 |    

    When user expands on node "2"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 | 
      | 2 |	3 |
      
    When user expands on node "3"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 | 
      | 2 |	3 |
      | 3 |	4 | 
      
    When user expands on node "4"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |	MINUS_SIGN	|
      |5	| A6 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 | 
      | 2 |	3 |
      | 3 |	4 |
      | 4 |	5 | 
      
    When user expands on node "5"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |	MINUS_SIGN	|
      |5	| A6 |	MINUS_SIGN	|
      |6	| A7 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 | 
      | 2 |	3 |
      | 3 |	4 |
      | 4 |	5 | 
      | 5 | 6 |      
       
    When user expands on node "6"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |	MINUS_SIGN	|
      |5	| A6 |	MINUS_SIGN	|
      |6	| A7 |	MINUS_SIGN	|
      |7	| A8 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 | 
      | 2 |	3 |
      | 3 |	4 |
      | 4 |	5 | 
      | 5 | 6 | 
      | 6 | 7 |  

    When user expands on node "7"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |	MINUS_SIGN	|
      |5	| A6 |	MINUS_SIGN	|
      |6	| A7 |	MINUS_SIGN	|
      |7	| A8 |	MINUS_SIGN	|
      |8	| A9 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 | 
      | 2 |	3 |
      | 3 |	4 |
      | 4 |	5 | 
      | 5 | 6 | 
      | 6 | 7 |                               
      | 7 | 8 |
      
    When user expands on node "8"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |	MINUS_SIGN	|
      |5	| A6 |	MINUS_SIGN	|
      |6	| A7 |	MINUS_SIGN	|
      |7	| A8 |	MINUS_SIGN	|
      |8	| A9 |	MINUS_SIGN	|
      |9 	| A10 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 | 
      | 2 |	3 |
      | 3 |	4 |
      | 4 |	5 | 
      | 5 | 6 | 
      | 6 | 7 |                               
      | 7 | 8 | 
      | 8 | 9 |     
      
    When user expands on node "9"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |	MINUS_SIGN	|
      |5	| A6 |	MINUS_SIGN	|
      |6	| A7 |	MINUS_SIGN	|
      |7	| A8 |	MINUS_SIGN	|
      |8	| A9 |	MINUS_SIGN	|
      |9	| A10 |	MINUS_SIGN	|
      |10 	| A11 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 | 
      | 2 |	3 |
      | 3 |	4 |
      | 4 |	5 | 
      | 5 | 6 | 
      | 6 | 7 |                               
      | 7 | 8 | 
      | 8 | 9 |
      | 9 | 10|   

    When user expands on node "10"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |	MINUS_SIGN	|
      |5	| A6 |	MINUS_SIGN	|
      |6	| A7 |	MINUS_SIGN	|
      |7	| A8 |	MINUS_SIGN	|
      |8	| A9 |	MINUS_SIGN	|
      |9	| A10 |	MINUS_SIGN	|
      |10	| A11 |	MINUS_SIGN	|
      |11 	| A12 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 | 
      | 2 |	3 |
      | 3 |	4 |
      | 4 |	5 | 
      | 5 | 6 | 
      | 6 | 7 |                               
      | 7 | 8 | 
      | 8 | 9 |
      | 9 | 10|
      | 10| 11|
      
    When user expands on node "11"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |	MINUS_SIGN	|
      |5	| A6 |	MINUS_SIGN	|
      |6	| A7 |	MINUS_SIGN	|
      |7	| A8 |	MINUS_SIGN	|
      |8	| A9 |	MINUS_SIGN	|
      |9	| A10 |	MINUS_SIGN	|
      |10	| A11 |	MINUS_SIGN	|
      |11	| A12 |	MINUS_SIGN	|
      |12 | A13 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 | 
      | 2 |	3 |
      | 3 |	4 |
      | 4 |	5 | 
      | 5 | 6 | 
      | 6 | 7 |                               
      | 7 | 8 | 
      | 8 | 9 |
      | 9 | 10|
      | 10| 11|  
      | 11| 12|

    When user expands on node "12"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |	MINUS_SIGN	|
      |5	| A6 |	MINUS_SIGN	|
      |6	| A7 |	MINUS_SIGN	|
      |7	| A8 |	MINUS_SIGN	|
      |8	| A9 |	MINUS_SIGN	|
      |9	| A10 |	MINUS_SIGN	|
      |10	| A11 |	MINUS_SIGN	|
      |11	| A12 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13 | A14 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 | 
      | 2 |	3 |
      | 3 |	4 |
      | 4 |	5 | 
      | 5 | 6 | 
      | 6 | 7 |                               
      | 7 | 8 | 
      | 8 | 9 |
      | 9 | 10|
      | 10| 11|  
      | 11| 12|     
      | 12| 13|     
      
    When user expands on node "13"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |	MINUS_SIGN	|
      |5	| A6 |	MINUS_SIGN	|
      |6	| A7 |	MINUS_SIGN	|
      |7	| A8 |	MINUS_SIGN	|
      |8	| A9 |	MINUS_SIGN	|
      |9	| A10 |	MINUS_SIGN	|
      |10	| A11 |	MINUS_SIGN	|
      |11	| A12 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13	| A14 |	MINUS_SIGN	|
      |14 | A15 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 | 
      | 2 |	3 |
      | 3 |	4 |
      | 4 |	5 | 
      | 5 | 6 | 
      | 6 | 7 |                               
      | 7 | 8 | 
      | 8 | 9 |
      | 9 | 10|
      | 10| 11|  
      | 11| 12|     
      | 12| 13|  
      | 13| 14|
      
    When user expands on node "14"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |	MINUS_SIGN	|
      |5	| A6 |	MINUS_SIGN	|
      |6	| A7 |	MINUS_SIGN	|
      |7	| A8 |	MINUS_SIGN	|
      |8	| A9 |	MINUS_SIGN	|
      |9	| A10 |	MINUS_SIGN	|
      |10	| A11 |	MINUS_SIGN	|
      |11	| A12 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13	| A14 |	MINUS_SIGN	|
      |14	| A15 |	MINUS_SIGN	|
      |15 | A16 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 | 
      | 2 |	3 |
      | 3 |	4 |
      | 4 |	5 | 
      | 5 | 6 | 
      | 6 | 7 |                               
      | 7 | 8 | 
      | 8 | 9 |
      | 9 | 10|
      | 10| 11|  
      | 11| 12|     
      | 12| 13|  
      | 13| 14|      
      | 14| 15|

    When user expands on node "15"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |	MINUS_SIGN	|
      |5	| A6 |	MINUS_SIGN	|
      |6	| A7 |	MINUS_SIGN	|
      |7	| A8 |	MINUS_SIGN	|
      |8	| A9 |	MINUS_SIGN	|
      |9	| A10 |	MINUS_SIGN	|
      |10	| A11 |	MINUS_SIGN	|
      |11	| A12 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13	| A14 |	MINUS_SIGN	|
      |14	| A15 |	MINUS_SIGN	|
      |15	| A16 |	MINUS_SIGN	|
      |16 | A17 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 | 
      | 2 |	3 |
      | 3 |	4 |
      | 4 |	5 | 
      | 5 | 6 | 
      | 6 | 7 |                               
      | 7 | 8 | 
      | 8 | 9 |
      | 9 | 10|
      | 10| 11|  
      | 11| 12|     
      | 12| 13|  
      | 13| 14|      
      | 14| 15|
      | 15| 16|
      
    When user expands on node "16"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |	MINUS_SIGN	|
      |5	| A6 |	MINUS_SIGN	|
      |6	| A7 |	MINUS_SIGN	|
      |7	| A8 |	MINUS_SIGN	|
      |8	| A9 |	MINUS_SIGN	|
      |9	| A10 |	MINUS_SIGN	|
      |10	| A11 |	MINUS_SIGN	|
      |11	| A12 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13	| A14 |	MINUS_SIGN	|
      |14	| A15 |	MINUS_SIGN	|
      |15	| A16 |	MINUS_SIGN	|
      |16	| A17 |	MINUS_SIGN	|
      |17 | A18 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 | 
      | 2 |	3 |
      | 3 |	4 |
      | 4 |	5 | 
      | 5 | 6 | 
      | 6 | 7 |                               
      | 7 | 8 | 
      | 8 | 9 |
      | 9 | 10|
      | 10| 11|  
      | 11| 12|     
      | 12| 13|  
      | 13| 14|      
      | 14| 15|
      | 15| 16|
      | 16| 17|

    When user expands on node "17"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |	MINUS_SIGN	|
      |5	| A6 |	MINUS_SIGN	|
      |6	| A7 |	MINUS_SIGN	|
      |7	| A8 |	MINUS_SIGN	|
      |8	| A9 |	MINUS_SIGN	|
      |9	| A10 |	MINUS_SIGN	|
      |10	| A11 |	MINUS_SIGN	|
      |11	| A12 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13	| A14 |	MINUS_SIGN	|
      |14	| A15 |	MINUS_SIGN	|
      |15	| A16 |	MINUS_SIGN	|
      |16	| A17 |	MINUS_SIGN	|
      |17	| A18 |	MINUS_SIGN	|
      |18 | A19 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 | 
      | 2 |	3 |
      | 3 |	4 |
      | 4 |	5 | 
      | 5 | 6 | 
      | 6 | 7 |                               
      | 7 | 8 | 
      | 8 | 9 |
      | 9 | 10|
      | 10| 11|  
      | 11| 12|     
      | 12| 13|  
      | 13| 14|      
      | 14| 15|
      | 15| 16|
      | 16| 17|
      | 17| 18| 
      
    When user expands on node "18"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |	MINUS_SIGN	|
      |5	| A6 |	MINUS_SIGN	|
      |6	| A7 |	MINUS_SIGN	|
      |7	| A8 |	MINUS_SIGN	|
      |8	| A9 |	MINUS_SIGN	|
      |9	| A10 |	MINUS_SIGN	|
      |10	| A11 |	MINUS_SIGN	|
      |11	| A12 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13	| A14 |	MINUS_SIGN	|
      |14	| A15 |	MINUS_SIGN	|
      |15	| A16 |	MINUS_SIGN	|
      |16	| A17 |	MINUS_SIGN	|
      |17	| A18 |	MINUS_SIGN	|
      |18	| A19 |	MINUS_SIGN	|
      |19 | A20 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 | 
      | 2 |	3 |
      | 3 |	4 |
      | 4 |	5 | 
      | 5 | 6 | 
      | 6 | 7 |                               
      | 7 | 8 | 
      | 8 | 9 |
      | 9 | 10|
      | 10| 11|  
      | 11| 12|     
      | 12| 13|  
      | 13| 14|      
      | 14| 15|
      | 15| 16|
      | 16| 17|
      | 17| 18|       
      | 18| 19|
      
    When user expands on node "19"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |	MINUS_SIGN	|
      |5	| A6 |	MINUS_SIGN	|
      |6	| A7 |	MINUS_SIGN	|
      |7	| A8 |	MINUS_SIGN	|
      |8	| A9 |	MINUS_SIGN	|
      |9	| A10 |	MINUS_SIGN	|
      |10	| A11 |	MINUS_SIGN	|
      |11	| A12 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13	| A14 |	MINUS_SIGN	|
      |14	| A15 |	MINUS_SIGN	|
      |15	| A16 |	MINUS_SIGN	|
      |16	| A17 |	MINUS_SIGN	|
      |17	| A18 |	MINUS_SIGN	|
      |18	| A19 |	MINUS_SIGN	|
      |19	| A20 |	MINUS_SIGN	|
      |20 | A21 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 | 
      | 2 |	3 |
      | 3 |	4 |
      | 4 |	5 | 
      | 5 | 6 | 
      | 6 | 7 |                               
      | 7 | 8 | 
      | 8 | 9 |
      | 9 | 10|
      | 10| 11|  
      | 11| 12|     
      | 12| 13|  
      | 13| 14|      
      | 14| 15|
      | 15| 16|
      | 16| 17|
      | 17| 18|       
      | 18| 19|   
      | 19| 20|

    When user expands on node "20"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |	MINUS_SIGN	|
      |5	| A6 |	MINUS_SIGN	|
      |6	| A7 |	MINUS_SIGN	|
      |7	| A8 |	MINUS_SIGN	|
      |8	| A9 |	MINUS_SIGN	|
      |9	| A10 |	MINUS_SIGN	|
      |10	| A11 |	MINUS_SIGN	|
      |11	| A12 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13	| A14 |	MINUS_SIGN	|
      |14	| A15 |	MINUS_SIGN	|
      |15	| A16 |	MINUS_SIGN	|
      |16	| A17 |	MINUS_SIGN	|
      |17	| A18 |	MINUS_SIGN	|
      |18	| A19 |	MINUS_SIGN	|
      |19	| A20 |	MINUS_SIGN	|
      |20	| A21 |	MINUS_SIGN	|
      |21 | A22 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 | 
      | 2 |	3 |
      | 3 |	4 |
      | 4 |	5 | 
      | 5 | 6 | 
      | 6 | 7 |                               
      | 7 | 8 | 
      | 8 | 9 |
      | 9 | 10|
      | 10| 11|  
      | 11| 12|     
      | 12| 13|  
      | 13| 14|      
      | 14| 15|
      | 15| 16|
      | 16| 17|
      | 17| 18|       
      | 18| 19|   
      | 19| 20|
      | 20| 21|    
      
      
    When user expands on node "21"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |	MINUS_SIGN	|
      |5	| A6 |	MINUS_SIGN	|
      |6	| A7 |	MINUS_SIGN	|
      |7	| A8 |	MINUS_SIGN	|
      |8	| A9 |	MINUS_SIGN	|
      |9	| A10 |	MINUS_SIGN	|
      |10	| A11 |	MINUS_SIGN	|
      |11	| A12 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13	| A14 |	MINUS_SIGN	|
      |14	| A15 |	MINUS_SIGN	|
      |15	| A16 |	MINUS_SIGN	|
      |16	| A17 |	MINUS_SIGN	|
      |17	| A18 |	MINUS_SIGN	|
      |18	| A19 |	MINUS_SIGN	|
      |19	| A20 |	MINUS_SIGN	|
      |20	| A21 |	MINUS_SIGN	|
      |21	| A22 |	MINUS_SIGN	|
      |22 | A23 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 | 
      | 2 |	3 |
      | 3 |	4 |
      | 4 |	5 | 
      | 5 | 6 | 
      | 6 | 7 |                               
      | 7 | 8 | 
      | 8 | 9 |
      | 9 | 10|
      | 10| 11|  
      | 11| 12|     
      | 12| 13|  
      | 13| 14|      
      | 14| 15|
      | 15| 16|
      | 16| 17|
      | 17| 18|       
      | 18| 19|   
      | 19| 20|
      | 20| 21|    
      | 21| 22|
  
      
    When user expands on node "22"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |	MINUS_SIGN	|
      |5	| A6 |	MINUS_SIGN	|
      |6	| A7 |	MINUS_SIGN	|
      |7	| A8 |	MINUS_SIGN	|
      |8	| A9 |	MINUS_SIGN	|
      |9	| A10 |	MINUS_SIGN	|
      |10	| A11 |	MINUS_SIGN	|
      |11	| A12 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13	| A14 |	MINUS_SIGN	|
      |14	| A15 |	MINUS_SIGN	|
      |15	| A16 |	MINUS_SIGN	|
      |16	| A17 |	MINUS_SIGN	|
      |17	| A18 |	MINUS_SIGN	|
      |18	| A19 |	MINUS_SIGN	|
      |19	| A20 |	MINUS_SIGN	|
      |20	| A21 |	MINUS_SIGN	|
      |21	| A22 |	MINUS_SIGN	|
      |22	| A23 |	MINUS_SIGN	|
      |23 | A24 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 | 
      | 2 |	3 |
      | 3 |	4 |
      | 4 |	5 | 
      | 5 | 6 | 
      | 6 | 7 |                               
      | 7 | 8 | 
      | 8 | 9 |
      | 9 | 10|
      | 10| 11|  
      | 11| 12|     
      | 12| 13|  
      | 13| 14|      
      | 14| 15|
      | 15| 16|
      | 16| 17|
      | 17| 18|       
      | 18| 19|   
      | 19| 20|
      | 20| 21|    
      | 21| 22|
      | 22| 23|  
  
    When user expands on node "23"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |	MINUS_SIGN	|
      |5	| A6 |	MINUS_SIGN	|
      |6	| A7 |	MINUS_SIGN	|
      |7	| A8 |	MINUS_SIGN	|
      |8	| A9 |	MINUS_SIGN	|
      |9	| A10 |	MINUS_SIGN	|
      |10	| A11 |	MINUS_SIGN	|
      |11	| A12 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13	| A14 |	MINUS_SIGN	|
      |14	| A15 |	MINUS_SIGN	|
      |15	| A16 |	MINUS_SIGN	|
      |16	| A17 |	MINUS_SIGN	|
      |17	| A18 |	MINUS_SIGN	|
      |18	| A19 |	MINUS_SIGN	|
      |19	| A20 |	MINUS_SIGN	|
      |20	| A21 |	MINUS_SIGN	|
      |21	| A22 |	MINUS_SIGN	|
      |22	| A23 |	MINUS_SIGN	|
      |23	| A24 |	MINUS_SIGN	|
      |24 | A25 |		|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 | 
      | 2 |	3 |
      | 3 |	4 |
      | 4 |	5 | 
      | 5 | 6 | 
      | 6 | 7 |                               
      | 7 | 8 | 
      | 8 | 9 |
      | 9 | 10|
      | 10| 11|  
      | 11| 12|     
      | 12| 13|  
      | 13| 14|      
      | 14| 15|
      | 15| 16|
      | 16| 17|
      | 17| 18|       
      | 18| 19|   
      | 19| 20|
      | 20| 21|    
      | 21| 22|
      | 22| 23| 
      | 23| 24|
            
    When user collapses on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|                
 
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |	MINUS_SIGN	|
      |5	| A6 |	MINUS_SIGN	|
      |6	| A7 |	MINUS_SIGN	|
      |7	| A8 |	MINUS_SIGN	|
      |8	| A9 |	MINUS_SIGN	|
      |9	| A10 |	MINUS_SIGN	|
      |10	| A11 |	MINUS_SIGN	|
      |11	| A12 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13	| A14 |	MINUS_SIGN	|
      |14	| A15 |	MINUS_SIGN	|
      |15	| A16 |	MINUS_SIGN	|
      |16	| A17 |	MINUS_SIGN	|
      |17	| A18 |	MINUS_SIGN	|
      |18	| A19 |	MINUS_SIGN	|
      |19	| A20 |	MINUS_SIGN	|
      |20	| A21 |	MINUS_SIGN	|
      |21	| A22 |	MINUS_SIGN	|
      |22	| A23 |	MINUS_SIGN	|
      |23	| A24 |	MINUS_SIGN	|
      |24 | A25 |		|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 | 
      | 2 |	3 |
      | 3 |	4 |
      | 4 |	5 | 
      | 5 | 6 | 
      | 6 | 7 |                               
      | 7 | 8 | 
      | 8 | 9 |
      | 9 | 10|
      | 10| 11|  
      | 11| 12|     
      | 12| 13|  
      | 13| 14|      
      | 14| 15|
      | 15| 16|
      | 16| 17|
      | 17| 18|       
      | 18| 19|   
      | 19| 20|
      | 20| 21|    
      | 21| 22|
      | 22| 23| 
      | 23| 24|      
      
	Scenario: US07-39 - Check keep correctly state of the links and render nodes (it have many outgoing node(n level) on same table) when starting by a owner nodes
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_38"
    And user views "Visualization>Display selected data" of records have ID are
    	| 1|
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
    When user expands on node "0"
    When user expands on node "1"
    When user expands on node "2" 
    When user expands on node "3"      
    When user expands on node "4"   
    When user expands on node "5"     
    When user expands on node "6"
    When user expands on node "7"
    When user expands on node "8"       
    When user expands on node "9"
    When user expands on node "10"     
    When user expands on node "11"
    When user expands on node "12"      
    When user expands on node "13"    
    When user expands on node "14"
    When user expands on node "15"    
    When user expands on node "16"
    When user expands on node "17"    
    When user expands on node "18"     
    When user expands on node "19"
    When user expands on node "20"    
    When user expands on node "21"     
    When user expands on node "22"
    When user expands on node "23"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |	MINUS_SIGN	|
      |5	| A6 |	MINUS_SIGN	|
      |6	| A7 |	MINUS_SIGN	|
      |7	| A8 |	MINUS_SIGN	|
      |8	| A9 |	MINUS_SIGN	|
      |9	| A10 |	MINUS_SIGN	|
      |10	| A11 |	MINUS_SIGN	|
      |11	| A12 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13	| A14 |	MINUS_SIGN	|
      |14	| A15 |	MINUS_SIGN	|
      |15	| A16 |	MINUS_SIGN	|
      |16	| A17 |	MINUS_SIGN	|
      |17	| A18 |	MINUS_SIGN	|
      |18	| A19 |	MINUS_SIGN	|
      |19	| A20 |	MINUS_SIGN	|
      |20	| A21 |	MINUS_SIGN	|
      |21	| A22 |	MINUS_SIGN	|
      |22	| A23 |	MINUS_SIGN	|
      |23	| A24 |	MINUS_SIGN	|
      |24 | A25 |		|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 | 
      | 2 |	3 |
      | 3 |	4 |
      | 4 |	5 | 
      | 5 | 6 | 
      | 6 | 7 |                               
      | 7 | 8 | 
      | 8 | 9 |
      | 9 | 10|
      | 10| 11|  
      | 11| 12|     
      | 12| 13|  
      | 13| 14|      
      | 14| 15|
      | 15| 16|
      | 16| 17|
      | 17| 18|       
      | 18| 19|   
      | 19| 20|
      | 20| 21|    
      | 21| 22|
      | 22| 23| 
      | 23| 24|

    When user collapses on node "11"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |	MINUS_SIGN	|
      |5	| A6 |	MINUS_SIGN	|
      |6	| A7 |	MINUS_SIGN	|
      |7	| A8 |	MINUS_SIGN	|
      |8	| A9 |	MINUS_SIGN	|
      |9	| A10 |	MINUS_SIGN	|
      |10	| A11 |	MINUS_SIGN	|
      |11 	| A12 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 | 
      | 2 |	3 |
      | 3 |	4 |
      | 4 |	5 | 
      | 5 | 6 | 
      | 6 | 7 |                               
      | 7 | 8 | 
      | 8 | 9 |
      | 9 | 10|
      | 10| 11|
            
    When user collapses on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|                
 
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |	MINUS_SIGN	|
      |5	| A6 |	MINUS_SIGN	|
      |6	| A7 |	MINUS_SIGN	|
      |7	| A8 |	MINUS_SIGN	|
      |8	| A9 |	MINUS_SIGN	|
      |9	| A10 |	MINUS_SIGN	|
      |10	| A11 |	MINUS_SIGN	|
      |11 	| A12 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |    
      | 1 |	2 | 
      | 2 |	3 |
      | 3 |	4 |
      | 4 |	5 | 
      | 5 | 6 | 
      | 6 | 7 |                               
      | 7 | 8 | 
      | 8 | 9 |
      | 9 | 10|
      | 10| 11|    
      
	Scenario: US07-40 - Check displayed correctly the links and render nodes (it have many incoming/outgoing node(n level) on same table) when starting by a owner and outgoing nodes
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_38"
    And user views "Visualization>Display selected data" of records have ID are
    	| 1|
    	| 2|
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |	PLUS_SIGN	|
      |1	| A1 |	PLUS_SIGN	|
      
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |	MINUS_SIGN	|
      |1	| A1 |		|
      |2	| A3 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    
      | 0 |	2 | 
      
    When user collapses on node "0"       
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |	PLUS_SIGN	|
      |1	| A1 |	PLUS_SIGN	|
      
    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |	PLUS_SIGN	|
      |1	| A1 |	MINUS_SIGN	|

    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    

    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |	MINUS_SIGN	|
      |1	| A1 |	MINUS_SIGN	|
      |2	| A3 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    
      | 0 |	2 | 

    When user collapses on node "1"       
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |	PLUS_SIGN	|
      |1	| A1 |	PLUS_SIGN	|        
      
 
	Scenario: US07-38 - Check displayed correctly the links and render nodes (it have many incoming node(n level) on same table) when starting by a owner nodes
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_38"
    And user views "Visualization>Display selected data" of records have ID are
    	| 25|
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	PLUS_SIGN	|
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	MINUS_SIGN	|
      |1	| A24 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |  

    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	MINUS_SIGN	|
      |1	| A24 |	MINUS_SIGN	|
      |2	| A23 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    
      | 2 |	1 |    

    When user expands on node "2"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	MINUS_SIGN	|
      |1	| A24 |	MINUS_SIGN	|
      |2	| A23 |	MINUS_SIGN	|
      |3	| A22 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    
      | 2 |	1 |  
      | 3 |	2 |
      
    When user expands on node "3"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	MINUS_SIGN	|
      |1	| A24 |	MINUS_SIGN	|
      |2	| A23 |	MINUS_SIGN	|
      |3	| A22 |	MINUS_SIGN	|
      |4	| A21 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    
      | 2 |	1 |  
      | 3 |	2 |
      | 4 |	3 | 
      
    When user expands on node "4"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	MINUS_SIGN	|
      |1	| A24 |	MINUS_SIGN	|
      |2	| A23 |	MINUS_SIGN	|
      |3	| A22 |	MINUS_SIGN	|
      |4	| A21 |	MINUS_SIGN	|
      |5	| A20 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    
      | 2 |	1 |  
      | 3 |	2 |
      | 4 |	3 |
      | 5 |	4 | 
      
    When user expands on node "5"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	MINUS_SIGN	|
      |1	| A24 |	MINUS_SIGN	|
      |2	| A23 |	MINUS_SIGN	|
      |3	| A22 |	MINUS_SIGN	|
      |4	| A21 |	MINUS_SIGN	|
      |5	| A20 |	MINUS_SIGN	|
      |6	| A19 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    
      | 2 |	1 |  
      | 3 |	2 |
      | 4 |	3 |
      | 5 |	4 | 
      | 6 | 5 |      
       
    When user expands on node "6"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	MINUS_SIGN	|
      |1	| A24 |	MINUS_SIGN	|
      |2	| A23 |	MINUS_SIGN	|
      |3	| A22 |	MINUS_SIGN	|
      |4	| A21 |	MINUS_SIGN	|
      |5	| A20 |	MINUS_SIGN	|
      |6	| A19 |	MINUS_SIGN	|
      |7	| A18 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    
      | 2 |	1 |  
      | 3 |	2 |
      | 4 |	3 |
      | 5 |	4 | 
      | 6 | 5 |  
      | 7 | 6 |  

    When user expands on node "7"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	MINUS_SIGN	|
      |1	| A24 |	MINUS_SIGN	|
      |2	| A23 |	MINUS_SIGN	|
      |3	| A22 |	MINUS_SIGN	|
      |4	| A21 |	MINUS_SIGN	|
      |5	| A20 |	MINUS_SIGN	|
      |6	| A19 |	MINUS_SIGN	|
      |7	| A18 |	MINUS_SIGN	|
      |8	| A17 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    
      | 2 |	1 |  
      | 3 |	2 |
      | 4 |	3 |
      | 5 |	4 | 
      | 6 | 5 |  
      | 7 | 6 |                              
      | 8 | 7 |
      
    When user expands on node "8"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	MINUS_SIGN	|
      |1	| A24 |	MINUS_SIGN	|
      |2	| A23 |	MINUS_SIGN	|
      |3	| A22 |	MINUS_SIGN	|
      |4	| A21 |	MINUS_SIGN	|
      |5	| A20 |	MINUS_SIGN	|
      |6	| A19 |	MINUS_SIGN	|
      |7	| A18 |	MINUS_SIGN	|
      |8	| A17 |	MINUS_SIGN	|
      |9 	| A16 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    
      | 2 |	1 |  
      | 3 |	2 |
      | 4 |	3 |
      | 5 |	4 | 
      | 6 | 5 |  
      | 7 | 6 |                              
      | 8 | 7 | 
      | 9 | 8 |     
      
    When user expands on node "9"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	MINUS_SIGN	|
      |1	| A24 |	MINUS_SIGN	|
      |2	| A23 |	MINUS_SIGN	|
      |3	| A22 |	MINUS_SIGN	|
      |4	| A21 |	MINUS_SIGN	|
      |5	| A20 |	MINUS_SIGN	|
      |6	| A19 |	MINUS_SIGN	|
      |7	| A18 |	MINUS_SIGN	|
      |8	| A17 |	MINUS_SIGN	|
      |9	| A16 |	MINUS_SIGN	|
      |10 | A15 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    
      | 2 |	1 |  
      | 3 |	2 |
      | 4 |	3 |
      | 5 |	4 | 
      | 6 | 5 |  
      | 7 | 6 |                              
      | 8 | 7 | 
      | 9 | 8 |
      | 10 | 9|   

    When user expands on node "10"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	MINUS_SIGN	|
      |1	| A24 |	MINUS_SIGN	|
      |2	| A23 |	MINUS_SIGN	|
      |3	| A22 |	MINUS_SIGN	|
      |4	| A21 |	MINUS_SIGN	|
      |5	| A20 |	MINUS_SIGN	|
      |6	| A19 |	MINUS_SIGN	|
      |7	| A18 |	MINUS_SIGN	|
      |8	| A17 |	MINUS_SIGN	|
      |9	| A16 |	MINUS_SIGN	|
      |10	| A15 |	MINUS_SIGN	|
      |11 | A14 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    
      | 2 |	1 |  
      | 3 |	2 |
      | 4 |	3 |
      | 5 |	4 | 
      | 6 | 5 |  
      | 7 | 6 |                              
      | 8 | 7 | 
      | 9 | 8 |
      | 10| 9 | 
      | 11| 10|
      
    When user expands on node "11"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	MINUS_SIGN	|
      |1	| A24 |	MINUS_SIGN	|
      |2	| A23 |	MINUS_SIGN	|
      |3	| A22 |	MINUS_SIGN	|
      |4	| A21 |	MINUS_SIGN	|
      |5	| A20 |	MINUS_SIGN	|
      |6	| A19 |	MINUS_SIGN	|
      |7	| A18 |	MINUS_SIGN	|
      |8	| A17 |	MINUS_SIGN	|
      |9	| A16 |	MINUS_SIGN	|
      |10	| A15 |	MINUS_SIGN	|
      |11	| A14 |	MINUS_SIGN	|
      |12 | A13 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    
      | 2 |	1 |  
      | 3 |	2 |
      | 4 |	3 |
      | 5 |	4 | 
      | 6 | 5 |  
      | 7 | 6 |                              
      | 8 | 7 | 
      | 9 | 8 |
      | 10| 9 | 
      | 11| 10|  
      | 12| 11|

    When user expands on node "12"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	MINUS_SIGN	|
      |1	| A24 |	MINUS_SIGN	|
      |2	| A23 |	MINUS_SIGN	|
      |3	| A22 |	MINUS_SIGN	|
      |4	| A21 |	MINUS_SIGN	|
      |5	| A20 |	MINUS_SIGN	|
      |6	| A19 |	MINUS_SIGN	|
      |7	| A18 |	MINUS_SIGN	|
      |8	| A17 |	MINUS_SIGN	|
      |9	| A16 |	MINUS_SIGN	|
      |10	| A15 |	MINUS_SIGN	|
      |11	| A14 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13 | A12 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    
      | 2 |	1 |  
      | 3 |	2 |
      | 4 |	3 |
      | 5 |	4 | 
      | 6 | 5 |  
      | 7 | 6 |                              
      | 8 | 7 | 
      | 9 | 8 |
      | 10| 9 | 
      | 11| 10|  
      | 12| 11|    
      | 13| 12|     
      
    When user expands on node "13"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	MINUS_SIGN	|
      |1	| A24 |	MINUS_SIGN	|
      |2	| A23 |	MINUS_SIGN	|
      |3	| A22 |	MINUS_SIGN	|
      |4	| A21 |	MINUS_SIGN	|
      |5	| A20 |	MINUS_SIGN	|
      |6	| A19 |	MINUS_SIGN	|
      |7	| A18 |	MINUS_SIGN	|
      |8	| A17 |	MINUS_SIGN	|
      |9	| A16 |	MINUS_SIGN	|
      |10	| A15 |	MINUS_SIGN	|
      |11	| A14 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13	| A12 |	MINUS_SIGN	|
      |14 | A11 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    
      | 2 |	1 |  
      | 3 |	2 |
      | 4 |	3 |
      | 5 |	4 | 
      | 6 | 5 |  
      | 7 | 6 |                              
      | 8 | 7 | 
      | 9 | 8 |
      | 10| 9 | 
      | 11| 10|  
      | 12| 11|    
      | 13| 12|    
      | 14| 13|
      
    When user expands on node "14"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	MINUS_SIGN	|
      |1	| A24 |	MINUS_SIGN	|
      |2	| A23 |	MINUS_SIGN	|
      |3	| A22 |	MINUS_SIGN	|
      |4	| A21 |	MINUS_SIGN	|
      |5	| A20 |	MINUS_SIGN	|
      |6	| A19 |	MINUS_SIGN	|
      |7	| A18 |	MINUS_SIGN	|
      |8	| A17 |	MINUS_SIGN	|
      |9	| A16 |	MINUS_SIGN	|
      |10	| A15 |	MINUS_SIGN	|
      |11	| A14 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13	| A12 |	MINUS_SIGN	|
      |14	| A11 |	MINUS_SIGN	|
      |15 | A10 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    
      | 2 |	1 |  
      | 3 |	2 |
      | 4 |	3 |
      | 5 |	4 | 
      | 6 | 5 |  
      | 7 | 6 |                              
      | 8 | 7 | 
      | 9 | 8 |
      | 10| 9 | 
      | 11| 10|  
      | 12| 11|    
      | 13| 12|    
      | 14| 13|      
      | 15| 14|

    When user expands on node "15"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	MINUS_SIGN	|
      |1	| A24 |	MINUS_SIGN	|
      |2	| A23 |	MINUS_SIGN	|
      |3	| A22 |	MINUS_SIGN	|
      |4	| A21 |	MINUS_SIGN	|
      |5	| A20 |	MINUS_SIGN	|
      |6	| A19 |	MINUS_SIGN	|
      |7	| A18 |	MINUS_SIGN	|
      |8	| A17 |	MINUS_SIGN	|
      |9	| A16 |	MINUS_SIGN	|
      |10	| A15 |	MINUS_SIGN	|
      |11	| A14 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13	| A12 |	MINUS_SIGN	|
      |14	| A11 |	MINUS_SIGN	|
      |15	| A10 |	MINUS_SIGN	|
      |16 | A9 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    
      | 2 |	1 |  
      | 3 |	2 |
      | 4 |	3 |
      | 5 |	4 | 
      | 6 | 5 |  
      | 7 | 6 |                              
      | 8 | 7 | 
      | 9 | 8 |
      | 10| 9 | 
      | 11| 10|  
      | 12| 11|    
      | 13| 12|    
      | 14| 13|      
      | 15| 14|
      | 16| 15|
      
    When user expands on node "16"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	MINUS_SIGN	|
      |1	| A24 |	MINUS_SIGN	|
      |2	| A23 |	MINUS_SIGN	|
      |3	| A22 |	MINUS_SIGN	|
      |4	| A21 |	MINUS_SIGN	|
      |5	| A20 |	MINUS_SIGN	|
      |6	| A19 |	MINUS_SIGN	|
      |7	| A18 |	MINUS_SIGN	|
      |8	| A17 |	MINUS_SIGN	|
      |9	| A16 |	MINUS_SIGN	|
      |10	| A15 |	MINUS_SIGN	|
      |11	| A14 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13	| A12 |	MINUS_SIGN	|
      |14	| A11 |	MINUS_SIGN	|
      |15	| A10 |	MINUS_SIGN	|
      |16	| A9 |	MINUS_SIGN	|
      |17 | A8 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    
      | 2 |	1 |  
      | 3 |	2 |
      | 4 |	3 |
      | 5 |	4 | 
      | 6 | 5 |  
      | 7 | 6 |                              
      | 8 | 7 | 
      | 9 | 8 |
      | 10| 9 | 
      | 11| 10|  
      | 12| 11|    
      | 13| 12|    
      | 14| 13|      
      | 15| 14|
      | 16| 15|
      | 17| 16|

    When user expands on node "17"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	MINUS_SIGN	|
      |1	| A24 |	MINUS_SIGN	|
      |2	| A23 |	MINUS_SIGN	|
      |3	| A22 |	MINUS_SIGN	|
      |4	| A21 |	MINUS_SIGN	|
      |5	| A20 |	MINUS_SIGN	|
      |6	| A19 |	MINUS_SIGN	|
      |7	| A18 |	MINUS_SIGN	|
      |8	| A17 |	MINUS_SIGN	|
      |9	| A16 |	MINUS_SIGN	|
      |10	| A15 |	MINUS_SIGN	|
      |11	| A14 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13	| A12 |	MINUS_SIGN	|
      |14	| A11 |	MINUS_SIGN	|
      |15	| A10 |	MINUS_SIGN	|
      |16	| A9 |	MINUS_SIGN	|
      |17	| A8 |	MINUS_SIGN	|
      |18 | A7 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    
      | 2 |	1 |  
      | 3 |	2 |
      | 4 |	3 |
      | 5 |	4 | 
      | 6 | 5 |  
      | 7 | 6 |                              
      | 8 | 7 | 
      | 9 | 8 |
      | 10| 9 | 
      | 11| 10|  
      | 12| 11|    
      | 13| 12|    
      | 14| 13|      
      | 15| 14|
      | 16| 15|
      | 17| 16|
      | 18| 17| 
      
    When user expands on node "18"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	MINUS_SIGN	|
      |1	| A24 |	MINUS_SIGN	|
      |2	| A23 |	MINUS_SIGN	|
      |3	| A22 |	MINUS_SIGN	|
      |4	| A21 |	MINUS_SIGN	|
      |5	| A20 |	MINUS_SIGN	|
      |6	| A19 |	MINUS_SIGN	|
      |7	| A18 |	MINUS_SIGN	|
      |8	| A17 |	MINUS_SIGN	|
      |9	| A16 |	MINUS_SIGN	|
      |10	| A15 |	MINUS_SIGN	|
      |11	| A14 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13	| A12 |	MINUS_SIGN	|
      |14	| A11 |	MINUS_SIGN	|
      |15	| A10 |	MINUS_SIGN	|
      |16	| A9 |	MINUS_SIGN	|
      |17	| A8 |	MINUS_SIGN	|
      |18	| A7 |	MINUS_SIGN	|
      |19 | A6 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    
      | 2 |	1 |  
      | 3 |	2 |
      | 4 |	3 |
      | 5 |	4 | 
      | 6 | 5 |  
      | 7 | 6 |                              
      | 8 | 7 | 
      | 9 | 8 |
      | 10| 9 | 
      | 11| 10|  
      | 12| 11|    
      | 13| 12|    
      | 14| 13|      
      | 15| 14|
      | 16| 15|
      | 17| 16|
      | 18| 17|      
      | 19| 18|
      
    When user expands on node "19"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	MINUS_SIGN	|
      |1	| A24 |	MINUS_SIGN	|
      |2	| A23 |	MINUS_SIGN	|
      |3	| A22 |	MINUS_SIGN	|
      |4	| A21 |	MINUS_SIGN	|
      |5	| A20 |	MINUS_SIGN	|
      |6	| A19 |	MINUS_SIGN	|
      |7	| A18 |	MINUS_SIGN	|
      |8	| A17 |	MINUS_SIGN	|
      |9	| A16 |	MINUS_SIGN	|
      |10	| A15 |	MINUS_SIGN	|
      |11	| A14 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13	| A12 |	MINUS_SIGN	|
      |14	| A11 |	MINUS_SIGN	|
      |15	| A10 |	MINUS_SIGN	|
      |16	| A9 |	MINUS_SIGN	|
      |17	| A8 |	MINUS_SIGN	|
      |18	| A7 |	MINUS_SIGN	|
      |19	| A6 |	MINUS_SIGN	|
      |20 | A5 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    
      | 2 |	1 |  
      | 3 |	2 |
      | 4 |	3 |
      | 5 |	4 | 
      | 6 | 5 |  
      | 7 | 6 |                              
      | 8 | 7 | 
      | 9 | 8 |
      | 10| 9 | 
      | 11| 10|  
      | 12| 11|    
      | 13| 12|    
      | 14| 13|      
      | 15| 14|
      | 16| 15|
      | 17| 16|
      | 18| 17|      
      | 19| 18|  
      | 20| 19|

    When user expands on node "20"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	MINUS_SIGN	|
      |1	| A24 |	MINUS_SIGN	|
      |2	| A23 |	MINUS_SIGN	|
      |3	| A22 |	MINUS_SIGN	|
      |4	| A21 |	MINUS_SIGN	|
      |5	| A20 |	MINUS_SIGN	|
      |6	| A19 |	MINUS_SIGN	|
      |7	| A18 |	MINUS_SIGN	|
      |8	| A17 |	MINUS_SIGN	|
      |9	| A16 |	MINUS_SIGN	|
      |10	| A15 |	MINUS_SIGN	|
      |11	| A14 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13	| A12 |	MINUS_SIGN	|
      |14	| A11 |	MINUS_SIGN	|
      |15	| A10 |	MINUS_SIGN	|
      |16	| A9 |	MINUS_SIGN	|
      |17	| A8 |	MINUS_SIGN	|
      |18	| A7 |	MINUS_SIGN	|
      |19	| A6 |	MINUS_SIGN	|
      |20	| A5 |	MINUS_SIGN	|
      |21 | A4 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    
      | 2 |	1 |  
      | 3 |	2 |
      | 4 |	3 |
      | 5 |	4 | 
      | 6 | 5 |  
      | 7 | 6 |                              
      | 8 | 7 | 
      | 9 | 8 |
      | 10| 9 | 
      | 11| 10|  
      | 12| 11|    
      | 13| 12|    
      | 14| 13|      
      | 15| 14|
      | 16| 15|
      | 17| 16|
      | 18| 17|      
      | 19| 18|  
      | 20| 19|
      | 21| 20|    
      
      
    When user expands on node "21"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	MINUS_SIGN	|
      |1	| A24 |	MINUS_SIGN	|
      |2	| A23 |	MINUS_SIGN	|
      |3	| A22 |	MINUS_SIGN	|
      |4	| A21 |	MINUS_SIGN	|
      |5	| A20 |	MINUS_SIGN	|
      |6	| A19 |	MINUS_SIGN	|
      |7	| A18 |	MINUS_SIGN	|
      |8	| A17 |	MINUS_SIGN	|
      |9	| A16 |	MINUS_SIGN	|
      |10	| A15 |	MINUS_SIGN	|
      |11	| A14 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13	| A12 |	MINUS_SIGN	|
      |14	| A11 |	MINUS_SIGN	|
      |15	| A10 |	MINUS_SIGN	|
      |16	| A9 |	MINUS_SIGN	|
      |17	| A8 |	MINUS_SIGN	|
      |18	| A7 |	MINUS_SIGN	|
      |19	| A6 |	MINUS_SIGN	|
      |20	| A5 |	MINUS_SIGN	|
      |21	| A4 |	MINUS_SIGN	|
      |22 | A3 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    
      | 2 |	1 |  
      | 3 |	2 |
      | 4 |	3 |
      | 5 |	4 | 
      | 6 | 5 |  
      | 7 | 6 |                              
      | 8 | 7 | 
      | 9 | 8 |
      | 10| 9 | 
      | 11| 10|  
      | 12| 11|    
      | 13| 12|    
      | 14| 13|      
      | 15| 14|
      | 16| 15|
      | 17| 16|
      | 18| 17|      
      | 19| 18|  
      | 20| 19|
      | 21| 20|       
      | 22| 21|
  
      
    When user expands on node "22"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	MINUS_SIGN	|
      |1	| A24 |	MINUS_SIGN	|
      |2	| A23 |	MINUS_SIGN	|
      |3	| A22 |	MINUS_SIGN	|
      |4	| A21 |	MINUS_SIGN	|
      |5	| A20 |	MINUS_SIGN	|
      |6	| A19 |	MINUS_SIGN	|
      |7	| A18 |	MINUS_SIGN	|
      |8	| A17 |	MINUS_SIGN	|
      |9	| A16 |	MINUS_SIGN	|
      |10	| A15 |	MINUS_SIGN	|
      |11	| A14 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13	| A12 |	MINUS_SIGN	|
      |14	| A11 |	MINUS_SIGN	|
      |15	| A10 |	MINUS_SIGN	|
      |16	| A9 |	MINUS_SIGN	|
      |17	| A8 |	MINUS_SIGN	|
      |18	| A7 |	MINUS_SIGN	|
      |19	| A6 |	MINUS_SIGN	|
      |20	| A5 |	MINUS_SIGN	|
      |21	| A4 |	MINUS_SIGN	|
      |22	| A3 |	MINUS_SIGN	|
      |23 | A2 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    
      | 2 |	1 |  
      | 3 |	2 |
      | 4 |	3 |
      | 5 |	4 | 
      | 6 | 5 |  
      | 7 | 6 |                              
      | 8 | 7 | 
      | 9 | 8 |
      | 10| 9 | 
      | 11| 10|  
      | 12| 11|    
      | 13| 12|    
      | 14| 13|      
      | 15| 14|
      | 16| 15|
      | 17| 16|
      | 18| 17|      
      | 19| 18|  
      | 20| 19|
      | 21| 20|       
      | 22| 21|
      | 23| 22|  
  
    When user expands on node "23"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	MINUS_SIGN	|
      |1	| A24 |	MINUS_SIGN	|
      |2	| A23 |	MINUS_SIGN	|
      |3	| A22 |	MINUS_SIGN	|
      |4	| A21 |	MINUS_SIGN	|
      |5	| A20 |	MINUS_SIGN	|
      |6	| A19 |	MINUS_SIGN	|
      |7	| A18 |	MINUS_SIGN	|
      |8	| A17 |	MINUS_SIGN	|
      |9	| A16 |	MINUS_SIGN	|
      |10	| A15 |	MINUS_SIGN	|
      |11	| A14 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13	| A12 |	MINUS_SIGN	|
      |14	| A11 |	MINUS_SIGN	|
      |15	| A10 |	MINUS_SIGN	|
      |16	| A9 |	MINUS_SIGN	|
      |17	| A8 |	MINUS_SIGN	|
      |18	| A7 |	MINUS_SIGN	|
      |19	| A6 |	MINUS_SIGN	|
      |20	| A5 |	MINUS_SIGN	|
      |21	| A4 |	MINUS_SIGN	|
      |22	| A3 |	MINUS_SIGN	|
      |23	| A2 |	MINUS_SIGN	|
      |24 | A1 |		|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    
      | 2 |	1 |  
      | 3 |	2 |
      | 4 |	3 |
      | 5 |	4 | 
      | 6 | 5 |  
      | 7 | 6 |                              
      | 8 | 7 | 
      | 9 | 8 |
      | 10| 9 | 
      | 11| 10|  
      | 12| 11|    
      | 13| 12|    
      | 14| 13|      
      | 15| 14|
      | 16| 15|
      | 17| 16|
      | 18| 17|      
      | 19| 18|  
      | 20| 19|
      | 21| 20|       
      | 22| 21|
      | 23| 22| 
      | 24| 23|
            
    When user collapses on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	PLUS_SIGN	|                
 
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A25 |	MINUS_SIGN	|
      |1	| A24 |	MINUS_SIGN	|
      |2	| A23 |	MINUS_SIGN	|
      |3	| A22 |	MINUS_SIGN	|
      |4	| A21 |	MINUS_SIGN	|
      |5	| A20 |	MINUS_SIGN	|
      |6	| A19 |	MINUS_SIGN	|
      |7	| A18 |	MINUS_SIGN	|
      |8	| A17 |	MINUS_SIGN	|
      |9	| A16 |	MINUS_SIGN	|
      |10	| A15 |	MINUS_SIGN	|
      |11	| A14 |	MINUS_SIGN	|
      |12	| A13 |	MINUS_SIGN	|
      |13	| A12 |	MINUS_SIGN	|
      |14	| A11 |	MINUS_SIGN	|
      |15	| A10 |	MINUS_SIGN	|
      |16	| A9 |	MINUS_SIGN	|
      |17	| A8 |	MINUS_SIGN	|
      |18	| A7 |	MINUS_SIGN	|
      |19	| A6 |	MINUS_SIGN	|
      |20	| A5 |	MINUS_SIGN	|
      |21	| A4 |	MINUS_SIGN	|
      |22	| A3 |	MINUS_SIGN	|
      |23	| A2 |	MINUS_SIGN	|
      |24 | A1 |		|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |    
      | 2 |	1 |  
      | 3 |	2 |
      | 4 |	3 |
      | 5 |	4 | 
      | 6 | 5 |  
      | 7 | 6 |                              
      | 8 | 7 | 
      | 9 | 8 |
      | 10| 9 | 
      | 11| 10|  
      | 12| 11|    
      | 13| 12|    
      | 14| 13|      
      | 15| 14|
      | 16| 15|
      | 17| 16|
      | 18| 17|      
      | 19| 18|  
      | 20| 19|
      | 21| 20|       
      | 22| 21|
      | 23| 22| 
      | 24| 23|        