@DMDV100
Feature: Test graph data with configuration
  Background: 
    Given I login to EBX succesfully

@Line-FKtoAnothertable(Samedataset)
Scenario: Data_98 - Check expand collapse node when it has a outgoing node on another table by  many FKs
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-67"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "Data_98"
    Then the graph should be displayed
#5. Expand target of A1
		When user expands target on node "0"		
    Then the label of all nodes is displayed as following
				| A1 | RIGHT |	|
				| B1 |  |	|
				| C1 |  |	|								
		Then the label of link label should be display as following
				 | 0 | 1 |  |
				 | 0 | 2 |  |
#6. Collapse parent A2
		When user collapse target on node "0"
    Then the label of all nodes is displayed as following
				| A1 | RIGHT |	|
		Then there is no link displayed
		
Scenario: Data_99 - Check expand collapse node when it has a incoming & outgoing node on another table by  many FKs
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-68"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
       |1|
       |2|
    And user generates graph with configuration "Data_99"
    Then the graph should be displayed
#5. Expand target & source of A1
		When user expands target on node "1"	
		When user expands source on node "1"			
    Then the label of all nodes is displayed as following
					| A2 | LEFT,RIGHT |	|
					| A1 | LEFT,RIGHT |	|
					| B1 |  |	|
						
		Then the label of link label should be display as following
				 | 2 | 1 |  |
				 | 1 | 2 |  |
#6. Collapse target & source A2
		When user collapse target on node "1"	
		When user collapse source on node "1"			
    Then the label of all nodes is displayed as following
				| A1 | LEFT,RIGHT |	|
				| A2 | LEFT,RIGHT |	|
		Then there is no link displayed
 #7,8. Expand target & source of A1
		When user expands target recursively on node "1"	
		When user expands source recursively on node "1"			
    Then the label of all nodes is displayed as following
					| A2 | LEFT,RIGHT |	|
					| A1 | RIGHT |	|
					| B1 | RIGHT |	|
						
		Then the label of link label should be display as following
				 | 2 | 1 |  |
				 | 1 | 2 |  |			
				 
#9,10. Expand target & source of A2
		When user expands target on node "0"	
		When user expands source on node "0"			
    Then the label of all nodes is displayed as following
					| A2 | LEFT,RIGHT |	|
					| A1 | RIGHT |	|
					| B1 | RIGHT |	|
					| B3 |  |	|
          | B2 |  |	|	
		Then the label of link label should be display as following
					 | 1 | 2 |  |
					 | 2 | 1 |  |
					 | 0 | 3 |  |
					 | 0 | 4 |  |
					 | 3 | 0 |  |
					 | 4 | 0 |  |
#11. Collapse target & source A2
		When user collapse target on node "0"	
		When user collapse source on node "0"			
    Then the label of all nodes is displayed as following
					| A2 | LEFT,RIGHT |	|
					| A1 | RIGHT |	|
					| B1 | RIGHT |	|
						
		Then the label of link label should be display as following
					 | 2 | 1 |  |
					 | 1 | 2 |  |				 	 
					 
#12. Collapse target & source A1
		When user collapse target on node "1"	
		When user collapse source on node "1"			
    Then the label of all nodes is displayed as following
				| A1 | LEFT,RIGHT |	|
				| A2 | LEFT,RIGHT |	|
		Then there is no link displayed	
		
Scenario: Data_100 - Check expand & collapse node for a starting node when it have many incoming node on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-69"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
       |1|
    And user generates graph with configuration "Data_100"
    Then the graph should be displayed
#5. Expand source of A1
		When user expands source on node "0"			
    Then the label of all nodes is displayed as following
					| A1 | LEFT,RIGHT |	|
					| B1 |  |	|
					| C1 |  |	|	
		Then the label of link label should be display as following
				 | 2 | 0 |  |
				 | 1 | 0 |  |
#6. Collapse source A1
		When user collapse source on node "0"			
    Then the label of all nodes is displayed as following
				| A1 | LEFT,RIGHT |	|
		Then there is no link displayed
 #7. Expand source recursively of A1
		When user expands source recursively on node "0"			
    Then the label of all nodes is displayed as following
					| A1 | LEFT,RIGHT |	|
					| B1 |  |	|
					| C1 |  |	|	
		Then the label of link label should be display as following
					 | 2 | 0 |  |
					 | 1 | 0 |  |
				 
#8. Expand target of A1
		When user expands target on node "0"	
    Then the label of all nodes is displayed as following
					| A1 | LEFT,RIGHT |	|
					| B1 |  |	|
					| C1 |  |	|	
		Then the label of link label should be display as following
				 | 2 | 0 |  |
				 | 1 | 0 |  |
				 | 0 | 0 |  |		
				 
Scenario: Data_101 - Check displayed correctly relationship of nodes (that have many incoming node on another table) when was Expanded/ Collapsed many time
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-69"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
       |1|
    And user generates graph with configuration "Data_100"
    Then the graph should be displayed
#5. Expand source & target of A1
		When user expands source on node "0"			
		When user expands target on node "0"	
    Then the label of all nodes is displayed as following
					| A1 | LEFT,RIGHT |	|
					| B1 |  |	|
					| C1 |  |	|	
		Then the label of link label should be display as following
				 | 2 | 0 |  |
				 | 1 | 0 |  |
				 | 0 | 0 |  |
#6. Collapse source A1
		When user collapse source on node "0"			
    Then the label of all nodes is displayed as following
				  | A1 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				   | 0 | 0 |  |
 #7. Expand source recursively of A1
		When user expands source recursively on node "0"			
    Then the label of all nodes is displayed as following
					| A1 | LEFT,RIGHT |	|
					| B1 |  |	|
					| C1 |  |	|	
		Then the label of link label should be display as following
					 | 2 | 0 |  |
					 | 1 | 0 |  |
				   | 0 | 0 |  |					 
