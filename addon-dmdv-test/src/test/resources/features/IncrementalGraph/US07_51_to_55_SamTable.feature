@DMDV120
Feature: US07-Provide service for incremental tree

  Background: 
    Given I login to EBX succesfully
    
 
 @US07-51to55    
	Scenario: US07-51 - Check keep correctly state of the links and render nodes (it have recursives and outgoing and incoming nodes(n level) on same table) 
	                    when starting by recursive nodes and expand&collapse them after that
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_51"
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
      | 1 |	0 |
      
    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |		|
      |3	| A4 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 1 |	0 |
      | 1 |	3 |
      | 2 | 1 |

    When user collapses on node "0"       
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
    
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |		|
      |3	| A4 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 1 |	0 |
      | 1 |	3 |
      | 2 | 1 |  


	Scenario: US07-52 - Check keep correctly state of the links and render nodes (it have recursives and outgoing and incoming nodes(n level) on same table) 
	                    when starting by recursive nodes and expand&collapse render node after that
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_51"
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
      | 1 |	0 |
      
    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |		|
      |3	| A4 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 1 |	0 |
      | 1 |	3 |
      | 2 | 1 |

    When user collapses on node "1"       
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 1 |	0 |

    When user collapses on node "0"   
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
      | 1 |	0 |      
 
	Scenario: US07-53 - Check displayed correctly state of the links and render nodes (it have recursives and outgoing and incoming nodes(n level) on same table) 
	                    when starting by owner nodes and expand&collapse them after that
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_51"
    And user views "Visualization>Display selected data" of records have ID are
      | 2|
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |	PLUS_SIGN	|
      
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |	MINUS_SIGN	|
      |1	| A1 |		|
      |2	| A3 |		|
      |3	| A4 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 1 |	0 |
      | 0 |	3 |
      | 2 | 0 |
      
    When user expands on node "3"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |	MINUS_SIGN	|
      |1	| A1 |		|
      |2	| A3 |		|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 1 |	0 |
      | 0 |	3 |
      | 2 | 0 |
      | 3 | 4 |      
      
 	Scenario: US07-54 - Check keep correctly state of the links and render nodes (it have recursives and outgoing and incoming nodes(n level) on same table) 
	                    when starting by owner and recursive nodes and expand&collapse them after that
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_51"
    And user views "Visualization>Display selected data" of records have ID are
      | 2|
      | 1|
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
      |1	| A2 |	PLUS_SIGN	|
      
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 1 |	0 |
     
    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |		|
      |3	| A4 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 1 |	0 |
      | 1 |	3 |
      | 2 | 1 |

    When user collapses on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
      |1	| A2 |	PLUS_SIGN	|     
      
Scenario: US07-55 - Check displayed correctly state of the links and render nodes (it have recursives and outgoing and incoming nodes(n level) on same table) 
	                    when starting by incoming and recursive nodes and expand&collapse them after that
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_51"
    And user views "Visualization>Display selected data" of records have ID are
      | 3|
      | 1|
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
      |1	| A3 |	PLUS_SIGN	|
      
    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
      |2	| A2 |	PLUS_SIGN	|
      |1	| A3 |	MINUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	2 |
     
    When user expands on node "2"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |		|
      |2	| A2 |	MINUS_SIGN	|
      |1	| A3 |	MINUS_SIGN	|
      |3	| A4 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	2 |
      | 2 |	0 |
      | 2 |	3 |
      | 1 | 2 |

    When user collapses on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
      |1	| A3 |	PLUS_SIGN	|      
      