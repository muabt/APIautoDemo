@DMDV120
Feature: US07-Provide service for incremental tree

  Background: 
    Given I login to EBX succesfully

@US07-43to50
	Scenario: US07-43 - Check displayed correctly the links and render nodes (it has a recursive node(n level) on same table by a FK) when starting by owner node
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_43"
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
      |2	| A3 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 2 |	0 |
      
    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 2 |	0 |
      | 1 |	2 |

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
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 2 |	0 |
      | 1 |	2 |
      
	Scenario: US07-44 - Check displayed correctly the links and render nodes (it has a recursive node(n level) on same table by a FK) when starting by owner&outgoing nodes
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_43"
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
      |0	| A2 |	PLUS_SIGN	|
      |2	| A3 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |
      | 2 |	1 |
      
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |	MINUS_SIGN	|
      |1	| A1 |	MINUS_SIGN	|
      |2	| A3 |		|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |
      | 2 |	1 |
      | 0 |	2 |

    When user collapses on node "1"       
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |	PLUS_SIGN	|
      |1	| A1 |	PLUS_SIGN	|

    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |	MINUS_SIGN	|
      |1	| A1 |	PLUS_SIGN	|
      |2	| A3 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |
      | 0 |	2 |
      
    When user expands on node "2"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |	MINUS_SIGN	|
      |1	| A1 |		|
      |2	| A3 |	MINUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |
      | 2 |	1 |
      | 0 |	2 |      
      

 Scenario: US07-45 - Check displayed correctly the links and render nodes (it has a recursive node(n level) on same table by a FK) when starting by owner& incoming nodes 
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_43"
    And user views "Visualization>Display selected data" of records have ID are
    	| 1|
    	| 3|
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
      |1	| A3 |	PLUS_SIGN	|
 
    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
      |1	| A3 |	MINUS_SIGN	|
      |2	| A2 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |
      | 2 |	1 |
      
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A3 |	MINUS_SIGN	|
      |2	| A2 |		|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |
      | 2 |	1 |
      | 0 |	2 |

    When user collapses on node "1"       
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
      |1	| A3 |	PLUS_SIGN	|      

	Scenario: US07-46 - Check displayed correctly the links and render nodes (it has a recursive node(n level) on same table by a FK) when starting by outgoing& incoming nodes 
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_43"
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
      |0	| A2 |	PLUS_SIGN	|
      |1	| A3 |	MINUS_SIGN	|
      |2	| A1 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 1 |	2 |
      
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |	MINUS_SIGN	|
      |1	| A3 |	MINUS_SIGN	|
      |2	| A1 |		|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 1 |	2 |
      | 2 |	0 |

    When user collapses on node "0"       
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |	PLUS_SIGN	|
      |1	| A3 |	MINUS_SIGN	|
      |2	| A1 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 1 |	2 |

    When user collapses on node "1"       
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |	PLUS_SIGN	|
      |1	| A3 |	PLUS_SIGN	|
      
    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |	PLUS_SIGN	|
      |1	| A3 |	MINUS_SIGN	|
      |2	| A1 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 1 |	2 |     
      

	Scenario: US07-47 - Check displayed correctly the links and render nodes (it has a recursive node(n level) on same table by a FK) when starting by all nodes 
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_43"
    And user views "Visualization>Display selected data" of records have ID are
      | 1|
    	| 2|
    	| 3|
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |	PLUS_SIGN	|
      |1	| A1 |	PLUS_SIGN	|
      |2	| A3 |	PLUS_SIGN	|
 
    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |1	| A1 |	MINUS_SIGN	|
      |0	| A2 |	PLUS_SIGN	|
      |2	| A3 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |
      | 2 |	1 |
      
    When user expands on node "2"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |		|
      |1	| A1 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |
      | 2 |	1 |
      | 0 |	2 |

    When user collapses on node "1"       
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A2 |	PLUS_SIGN	|
      |1	| A1 |	PLUS_SIGN	|
      |2	| A3 |	PLUS_SIGN	|      

@haverecursivesnode(nlevel)
Scenario: US07-48 - Check displayed correctly the links and render nodes (it have recursives node(n level) on same table by a FK) 
                    when starting by owner nodes and expand&collapse render nodes after that 
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_48"
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
      |1	| A3 |	PLUS_SIGN	|
      |2	| A2 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |
      | 0 |	1 |
      | 0 |	2 |
      
    When user expands on node "2"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A3 |		|
      |2	| A2 |	MINUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |
      | 0 |	1 |
      | 0 |	2 |
      | 2 | 1 |

    When user collapses on node "2"       
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A3 |	PLUS_SIGN	|
      |2	| A2 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |
      | 0 |	1 |
      | 0 |	2 |

    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A3 |	MINUS_SIGN	|
      |2	| A2 |		|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |
      | 0 |	1 |
      | 0 |	2 |
      | 2 | 1 |

	Scenario: US07-49 - Check displayed correctly the links and render nodes (it have recursives node(n level) on same table by a FK) 
                    when starting by owner nodes and expand&collapse them after that 
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_48"
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
      |1	| A3 |	PLUS_SIGN	|
      |2	| A2 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |
      | 0 |	1 |
      | 0 |	2 |
      
    When user expands on node "2"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A3 |		|
      |2	| A2 |	MINUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |
      | 0 |	1 |
      | 0 |	2 |
      | 2 | 1 |

    When user collapses on node "0"       
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|

    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|
      |1	| A3 |		|
      |2	| A2 |	MINUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |
      | 0 |	1 |
      | 0 |	2 |
      | 2 | 1 |
                 
 	Scenario: US07-50 - Check displayed correctly the links and render nodes (it have recursives node(n level) on same table by a FK) when starting by all nodes 
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_48"
    And user views "Visualization>Display selected data" of records have ID are
      | 1|
      | 2|
      | 3|
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
      |1	| A3 |	PLUS_SIGN	|
      |2	| A2 |	PLUS_SIGN	|
      
    When user expands on node "2"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
      |1	| A3 |	PLUS_SIGN	|
      |2	| A2 |	MINUS_SIGN|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 2 |	1 |
      | 0 |	2 |
      
    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |		|
      |1	| A3 |	MINUS_SIGN	|
      |2	| A2 |	MINUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |
      | 0 |	1 |
      | 0 |	2 |
      | 2 | 1 |

    When user collapses on node "2"       
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|
      |1	| A3 |	PLUS_SIGN	|
      |2	| A2 |	PLUS_SIGN	|   
    Then the graph should not contains any link
           