#8. Collapse target A1
		When user collapse target on node "0"			
    Then the label of all nodes is displayed as following
					| A1 | LEFT,RIGHT |	|
					| B1 |  |	|
					| C1 |  |	|	
		Then the label of link label should be display as following
					 | 2 | 0 |  |
					 | 1 | 0 |  |			 
 #9. Expand target recursively of A1
		When user expands target recursively on node "0"			
    Then the label of all nodes is displayed as following
					| A1 | LEFT,RIGHT |	|
					| B1 |  |	|
					| C1 |  |	|	
		Then the label of link label should be display as following
					 | 2 | 0 |  |
					 | 1 | 0 |  |
				   | 0 | 0 |  |			
				   
Scenario: Data_102 - Check displayed correctly relationship of nodes (that have many incoming node on another table) when was started by a incoming nodes then Expand/ Collapse them many time
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-69"
    And I access table "TableC"
    And user views "Visualization>Display data using configuration" of records have ID are
       |1|
    And user generates graph with configuration "Data_100"
    Then the graph should be displayed
#5. Expand target of C1
		When user expands target on node "0"	
    Then the label of all nodes is displayed as following
					| C1 | RIGHT |	|
					| A1 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				  | 0 | 1 |  |
    
#5. Expand source & target of A1
		When user expands source on node "1"			
		When user expands target on node "1"	
    Then the label of all nodes is displayed as following
					| C1 | RIGHT |	|
					| A1 | LEFT,RIGHT |	|
					| B1 |  |	|

		Then the label of link label should be display as following
					 | 0 | 1 |  |
					 | 2 | 1 |  |
					 | 1 | 1 |  |
#6. Collapse source A1
		When user collapse source on node "1"			
    Then the label of all nodes is displayed as following
					| C1 | RIGHT |	|
					| A1 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
					 | 0 | 1 |  |
					 | 1 | 1 |  |
 #7. Expand source recursively of A1
		When user expands source recursively on node "1"			
    Then the label of all nodes is displayed as following
					| C1 | RIGHT |	|
					| A1 | LEFT,RIGHT |	|
					| B1 |  |	|

		Then the label of link label should be display as following
					 | 0 | 1 |  |
					 | 2 | 1 |  |
					 | 1 | 1 |  |					 
#8. Collapse target C1
		When user collapse target on node "0"			
    Then the label of all nodes is displayed as following
					| C1 | RIGHT |	|
 		Then there is no link displayed
 #9. Expand target recursively of C1
		When user expands target recursively on node "0"			
    Then the label of all nodes is displayed as following
					| C1 | RIGHT |	|
					| A1 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
					 | 0 | 1 |  |
					 | 1 | 1 |  |	
					 
Scenario: Data_103 - Check displayed correctly relationship of nodes (that have many incoming node on another table) when was started by two incoming nodes then Expand/ Collapse them many time
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-72"
    And I access table "TableB"
    And user views "Visualization>Display data using configuration" of records have ID are
       |1|
       |2|
    And user generates graph with configuration "Data_103"
    Then the graph should be displayed
#5. Expand target of B1
		When user expands target on node "0"	
    Then the label of all nodes is displayed as following
					| B1 | RIGHT |	|
					| B2 | RIGHT |	|
					| A1 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				  | 0 | 2 |  |
    
#5. Expand source & target of A1
		When user expands source on node "2"			
		When user expands target on node "2"	
    Then the label of all nodes is displayed as following
					| B1 | RIGHT |	|
					| B2 |  |	|
					| A1 | LEFT,RIGHT |	|
					| B3 |  |	|
					| Bn |  |	|

		Then the label of link label should be display as following
				  | 0 | 2 |  |
				  | 1 | 2 |  |		
				  | 2 | 2 |  |	
				  | 3 | 2 |  |
				  | 4 | 2 |  |	  
#6. Collapse target B1
		When user collapse target on node "0"			
    Then the label of all nodes is displayed as following
					| B1 | RIGHT |	|
					| B2 | RIGHT |	|
 		Then there is no link displayed
#7. Expand target recursively of B2
		When user expands target recursively on node "1"			
    Then the label of all nodes is displayed as following
					| B1 | RIGHT |	|
					| B2 | RIGHT |	|
					| A1 | LEFT,RIGHT |	|

		Then the label of link label should be display as following
				  | 1 | 2 |  |		
				  | 2 | 2 |  |				 
 #10. Expand source recursively of A1
		When user expands source recursively on node "2"			
    Then the label of all nodes is displayed as following
					| B1 |  |	|
					| B2 | RIGHT |	|
					| A1 | LEFT,RIGHT |	|
					| B3 |  |	|
					| Bn |  |	|

		Then the label of link label should be display as following
				  | 0 | 2 |  |
				  | 1 | 2 |  |		
				  | 2 | 2 |  |	
				  | 3 | 2 |  |
				  | 4 | 2 |  |
#6. Collapse target B2
		When user collapse target on node "1"			
    Then the label of all nodes is displayed as following
					| B1 | RIGHT |	|
					| B2 | RIGHT |	|
 		Then there is no link displayed					
 		
Scenario: Data_104 - Check displayed correctly relationship of nodes (that have many incoming node on another table) when was started by all incoming nodes then Expand/ Collapse them many time
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-72"
    And I access table "TableB"
    And user views "Visualization>Display data using configuration" of records have ID are
       |1|
       |2|
       |3|
       |4|
    And user generates graph with configuration "Data_103"
    Then the graph should be displayed
