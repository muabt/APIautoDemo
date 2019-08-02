#Author: tbui@tibco.com
@DMDV120-US13
Feature: US13 Ability to call the graph services from workflow

  Background: 
    Given I login to EBX succesfully

  #Scenario Outline: US13-61 Check that run service on Workflow when created it with invalid for DataSpace field
  #Given user accesses Data workflows menu
  #Given user accesses Workflow launchers
  #And user lunch workflow model "<workflowname>"
  #Given user accesses to Inbox
  #And user start work item
  #Then the popup message should be displayed "<msg>"
  #
  #Examples:
  #| workflowname | msg                                    |
  #| MWorkflow2   | Dataspace ref. invalid does not exist. |
  #**************************************************
  Scenario Outline: US13-64 Check that run service on Workflow when created it with invalid for Graph configuration field
    Given user accesses Data workflows menu
    Given user accesses Workflow launchers
    And user lunch workflow model "<workflowname>"
    Given user accesses to Inbox
    And user start work item
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      | 6 - Person 06 |
      | Person 06     |

    Examples: 
      | workflowname |
      | MWorkflow5   |

  #***************************************************
  Scenario Outline: US13-65 Check that run service on Workflow when created it with invalid for Expand by default field
    Given user accesses Data workflows menu
    Given user accesses Workflow launchers
    And user lunch workflow model "<workflowname>"
    Given user accesses to Inbox
    And user start work item
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      | 6 - Person 06 |

    Examples: 
      | workflowname |
      | MWorkflow6   |

  #***************************************************
  Scenario Outline: US13-66 Check that run service on Workflow when create it with many record
    Given user accesses Data workflows menu
    Given user accesses Workflow launchers
    And user lunch workflow model "<workflowname>"
    Given user accesses to Inbox
    And user start work item
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      | 6 - Person 06 |
      | 7 - Person 02 |
      | Person 06     |
      | Person 02     |

    Examples: 
      | workflowname |
      | MWorkflow10  |

  #***************************************************
  Scenario Outline: US13-68 Check that run service on Workflow when create it with one record
    Given user accesses Data workflows menu
    Given user accesses Workflow launchers
    And user lunch workflow model "<workflowname>"
    Given user accesses to Inbox
    And user start work item
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      | 6 - Person 06 |
      | Person 06     |

    Examples: 
      | workflowname |
      | MWorkflow7   |

  #***************************************************
  Scenario Outline: US13-69 Check that run service on Workflow when create it with one graph configuration
    Given user accesses Data workflows menu
    Given user accesses Workflow launchers
    And user lunch workflow model "<workflowname>"
    Given user accesses to Inbox
    And user start work item
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      | 6 - Person 06 |
      | 7 - Person 02 |
      | Person 06     |
      | Person 02     |
      | 8 - Person 01 |
      | Person 01     |

    Examples: 
      | workflowname |
      | MWorkflow69  |

  #***************************************************
  Scenario Outline: US13-70 Check that run service on Workflow when create it with many graph configuration
    Given user accesses Data workflows menu
    Given user accesses Workflow launchers
    And user lunch workflow model "<workflowname>"
    Given user accesses to Inbox
    And user start work item
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      | 6 - Person 06 |
      | Person 06     |

    Examples: 
      | workflowname |
      | MWorkflow12  |

  #***************************************************
  Scenario Outline: US13-73&78 Check that run service on Workflow when create it with simple dataset
    Given user accesses Data workflows menu
    Given user accesses Workflow launchers
    And user lunch workflow model "<workflowname>"
    Given user accesses to Inbox
    And user start work item
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      | A1 |

    Examples: 
      | workflowname |
      | MWorkflow15  |

  #***************************************************
  Scenario Outline: US13-77 Check that run service on Workflow when not input Graph configuration
    Given user accesses Data workflows menu
    Given user accesses Workflow launchers
    And user lunch workflow model "<workflowname>"
    Given user accesses to Inbox
    And user start work item
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      | E'1 | TOP                   | 5 |
      | B'1 | BOTTOM                |   |
      | A1  | LEFT,RIGHT,TOP,BOTTOM | 6 |
      | C'1 |                       |   |
      | D'1 |                       |   |

    Examples: 
      | workflowname |
      | MWorkflow19  |

  #***************************************************
  Scenario Outline: US13-85 Check that the data graph with duplicate node
    Given user accesses Data workflows menu
    Given user accesses Workflow launchers
    And user lunch workflow model "<workflowname>"
    Given user accesses to Inbox
    And user start work item
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      | A1 | TOP | 1 |
      | A1 | TOP | 3 |
      | C1 |     |   |
      | D1 |     |   |

    Examples: 
      | workflowname |
      | MWorkflow23  |

  #***************************************************
  Scenario Outline: US13-86 Check that expand/collapse node of the data graph
    Given user accesses Data workflows menu
    Given user accesses Workflow launchers
    And user lunch workflow model "<workflowname>"
    Given user accesses to Inbox
    And user start work item
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT,TOP,BOTTOM |  |
    #2. Right mouse on node and expand/collapse source
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT,TOP,BOTTOM |  |
      | B1 |                       |  |
    Then the label of link label should be display as following
      | 1 | 0 |  |
    When user collapse source on node "0"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT,TOP,BOTTOM |  |
    Then there is no link displayed
    #3. Right mouse on node and expand/collapse target
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT,TOP,BOTTOM |  |
      | C1 |                       |  |
    Then the label of link label should be display as following
      | 0 | 2 |  |
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT,TOP,BOTTOM |  |
    Then there is no link displayed
    #4. Right mouse on node and expand/collapse child
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT,TOP,BOTTOM |   |
      | D1 |                       | 0 |
    Then there is no link displayed
    When user collapse children on node "0"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT,TOP,BOTTOM |  |
    Then there is no link displayed
    #5. Right mouse on node and expand/collapse parent
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT,TOP,BOTTOM | 5 |
      | E1 |                       |   |
    Then there is no link displayed
    When user collapse parent on node "4"
    Then the label of all nodes is displayed as following
      | A1 | LEFT,RIGHT,TOP,BOTTOM |  |
    Then there is no link displayed

    Examples: 
      | workflowname |
      | MWorkflow24  |

  #***************************************************
  Scenario Outline: Check that label node with Default label and Localize label.
    Given user accesses Data workflows menu
    Given user accesses Workflow launchers
    And user lunch workflow model "<workflowname>"
    Given user accesses to Inbox
    And user start work item
    Then the graph should be displayed
    Then the label of node "0" equal "<label>"

    Examples: 
      | configuration-name | label | workflowname |
      | US13-89            | A1    | MWorkflow24  |
   #***************************************************   
        Scenario Outline: Check that label node with Default label and Localize label.
    Given user accesses Data workflows menu
    Given user accesses Workflow launchers
    And user lunch workflow model "<workflowname>"
    Given user accesses to Inbox
    And user start work item
    Then the graph should be displayed
    Then the label of node "0" equal "A1"
    When user expands source on node "0"
    Then the label of link from node "1" to "0" equal "<label>"

    Examples: 
      | configuration-name | label                        | workflowname |  |
      | US13-90            | Link from Table A to Table B | MWorkflow24  |  |
