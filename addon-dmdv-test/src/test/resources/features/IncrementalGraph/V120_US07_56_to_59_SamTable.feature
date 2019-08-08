@DMDV120
Feature: US07-Provide service for incremental tree

  Background: 
    Given I login to EBX succesfully

@US07-56to59    
 	Scenario: US07-56 - (Special case 03) Check displayed correctly state of the links and render nodes (it have same outgoing and incoming nodes(n level) on same table) 
	                    when starting by incoming node and expand&collapse them and render nodes after that
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_56"
    And user views "Visualization>Display selected data" of records have ID are
      | 1|
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
      
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN|
      |2	| A2 |	PLUS_SIGN	|
      |1	| A3 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
     
    When user expands on node "2"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |2	| A2 |	MINUS_SIGN	|
      |1	| A3 |	PLUS_SIGN	|
      |3	| A4 |	PLUS_SIGN	|
      |4	| A5 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 2 |	1 |
      | 2 |	3 |
      | 2 |	4 |

    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |2	| A2 |	MINUS_SIGN	|
      |1	| A3 |	MINUS_SIGN	|
      |3	| A4 |	PLUS_SIGN	|
      |4	| A5 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 2 |	1 |
      | 2 |	3 |
      | 2 |	4 |
      | 1 | 4 |
      
    When user collapses on node "2"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |2	| A2 |	PLUS_SIGN	|
      |1	| A3 |	PLUS_SIGN	|
      |4	| A5 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 1 | 4 |
 
     
	Scenario: US07-57 - Check displayed correctly state of the links and render nodes (it have same outgoing and incoming nodes(n level) on same table) 
	                    when starting by incoming node and changed owner node after that to expand/collapse
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_56"
    And user views "Visualization>Display selected data" of records have ID are
      | 1|
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
      
    When user expands on node "0"
    When user expands on node "2"
    When user expands on node "1"
    When user collapses on node "2"
    When user expands on node "4"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |2	| A2 |	PLUS_SIGN	|
      |1	| A3 |	PLUS_SIGN	|
      |3	| A4 |	PLUS_SIGN	|
      |4	| A5 |	MINUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 2 |	4 |
      | 1 | 4 |  
      | 3 | 4 |    

    When user expands on node "2"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |2	| A2 |	MINUS_SIGN	|
      |1	| A3 |	MINUS_SIGN	|
      |3	| A4 |		|
      |4	| A5 |	MINUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 2 |	1 |
      | 2 |	3 |
      | 2 |	4 |
      | 1 | 4 | 
      | 3 | 4 |      
      
    When user collapses on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	| 
      
  Scenario: US07-58 - (Special case 06) Check Keep correctly state of the links and render nodes (it have same outgoing and incoming nodes(n level) on same table) 
                      when starting by incoming node and expand&collapse them and render nodes after that
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_58"
    And user views "Visualization>Display selected data" of records have ID are
      | 1|
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
      
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN|
      |1	| A2 |	PLUS_SIGN	|
      |2	| A3 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
     
    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	PLUS_SIGN	|
      |3	| A4 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 1 |	2 |
      | 1 |	3 |

    When user expands on node "3"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |		|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |		|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 1 |	2 |
      | 1 |	3 |
      | 3 |	4 |
      | 2 | 3 |
      
    When user collapses on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	PLUS_SIGN	|
      |2	| A3 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |

    When user expands on node "2"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	PLUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	PLUS_SIGN	|
      |4	| A5 |		|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 1 |	2 |
      | 3 |	4 |
      | 2 | 3 |       
      
 	  Scenario: US07-59 - (Special case 07) Check Keep correctly state of the links and render nodes (it have same outgoing and incoming nodes(n level) on same table) 
	                    when starting by incoming node and expand&collapse them and render nodes after that
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_58"
    And user views "Visualization>Display selected data" of records have ID are
      | 1|
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
      
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN|
      |1	| A2 |	PLUS_SIGN	|
      |2	| A3 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
     
    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	PLUS_SIGN	|
      |3	| A4 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 1 |	2 |
      | 1 |	3 |

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
      | 0 |	2 |
      | 1 |	2 |
      | 1 |	3 |
      | 2 | 3 |

    When user expands on node "3"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |		|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 1 |	2 |
      | 1 |	3 |
      | 3 |	4 |
      | 2 | 3 |
      
    When user collapses on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	PLUS_SIGN	|
      |2	| A3 |	PLUS_SIGN	|
      |3	| A4 |	PLUS_SIGN	|
      |4	| A5 |		|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 3 |	4 |
      | 2 | 3 |
      
    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A4 |	MINUS_SIGN	|
      |4	| A5 |		|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 1 |	2 |
      | 1 |	3 |
      | 3 |	4 |
      | 2 | 3 |          
                   