#5. Expand target of B1
		When user expands target on node "0"	
    Then the label of all nodes is displayed as following
					| B1 | RIGHT |	|
					| B2 | RIGHT |	|
					| B3 | RIGHT |	|
					| Bn | RIGHT |	|					
					| A1 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				  | 0 | 4 |  |
    
#5. Expand source of A1
		When user expands source on node "4"			
    Then the label of all nodes is displayed as following
					| B1 | RIGHT |	|
					| B2 |  |	|
					| B3 |  |	|
					| Bn |  |	|					
					| A1 | LEFT,RIGHT |	|

		Then the label of link label should be display as following
				  | 0 | 4 |  |
				  | 1 | 4 |  |		
				  | 2 | 4 |  |	
				  | 3 | 4 |  |
#6. Collapse source A1
		When user collapse source on node "4"			
    Then the label of all nodes is displayed as following	  
 					| B1 | RIGHT |	|
					| B2 | RIGHT |	|
					| B3 | RIGHT |	|
					| Bn | RIGHT |	|					
					| A1 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				  | 0 | 4 |  |
#6. Collapse target B1
		When user collapse target on node "0"			
    Then the label of all nodes is displayed as following
					| B1 | RIGHT |	|
					| B2 | RIGHT |	|
					| B3 | RIGHT |	|
					| Bn | RIGHT |	|	
 		Then there is no link displayed
#7. Expand target recursively of B1
		When user expands target recursively on node "0"			
    Then the label of all nodes is displayed as following
 					| B1 | RIGHT |	|
					| B2 | RIGHT |	|
					| B3 | RIGHT |	|
					| Bn | RIGHT |	|					
					| A1 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				  | 0 | 4 |  |
				  | 4 | 4 |  | 		

Scenario: Data_105 - Check expand & collapse node for a starting node when it have many outgoing node on another table by a FK
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-74"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
       |1|
    And user generates graph with configuration "Data_105"
    Then the graph should be displayed
#5. Expand target of A1
		When user expands target on node "0"	
    Then the label of all nodes is displayed as following
					| B1 |  |	|
					| C1 |  |	|					
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 0 | 0 |  |
				  | 0 | 1 |  |
				  | 0 | 2 |  |				      
#6. Collapse target A1
		When user collapse target on node "0"			
    Then the label of all nodes is displayed as following	  
					| A1 | RIGHT |	|
 		Then there is no link displayed
#7. Expand target recursively of A1
		When user expands target recursively on node "0"			
    Then the label of all nodes is displayed as following
					| B1 |  |	|
					| C1 |  |	|					
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 0 | 0 |  |
				  | 0 | 1 |  |
				  | 0 | 2 |  |	

		When user collapse target on node "0"			
    Then the label of all nodes is displayed as following	  
					| A1 | RIGHT |	|
 		Then there is no link displayed 				  

Scenario: Data_106 - Check displayed correctly relationship of nodes (that have many outgoing node on another table) when was Expanded/ Collapsed many time
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-74"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
       |1|
    And user generates graph with configuration "Data_105"
    Then the graph should be displayed
#5. Expand target of A1
		When user expands target on node "0"	
    Then the label of all nodes is displayed as following
					| B1 |  |	|
					| C1 |  |	|					
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 0 | 0 |  |
				  | 0 | 1 |  |
				  | 0 | 2 |  |				      
#6. Collapse target A1
		When user collapse target on node "0"			
    Then the label of all nodes is displayed as following	  
					| A1 | RIGHT |	|
 		Then there is no link displayed
 		
#7. Expand target of A1
		When user expands target on node "0"	
    Then the label of all nodes is displayed as following
					| B1 |  |	|
					| C1 |  |	|					
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 0 | 0 |  |
				  | 0 | 1 |  |
				  | 0 | 2 |  |				      
#8. Collapse target A1
		When user collapse target on node "0"			
    Then the label of all nodes is displayed as following	  
					| A1 | RIGHT |	|
 		Then there is no link displayed 		
#9. Expand target recursively of A1
		When user expands target recursively on node "0"			
    Then the label of all nodes is displayed as following
					| B1 |  |	|
					| C1 |  |	|					
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 0 | 0 |  |
				  | 0 | 1 |  |
				  | 0 | 2 |  |	
				  
Scenario: Data_107 - Check displayed correctly relationship of nodes (that have many outgoing node on another table) when was started by a outgoing nodes then Expand/ Collapse them many time
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-74"
    And I access table "TableC"
    And user views "Visualization>Display data using configuration" of records have ID are
       |1|
    And user generates graph with configuration "Data_105"
    Then the graph should be displayed
#5. Expand source of C1
		When user expands source on node "0"	
    Then the label of all nodes is displayed as following
					| C1 | LEFT |	|					
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 1 | 0 |  |
#6. Expand target of A1
		When user expands target on node "1"	
    Then the label of all nodes is displayed as following
					| B1 |  |	|
					| C1 | LEFT |	|					
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 1 | 1 |  |
				  | 1 | 0 |  |
				  | 1 | 2 |  |				      
#7. Collapse target A1
		When user collapse target on node "1"			
    Then the label of all nodes is displayed as following	  
					| C1 | LEFT |	|					
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 1 | 0 |  |
 		
#8. Expand target of A1
		When user expands target on node "1"	
    Then the label of all nodes is displayed as following
					| B1 |  |	|
					| C1 | LEFT |	|					
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 1 | 1 |  |
				  | 1 | 0 |  |
				  | 1 | 2 |  |				      
#9. Collapse source C1
		When user collapse source on node "0"			
    Then the label of all nodes is displayed as following	  
					| C1 | LEFT |	|
 		Then there is no link displayed 		
