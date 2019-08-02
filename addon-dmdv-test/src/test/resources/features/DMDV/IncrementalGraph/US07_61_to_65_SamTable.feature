@DMDV120
Feature: US07-Provide service for incremental tree

  Background: 
    Given I login to EBX succesfully
    
@US07-61to65 
	  Scenario: US07-61 - Check Keep correctly state of the links and render nodes (it have same outgoing and incoming nodes(n level) on same table) 
	                    when starting by incoming node and expand&collapse them and render nodes after that
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_61"
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
      |3	| A6 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 0 |	3 |
      
    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN|
      |1	| A2 |	MINUS_SIGN|
      |2	| A3 |	PLUS_SIGN	|
      |3	| A6 |	PLUS_SIGN	|
      |4	| A4 |	PLUS_SIGN	|
      |5	| A5 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 0 |	3 |
      | 1 |	4 |
      | 1 |	5 |
      | 1 |	3 |
      | 2 |	1 |

    When user expands on node "2"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A6 |	PLUS_SIGN	|
      |4	| A4 |	PLUS_SIGN	|
      |5	| A5 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 0 |	3 |
      | 1 |	4 |
      | 1 |	5 |
      | 1 |	3 |
      | 2 |	1 |
      | 2 | 3 |

    When user expands on node "4"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A6 |	PLUS_SIGN	|
      |4	| A4 |	MINUS_SIGN	|
      |5	| A5 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 0 |	3 |
      | 1 |	4 |
      | 1 |	5 |
      | 1 |	3 |
      | 2 |	1 |
      | 2 | 3 |
      | 4 | 5 |
      | 3 | 4 |

    When user expands on node "5"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A6 |		|
      |4	| A4 |	MINUS_SIGN	|
      |5	| A5 |	MINUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 0 |	3 |
      | 1 |	4 |
      | 1 |	5 |
      | 1 |	3 |
      | 2 |	1 |
      | 2 | 3 |
      | 4 | 5 |
      | 3 | 4 |  
      | 3 | 5 |    
      
    When user collapses on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|

      
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN|
      |1	| A2 |	MINUS_SIGN	|
      |2	| A3 |	MINUS_SIGN	|
      |3	| A6 |		|
      |4	| A4 |	MINUS_SIGN	|
      |5	| A5 |	MINUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 0 |	3 |
      | 1 |	4 |
      | 1 |	5 |
      | 1 |	3 |
      | 2 |	1 |
      | 2 | 3 |
      | 4 | 5 |
      | 3 | 4 |  
      | 3 | 5 |   
      
    When user collapses on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN	|  
      |1	| A2 |	PLUS_SIGN	|
      |2	| A3 |	PLUS_SIGN	|
      |3	| A6 |	PLUS_SIGN	|  
      
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 0 |	3 |
      | 2 | 3 |   
      
    When user expands on node "3"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN|
      |1	| A2 |	PLUS_SIGN	|
      |2	| A3 |	PLUS_SIGN	|
      |3	| A6 |	MINUS_SIGN	|
      |4	| A4 |	PLUS_SIGN	|
      |5	| A5 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 0 |	3 |
      | 2 | 3 |
      | 4 | 5 |
      | 3 | 4 |  
      | 3 | 5 |   
      | 1 | 3 |
    When user collapses on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|  

	  Scenario: US07-62 - Check Keep correctly state of the links and render nodes (it have same outgoing and incoming nodes(n level) on same table by FKs) 
	                    when starting by incoming node and expand&collapse them and render nodes after that
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_62"
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
      |1	| A3 |	PLUS_SIGN	|
      |2	| A2 |	PLUS_SIGN	|
      |3	| A6 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 0 |	3 |
      | 0 |	1 |
      | 0 |	2 |
      | 0 |	3 |
      
    When user expands on node "2"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN|
      |1	| A3 |	PLUS_SIGN|
      |2	| A2 |	MINUS_SIGN|
      |3	| A6 |	PLUS_SIGN	|
      |4	| A5 |	PLUS_SIGN	|
      |5	| A4 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 0 |	3 |
      | 0 |	1 |
      | 0 |	2 |
      | 0 |	3 |
      | 2 |	4 |
      | 2 |	5 |
      | 2 |	3 |
      | 1 |	2 |
      | 2 |	4 |
      | 2 |	5 |
      | 2 |	3 |
      | 1 |	2 |      

    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN|
      |1	| A3 |	MINUS_SIGN	|
      |2	| A2 |	MINUS_SIGN	|
      |3	| A6 |	PLUS_SIGN	|
      |4	| A5 |	PLUS_SIGN	|
      |5	| A4 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 0 |	3 |
      | 0 |	1 |
      | 0 |	2 |
      | 0 |	3 |
      | 2 |	4 |
      | 2 |	5 |
      | 2 |	3 |
      | 1 |	2 |
      | 2 |	4 |
      | 2 |	5 |
      | 2 |	3 |
      | 1 |	2 | 
      | 1 | 3 |
      | 1 | 3 |

    When user expands on node "5"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN|
      |1	| A3 |	MINUS_SIGN	|
      |2	| A2 |	MINUS_SIGN	|
      |3	| A6 |	PLUS_SIGN	|
      |4	| A5 |	PLUS_SIGN	|
      |5	| A4 |	MINUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 0 |	3 |
      | 0 |	1 |
      | 0 |	2 |
      | 0 |	3 |
      | 2 |	4 |
      | 2 |	5 |
      | 2 |	3 |
      | 1 |	2 |
      | 2 |	4 |
      | 2 |	5 |
      | 2 |	3 |
      | 1 |	2 | 
      | 1 | 3 |
      | 1 | 3 |
      | 3 | 5 |
      | 3 | 5 |
      | 5 | 4 |
      | 5 | 4 |

    When user expands on node "4"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN|
      |1	| A3 |	MINUS_SIGN	|
      |2	| A2 |	MINUS_SIGN	|
      |3	| A6 |		|
      |4	| A5 |	MINUS_SIGN	|
      |5	| A4 |	MINUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 0 |	3 |
      | 0 |	1 |
      | 0 |	2 |
      | 0 |	3 |
      | 2 |	4 |
      | 2 |	5 |
      | 2 |	3 |
      | 1 |	2 |
      | 2 |	4 |
      | 2 |	5 |
      | 2 |	3 |
      | 1 |	2 | 
      | 1 | 3 |
      | 1 | 3 |
      | 3 | 5 |
      | 3 | 5 |
      | 5 | 4 |
      | 5 | 4 |  
      | 3 | 4 |
      | 3 | 4 |    
      
    When user collapses on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|

      
    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN|
      |1	| A3 |	MINUS_SIGN	|
      |2	| A2 |	MINUS_SIGN	|
      |3	| A6 |		|
      |4	| A5 |	MINUS_SIGN	|
      |5	| A4 |	MINUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 0 |	3 |
      | 0 |	1 |
      | 0 |	2 |
      | 0 |	3 |
      | 2 |	4 |
      | 2 |	5 |
      | 2 |	3 |
      | 1 |	2 |
      | 2 |	4 |
      | 2 |	5 |
      | 2 |	3 |
      | 1 |	2 | 
      | 1 | 3 |
      | 1 | 3 |
      | 3 | 5 |
      | 3 | 5 |
      | 5 | 4 |
      | 5 | 4 |  
      | 3 | 4 |
      | 3 | 4 |   
      
    When user collapses on node "5"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN|
      |1	| A3 |	MINUS_SIGN	|
      |2	| A2 |	MINUS_SIGN	|
      |3	| A6 |	PLUS_SIGN	|
      |4	| A5 |	PLUS_SIGN	|
      |5	| A4 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 0 |	1 |
      | 0 |	2 |
      | 0 |	3 |
      | 0 |	1 |
      | 0 |	2 |
      | 0 |	3 |
      | 2 |	4 |
      | 2 |	5 |
      | 2 |	3 |
      | 1 |	2 |
      | 2 |	4 |
      | 2 |	5 |
      | 2 |	3 |
      | 1 |	2 | 
      | 1 | 3 |
      | 1 | 3 |
      | 3 | 4 |
      | 3 | 4 |    

    @haveRecursiveAndIncomingnodes
 Scenario: US07-64 - Check Keep correctly state of the links and render nodes (it have recursive and incoming nodes on same table) 
	                    when starting by it and expand&collapse them and render nodes after that
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_64"
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
      |1	| A3 |	PLUS_SIGN	|
      |2	| A2 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |
      | 2 |	0 |
      | 0 |	0 |
      | 0 |	1 |
      | 0 |	2 |      
    When user expands on node "2"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN|
      |1	| A3 |	PLUS_SIGN|
      |2	| A2 |	MINUS_SIGN|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |
      | 2 |	0 |
      | 0 |	0 |
      | 0 |	1 |
      | 0 |	2 |
      | 2 |	2 |

    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN|
      |1	| A3 |	MINUS_SIGN	|
      |2	| A2 |	MINUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |
      | 2 |	0 |
      | 0 |	0 |
      | 0 |	1 |
      | 0 |	2 |
      | 2 |	2 |
      | 1 | 1 |

    When user collapses on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN	|

    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN|
      |1	| A3 |	MINUS_SIGN	|
      |2	| A2 |	MINUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |
      | 2 |	0 |
      | 0 |	0 |
      | 0 |	1 |
      | 0 |	2 |
      | 2 |	2 |
      | 1 | 1 | 
      
    When user collapses on node "2"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN|
      |1	| A3 |	MINUS_SIGN	|
      |2	| A2 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |
      | 2 |	0 |
      | 0 |	0 |
      | 0 |	1 |
      | 0 |	2 |
      | 1 | 1 |   

  Scenario: US07-65 - Check displayed correctly state of relationship of nodes (it have recursive and incoming nodes on same table) 
	                      when starting by all and expand&collapse them after that
	  Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_SameTable"
    And I access table "TableA_64"
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
    When user expands on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN |
      |1	| A3 |	MINUS_SIGN|
      |2	| A2 |	PLUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	1 |
      | 1 |	0 |
      | 0 |	1 |
      
    When user expands on node "2"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN |
      |1	| A3 |	MINUS_SIGN|
      |2	| A2 |	MINUS_SIGN|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |
      | 2 |	0 |
      | 0 |	1 |
      | 0 |	2 |
      | 1 |	1 |
      | 2 |	2 |

    When user expands on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	MINUS_SIGN|
      |1	| A3 |	MINUS_SIGN	|
      |2	| A2 |	MINUS_SIGN	|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |
      | 2 |	0 |
      | 0 |	1 |
      | 0 |	2 |
      | 0 |	0 |
      | 2 |	2 |
      | 1 | 1 |

    When user collapses on node "0"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN |
      |1	| A3 |	MINUS_SIGN|
      |2	| A2 |	MINUS_SIGN|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 1 |	0 |
      | 2 |	0 |
      | 0 |	1 |
      | 0 |	2 |
      | 1 |	1 |
      | 2 |	2 |

    When user collapses on node "1"
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| A1 |	PLUS_SIGN |
      |1	| A3 |	PLUS_SIGN|
      |2	| A2 |	MINUS_SIGN|
    Then the graph should contains following links
      #| Start Node |	End Node	|
      | 2 |	0 |
      | 0 |	2 |
      | 2 |	2 |        