#9. Expand source recursively of C1
		When user expands source recursively on node "0"			
    Then the label of all nodes is displayed as following
					| C1 | LEFT |	|					
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 1 | 0 |  |				
				  
Scenario: Data_108 - Check displayed correctly relationship of nodes (that have many outgoing node on another table) when was started by two outgoing nodes then Expand/ Collapse them many time
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-77"
    And I access table "TableB"
    And user views "Visualization>Display data using configuration" of records have ID are
       |1|
       |2|
    And user generates graph with configuration "Data_108"
    Then the graph should be displayed
#5. Expand source of B1
		When user expands source on node "1"	
    Then the label of all nodes is displayed as following
					| B1 | LEFT |	|					
					| B2 | LEFT |	|	
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 2 | 1 |  |
				  
#6. Expand target of A1
		When user expands target on node "2"	
    Then the label of all nodes is displayed as following
					| B1 | LEFT |	|					
					| B2 |  |	|	
					| B3 |  |	|	
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 2 | 1 |  |	
				  | 2 | 0 |  |	
				  | 2 | 2 |  |
				  | 2 | 3 |  |	      
 		      
#7. Collapse source B1
		When user collapse source on node "1"			
    Then the label of all nodes is displayed as following	  
					| B1 | LEFT |	|					
					| B2 | LEFT |	|	
 		Then there is no link displayed 
#8. Expand source of B2
		When user expands source on node "0"	
    Then the label of all nodes is displayed as following
					| B1 | LEFT |	|					
					| B2 | LEFT |	|	
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 2 | 0 |  |
 			
#10. Expand target recursively of A1
		When user expands target recursively on node "2"			
    Then the label of all nodes is displayed as following
					| B1 |  |	|					
					| B2 | LEFT |	|	
					| B3 |  |	|	
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 2 | 1 |  |	
				  | 2 | 0 |  |	
				  | 2 | 2 |  |
				  | 2 | 3 |  |
				  
#11. Collapse source B2
		When user collapse source on node "0"			
    Then the label of all nodes is displayed as following	  
					| B1 | LEFT |	|					
					| B2 | LEFT |	|	
 		Then there is no link displayed 							  

Scenario: Data_109 - Check displayed correctly relationship of nodes (that have many outgoing node on another table) when was started by all outgoing nodes then Expand/ Collapse them many time
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-77"
    And I access table "TableB"
    And user views "Visualization>Display data using configuration" of records have ID are
       |1|
       |2|
       |3|
    And user generates graph with configuration "Data_108"
    Then the graph should be displayed
#5. Expand source of B1
		When user expands source on node "2"	
    Then the label of all nodes is displayed as following
					| B1 | LEFT |	|					
					| B2 | LEFT |	|	
					| B3 | LEFT |	|
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 3 | 2 |  |
				  
#6. Expand target of A1
		When user expands target on node "3"	
    Then the label of all nodes is displayed as following
					| B1 | LEFT |	|					
					| B2 |  |	|	
					| B3 |  |	|	
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 3 | 1 |  |	
				  | 3 | 0 |  |	
				  | 3 | 3 |  |
				  | 3 | 2 |  |	      
#7. Collapse target A1
		When user collapse target on node "3"			
    Then the label of all nodes is displayed as following	  
					| B1 | LEFT |	|					
					| B2 | LEFT |	|	
					| B3 | LEFT |	|
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 3 | 2 |  | 		      
#8. Collapse source B1
		When user collapse source on node "2"			
    Then the label of all nodes is displayed as following	  
					| B1 | LEFT |	|					
					| B2 | LEFT |	|
					| B3 | LEFT |	|		
 		Then there is no link displayed 
 			
#9. Expand source recursively of B1
		When user expands source recursively on node "2"			
    Then the label of all nodes is displayed as following
					| B1 | LEFT |	|					
					| B2 | LEFT |	|	
					| B3 | LEFT |	|
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 3 | 2 |  |
	  
Scenario: Data_110 - Check displayed correctly relationship of nodes (that have many incoming&outgoing nodes on another table) when was Expanded
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-79"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
       |1|
    And user generates graph with configuration "Data_110"
    Then the graph should be displayed

#5. Expand target of A1
		When user expands target on node "0"	
    Then the label of all nodes is displayed as following
					| B1 |  |	|					
					| C1 |  |	|	
					| A1 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				  | 0 | 1 |  |	
				  | 0 | 0 |  |	
				  | 0 | 2 |  |	      
#6. Expand source of A1
		When user expands source on node "0"	
    Then the label of all nodes is displayed as following
					| B1 |  |	|					
					| C1 |  |	|	
					| D1 |  |	|	
					| E1 |  |	|	
					| A1 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				  | 0 | 1 |  |	
				  | 0 | 0 |  |	
				  | 0 | 2 |  |
				  | 3 | 0 |  |
				  | 4 | 0 |  |	

#7. Collapse target & source A1
		When user collapse target on node "0"		
		When user collapse source on node "0"		
    Then the label of all nodes is displayed as following	  
					| A1 | LEFT,RIGHT |	
 		Then there is no link displayed 	      
#8. Expand source & target recursively of B1
		When user expands source recursively on node "0"	
		When user expands target recursively on node "0"					
    Then the label of all nodes is displayed as following
					| B1 |  |	|					
					| C1 |  |	|	
					| D1 |  |	|	
					| E1 |  |	|	
					| A1 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				  | 0 | 1 |  |	
				  | 0 | 0 |  |	
				  | 0 | 2 |  |
				  | 3 | 0 |  |
				  | 4 | 0 |  |			
				  
Scenario: Data_111 - Check displayed correctly relationship of nodes (that have many incoming&outgoing nodes on another table) when was started by a outgoing nodes then Expand/ Collapse them
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-79"
    And I access table "TableB"
    And user views "Visualization>Display data using configuration" of records have ID are
       |1|
    And user generates graph with configuration "Data_110"
    Then the graph should be displayed
#5. Expand source of B1
		When user expands source on node "0"	
    Then the label of all nodes is displayed as following
					| B1 | LEFT |	|					
					| A1 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				  | 1 | 0 |  |
#6. Expand target of A1
		When user expands target on node "1"	
    Then the label of all nodes is displayed as following
					| B1 | LEFT  |	|					
					| C1 |  |	|	
					| A1 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				  | 1 | 0 |  |	
				  | 1 | 1 |  |	
				  | 1 | 2 |  |	      
#7. Expand source of A1
		When user expands source on node "1"	
    Then the label of all nodes is displayed as following
					| B1 | LEFT |	|					
					| C1 |  |	|	
					| D1 |  |	|	
					| E1 |  |	|	
					| A1 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				  | 1 | 0 |  |	
				  | 1 | 1 |  |	
				  | 1 | 2 |  |	
				  | 3 | 1 |  |
				  | 4 | 1 |  |	

#8,9. Collapse target & source A1
		When user collapse target on node "1"	
		    Then the label of all nodes is displayed as following
					| B1 | LEFT |	|					
					| D1 |  |	|	
					| E1 |  |	|	
					| A1 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				  | 1 | 0 |  |	
				  | 3 | 1 |  |
				  | 4 | 1 |  |		
		When user collapse source on node "1"		
    Then the label of all nodes is displayed as following	  
 					| B1 | LEFT |	|	
					| A1 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				  | 1 | 0 |  |	  
#10. Expand source of A1
		When user expands source on node "1"	
    Then the label of all nodes is displayed as following
					| B1 | LEFT |	|					
					| D1 |  |	|	
					| E1 |  |	|	
					| A1 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				  | 1 | 0 |  |	
				  | 3 | 1 |  |
				  | 4 | 1 |  |	 		    
#11. Collapse source B1 then expand again
		When user collapse source on node "0"			
		When user expands source on node "0"	
    Then the label of all nodes is displayed as following
					| B1 | LEFT |	|					
					| A1 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				  | 1 | 0 |  |

#12. Collapse again and Expand source recursively of B1
		When user collapse source on node "0"	
		When user expands source recursively on node "0"	
    Then the label of all nodes is displayed as following			
					| B1 | LEFT |	|					
					| D1 |  |	|	
					| E1 |  |	|	
					| A1 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
					 | 4 | 1 |  |
					 | 3 | 1 |  |
					 | 1 | 0 |  |
			When user expands target recursively on node "1"  
	    Then the label of all nodes is displayed as following
					| B1 | LEFT |	|					
					| C1 |  |	|	
					| D1 |  |	|	
					| E1 |  |	|	
					| A1 | LEFT,RIGHT |	|
		Then the label of link label should be display as following
				  | 1 | 0 |  |	
				  | 1 | 1 |  |	
				  | 1 | 2 |  |	
				  | 3 | 1 |  |
				  | 4 | 1 |  |			  

Scenario: Data_112 - Check displayed correctly relationship of nodes (that have many incoming/outgoing nodes-n level on another table) when was started by it then Expand all levels
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_Data_112"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
       |A1|
    And user generates graph with configuration "Data_112"
    Then the graph should be displayed
#5. Expand target of A1
		When user expands target on node "0"	
    Then the label of all nodes is displayed as following
					| B1 | RIGHT  |	|					
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 0 | 1 |  |	

#6. Expand target of B1
		When user expands target on node "1"	
    Then the label of all nodes is displayed as following
					| B1 | RIGHT  |	|		
					| C1 | RIGHT  |	|				
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 0 | 1 |  |	
				  | 1 | 2 |  |
 
 #7. Expand target of C1
		When user expands target on node "2"	
    Then the label of all nodes is displayed as following
					| B1 | RIGHT  |	|		
					| C1 | RIGHT  |	|	
					| D1 | RIGHT  |	|			
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 0 | 1 |  |	
				  | 1 | 2 |  |
				  | 2 | 3 |  |
#8. Expand target of D1
		When user expands target on node "3"	
    Then the label of all nodes is displayed as following
					| B1 | RIGHT  |	|		
					| C1 | RIGHT  |	|	
					| D1 | RIGHT  |	|	
					| E1 | RIGHT  |	|		
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 0 | 1 |  |	
				  | 1 | 2 |  |
				  | 2 | 3 |  |
				  | 3 | 4 |  |
#8. Expand target of E1
		When user expands target on node "4"	
    Then the label of all nodes is displayed as following
					| B1 | RIGHT  |	|		
					| C1 | RIGHT  |	|	
					| D1 | RIGHT  |	|	
					| E1 | RIGHT  |	|		
					| F1 | RIGHT  |	|	
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 0 | 1 |  |	
				  | 1 | 2 |  |
				  | 2 | 3 |  |
				  | 3 | 4 |  |
				  | 4 | 5 |  |
#8. Expand target of F1
		When user expands target on node "5"	
    Then the label of all nodes is displayed as following
					| B1 | RIGHT  |	|		
					| C1 | RIGHT  |	|	
					| D1 | RIGHT  |	|	
					| E1 | RIGHT  |	|		
					| F1 | RIGHT  |	|
					| G1 | RIGHT  |	|
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 0 | 1 |  |	
				  | 1 | 2 |  |
				  | 2 | 3 |  |
				  | 3 | 4 |  |
				  | 4 | 5 |  |
				  | 5 | 6 |  |
#8. Expand target of G1
		When user expands target on node "6"	
    Then the label of all nodes is displayed as following
					| B1 | RIGHT  |	|		
					| C1 | RIGHT  |	|	
					| D1 | RIGHT  |	|	
					| E1 | RIGHT  |	|		
					| F1 | RIGHT  |	|
					| G1 | RIGHT  |	|
					| H1 | RIGHT  |	|
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 0 | 1 |  |	
				  | 1 | 2 |  |
				  | 2 | 3 |  |
				  | 3 | 4 |  |
				  | 4 | 5 |  |
				  | 5 | 6 |  |	
				  | 6 | 7 |  |	
 
#8. Expand target of H1
		When user expands target on node "7"	
    Then the label of all nodes is displayed as following
					| B1 | RIGHT  |	|		
					| C1 | RIGHT  |	|	
					| D1 | RIGHT  |	|	
					| E1 | RIGHT  |	|		
					| F1 | RIGHT  |	|
					| G1 | RIGHT  |	|
					| H1 | RIGHT  |	|
					| I1 | RIGHT  |	|
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 0 | 1 |  |	
				  | 1 | 2 |  |
				  | 2 | 3 |  |
				  | 3 | 4 |  |
				  | 4 | 5 |  |
				  | 5 | 6 |  |	
				  | 6 | 7 |  |	
				  | 7 | 8 |  |			

#8. Expand target of I1
		When user expands target on node "8"	
    Then the label of all nodes is displayed as following
					| B1 | RIGHT  |	|		
					| C1 | RIGHT  |	|	
					| D1 | RIGHT  |	|	
					| E1 | RIGHT  |	|		
					| F1 | RIGHT  |	|
					| G1 | RIGHT  |	|
					| H1 | RIGHT  |	|
					| I1 | RIGHT  |	|
					| J1 | RIGHT  |	|
					| A1 | RIGHT |	|
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
				  
#8. Expand target of J1
		When user expands target on node "9"	
    Then the label of all nodes is displayed as following
					| B1 | RIGHT  |	|		
					| C1 | RIGHT  |	|	
					| D1 | RIGHT  |	|	
					| E1 | RIGHT  |	|		
					| F1 | RIGHT  |	|
					| G1 | RIGHT  |	|
					| H1 | RIGHT  |	|
					| I1 | RIGHT  |	|
					| J1 | RIGHT  |	|
					| K1 |   |	|
					| A1 | RIGHT |	|
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
					  				  
#9. Collapse target A1
		When user collapse target on node "0"	
    Then the label of all nodes is displayed as following
					| A1 | RIGHT |	|
 		Then there is no link displayed   
#10. Expand target of A1
		When user expands target on node "0"	
    Then the label of all nodes is displayed as following
					| B1 | RIGHT  |	|					
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 0 | 1 |  |	

#11. Expand target recursively of B1, G1
		When user expands target recursively on node "1"	
    Then the label of all nodes is displayed as following			
					| B1 | RIGHT  |	|		
					| C1 | RIGHT  |	|	
					| D1 | RIGHT  |	|	
					| E1 | RIGHT  |	|		
					| F1 | RIGHT  |	|
					| G1 | RIGHT  |	|
					| A1 | RIGHT |	|					
		Then the label of link label should be display as following
				  | 0 | 1 |  |	
				  | 1 | 2 |  |
				  | 2 | 3 |  |
				  | 3 | 4 |  |
				  | 4 | 5 |  |
				  | 5 | 6 |  |	
		When user expands target recursively on node "6"
    Then the label of all nodes is displayed as following			
					| B1 | RIGHT  |	|		
					| C1 | RIGHT  |	|	
					| D1 | RIGHT  |	|	
					| E1 | RIGHT  |	|		
					| F1 | RIGHT  |	|
					| G1 | RIGHT  |	|
					| H1 | RIGHT  |	|
					| I1 | RIGHT  |	|
					| J1 | RIGHT  |	|
					| K1 |   |	|
					| A1 | RIGHT |	|
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
				  
Scenario: Data_113 - Check displayed correctly relationship of nodes (that have many incoming/outgoing nodes-n level on another table) when was started by it then Expand all levels and Collapse by any node.
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_Data_112"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
       |A1|
    And user generates graph with configuration "Data_112"
    Then the graph should be displayed
#5. Expand target of A1
		When user expands target on node "0"	
#6. Expand target of B1
		When user expands target on node "1"	
 #7. Expand target of C1
		When user expands target on node "2"	
#8. Expand target of D1
		When user expands target on node "3"	
#8. Expand target of E1
		When user expands target on node "4"	
#8. Expand target of F1
		When user expands target on node "5"	
#8. Expand target of G1
		When user expands target on node "6"	
#8. Expand target of H1
		When user expands target on node "7"	
#8. Expand target of I1
		When user expands target on node "8"	
#8. Expand target of J1
		When user expands target on node "9"	
    Then the label of all nodes is displayed as following
					| B1 | RIGHT  |	|		
					| C1 | RIGHT  |	|	
					| D1 | RIGHT  |	|	
					| E1 | RIGHT  |	|		
					| F1 | RIGHT  |	|
					| G1 | RIGHT  |	|
					| H1 | RIGHT  |	|
					| I1 | RIGHT  |	|
					| J1 | RIGHT  |	|
					| K1 |   |	|
					| A1 | RIGHT |	|
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
#9. Collapse target H1
		When user collapse target on node "7"	
    Then the label of all nodes is displayed as following
					| B1 | RIGHT  |	|		
					| C1 | RIGHT  |	|	
					| D1 | RIGHT  |	|	
					| E1 | RIGHT  |	|		
					| F1 | RIGHT  |	|
					| G1 | RIGHT  |	|
					| H1 | RIGHT  |	|
					| A1 | RIGHT |	|
		Then the label of link label should be display as following
				  | 0 | 1 |  |	
				  | 1 | 2 |  |
				  | 2 | 3 |  |
				  | 3 | 4 |  |
				  | 4 | 5 |  |
				  | 5 | 6 |  |	
				  | 6 | 7 |  |
#10. Collapse target A1
		When user collapse target on node "0"	
    Then the label of all nodes is displayed as following
					| A1 | RIGHT |	|
 		Then there is no link displayed   
#11. Expand target recursively of A1, F1
		When user expands target recursively on node "0"	
    Then the label of all nodes is displayed as following			
					| B1 | RIGHT  |	|		
					| C1 | RIGHT  |	|	
					| D1 | RIGHT  |	|	
					| E1 | RIGHT  |	|		
					| F1 | RIGHT  |	|
					| A1 | RIGHT |	|					
		Then the label of link label should be display as following
				  | 0 | 1 |  |	
				  | 1 | 2 |  |
				  | 2 | 3 |  |
				  | 3 | 4 |  |
				  | 4 | 5 |  |
		When user expands target recursively on node "5"
    Then the label of all nodes is displayed as following			
					| B1 | RIGHT  |	|		
					| C1 | RIGHT  |	|	
					| D1 | RIGHT  |	|	
					| E1 | RIGHT  |	|		
					| F1 | RIGHT  |	|
					| G1 | RIGHT  |	|
					| H1 | RIGHT  |	|
					| I1 | RIGHT  |	|
					| J1 | RIGHT  |	|
					| K1 |   |	|
					| A1 | RIGHT |	|
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
				  
Scenario: Data_114 - Check displayed correctly relationship of nodes (that have many incoming/outgoing nodes-n level on another table) when was started by a outgoing node then Expand/Collapse them 
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_Data_112"
    And I access table "TableB"
    And user views "Visualization>Display data using configuration" of records have ID are
       |B1|
    And user generates graph with configuration "Data_112"
    Then the graph should be displayed
#5. Expand target of B1
		When user expands target on node "0"	
    Then the label of all nodes is displayed as following
					| B1 | LEFT,RIGHT  |	|		
					| C1 | RIGHT  |	|	
		Then the label of link label should be display as following
				  | 0 | 1 |  |	
 #7. Expand target of C1
		When user expands target on node "1"	
    Then the label of all nodes is displayed as following
					| B1 | LEFT,RIGHT  |	|		
					| C1 | RIGHT  |	|	
					| D1 | RIGHT  |	|	
		Then the label of link label should be display as following
				  | 0 | 1 |  |	
				  | 1 | 2 |  |		
#8. Expand source of B1
		When user expands source on node "0"	
    Then the label of all nodes is displayed as following
					| B1 | LEFT,RIGHT  |	|		
					| C1 | RIGHT  |	|	
					| D1 | RIGHT  |	|	
					| A1 |   |	|	
		Then the label of link label should be display as following
				  | 0 | 1 |  |	
				  | 1 | 2 |  |	
				  | 3 | 0 |  |
#9. Collapse target B1
		When user collapse target on node "0"	
    Then the label of all nodes is displayed as following
					| B1 | LEFT,RIGHT  |	|	
					| A1 |   |	|	
		Then the label of link label should be display as following
				  | 3 | 0 |  |   
#5. Expand target of B1
		When user expands target on node "0"	
    Then the label of all nodes is displayed as following
					| B1 | LEFT,RIGHT  |	|		
					| C1 | RIGHT  |	|	
					| A1 |   |	|	
		Then the label of link label should be display as following
				  | 0 | 1 |  |	
				  | 3 | 0 |  |
#11. Expand target recursively of C1
		When user expands target recursively on node "1"	
    Then the label of all nodes is displayed as following			
					| B1 | LEFT,RIGHT  |	|		
					| C1 | RIGHT  |	|	
					| D1 | RIGHT  |	|	
					| E1 | RIGHT  |	|		
					| F1 | RIGHT  |	|
					| G1 | RIGHT  |	|
					| H1 | RIGHT  |	|
					| A1 |  |	|					
		Then the label of link label should be display as following
					 | 3 | 0 |  |
					 | 0 | 1 |  |
					 | 1 | 2 |  |
					 | 5 | 6 |  |
					 | 6 | 7 |  |
					 | 4 | 5 |  |
					 | 2 | 4 |  |		
					 
Scenario: Data_115 - Check displayed correctly relationship of nodes (that have many incoming/outgoing nodes-n level on another table) when was started by node at last level then Expand all levels and Collapse by start node.
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_Data_112"
    And I access table "TableK"
    And user views "Visualization>Display data using configuration" of records have ID are
       |K1|
    And user generates graph with configuration "Data_112"
    Then the graph should be displayed
#5. Expand source of K1
		When user expands source on node "0"	
    Then the label of all nodes is displayed as following
					| J1 | LEFT  |	|					
					| K1 | LEFT |	|
		Then the label of link label should be display as following
				  | 1 | 0 |  |	

#6. Expand source of J1
		When user expands source on node "1"	
    Then the label of all nodes is displayed as following
					| I1 | LEFT  |	|		
					| J1 | LEFT  |	|				
					| K1 | LEFT |	|
		Then the label of link label should be display as following
				  | 1 | 0 |  |
				  | 2 | 1 |  |
 
 #7. Expand source of I1
		When user expands source on node "2"	
    Then the label of all nodes is displayed as following
          | H1 | LEFT  |	|	
					| I1 | LEFT  |	|		
					| J1 | LEFT  |	|				
					| K1 | LEFT |	|
		Then the label of link label should be display as following
				  | 1 | 0 |  |
				  | 2 | 1 |  |
				  | 3 | 2 |  |
#8. Expand source of H1
		When user expands source on node "3"	
    Then the label of all nodes is displayed as following
					| G1 | LEFT  |	|		
          | H1 | LEFT  |	|	
					| I1 | LEFT  |	|		
					| J1 | LEFT  |	|				
					| K1 | LEFT |	|
		Then the label of link label should be display as following
				  | 1 | 0 |  |
				  | 2 | 1 |  |
				  | 3 | 2 |  |
				  | 4 | 3 |  |
#8. Expand source of G1
		When user expands source on node "4"	
    Then the label of all nodes is displayed as following
					| F1 | LEFT  |	|		
					| G1 | LEFT  |	|		
          | H1 | LEFT  |	|	
					| I1 | LEFT  |	|		
					| J1 | LEFT  |	|				
					| K1 | LEFT |	|
		Then the label of link label should be display as following
				  | 1 | 0 |  |
				  | 2 | 1 |  |
				  | 3 | 2 |  |
				  | 4 | 3 |  |
				  | 5 | 4 |  |
#8. Expand source of F1
		When user expands source on node "5"	
    Then the label of all nodes is displayed as following
					| E1 | LEFT  |	|		
					| F1 | LEFT  |	|		
					| G1 | LEFT  |	|		
          | H1 | LEFT  |	|	
					| I1 | LEFT  |	|		
					| J1 | LEFT  |	|				
					| K1 | LEFT |	|
		Then the label of link label should be display as following
				  | 1 | 0 |  |
				  | 2 | 1 |  |
				  | 3 | 2 |  |
				  | 4 | 3 |  |
				  | 5 | 4 |  |
				  | 6 | 5 |  |
#8. Expand source of E1
		When user expands source on node "6"	
    Then the label of all nodes is displayed as following
					| D1 | LEFT  |	|		
					| E1 | LEFT  |	|		
					| F1 | LEFT  |	|		
					| G1 | LEFT  |	|		
          | H1 | LEFT  |	|	
					| I1 | LEFT  |	|		
					| J1 | LEFT  |	|				
					| K1 | LEFT |	|
		Then the label of link label should be display as following
				  | 1 | 0 |  |
				  | 2 | 1 |  |
				  | 3 | 2 |  |
				  | 4 | 3 |  |
				  | 5 | 4 |  |
				  | 6 | 5 |  |
				  | 7 | 6 |  |	
 
#8. Expand source of D1
		When user expands source on node "7"	
    Then the label of all nodes is displayed as following
					| C1 | LEFT  |	|		
					| D1 | LEFT  |	|		
					| E1 | LEFT  |	|		
					| F1 | LEFT  |	|		
					| G1 | LEFT  |	|		
          | H1 | LEFT  |	|	
					| I1 | LEFT  |	|		
					| J1 | LEFT  |	|				
					| K1 | LEFT |	|
		Then the label of link label should be display as following
				  | 1 | 0 |  |
				  | 2 | 1 |  |
				  | 3 | 2 |  |
				  | 4 | 3 |  |
				  | 5 | 4 |  |
				  | 6 | 5 |  |
				  | 7 | 6 |  |	
				  | 8 | 7 |  |			

#8. Expand source of C1
		When user expands source on node "8"	
    Then the label of all nodes is displayed as following
					| B1 | LEFT  |	|		
					| C1 | LEFT  |	|		
					| D1 | LEFT  |	|		
					| E1 | LEFT  |	|		
					| F1 | LEFT  |	|		
					| G1 | LEFT  |	|		
          | H1 | LEFT  |	|	
					| I1 | LEFT  |	|		
					| J1 | LEFT  |	|				
					| K1 | LEFT |	|
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
				  
#8. Expand source of B1
		When user expands source on node "9"	
    Then the label of all nodes is displayed as following
					| A1 |  |	|		
					| B1 | LEFT  |	|		
					| C1 | LEFT  |	|		
					| D1 | LEFT  |	|		
					| E1 | LEFT  |	|		
					| F1 | LEFT  |	|		
					| G1 | LEFT  |	|		
          | H1 | LEFT  |	|	
					| I1 | LEFT  |	|		
					| J1 | LEFT  |	|				
					| K1 | LEFT |	|
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
					  				  
#9. Collapse source K1
		When user collapse source on node "0"	
    Then the label of all nodes is displayed as following
					| K1 | LEFT |	|
 		Then there is no link displayed   
#10. Expand source of K1
		When user expands source on node "0"	
    Then the label of all nodes is displayed as following
					| J1 | LEFT  |	|					
					| K1 | LEFT |	|
		Then the label of link label should be display as following
				  | 1 | 0 |  |	

#11. Expand source recursively of J1, G1
		When user expands source recursively on node "1"	
    Then the label of all nodes is displayed as following			
					| E1 | LEFT  |	|		
					| F1 | LEFT  |	|		
					| G1 | LEFT  |	|		
          | H1 | LEFT  |	|	
					| I1 | LEFT  |	|		
					| J1 | LEFT  |	|				
					| K1 | LEFT |	|
		Then the label of link label should be display as following
				  | 1 | 0 |  |
				  | 2 | 1 |  |
				  | 3 | 2 |  |
				  | 4 | 3 |  |
				  | 5 | 4 |  |
				  | 6 | 5 |  |
			When user expands source recursively on node "6"
    Then the label of all nodes is displayed as following			
					| A1 |  |	|		
					| B1 | LEFT  |	|		
					| C1 | LEFT  |	|		
					| D1 | LEFT  |	|		
					| E1 | LEFT  |	|		
					| F1 | LEFT  |	|		
					| G1 | LEFT  |	|		
          | H1 | LEFT  |	|	
					| I1 | LEFT  |	|		
					| J1 | LEFT  |	|				
					| K1 | LEFT |	|
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