#Author: tbui@tibco.com
@DMDV120
Feature: US13 Ability to call the graph services from a perspective

  Background: 
    Given I login to EBX succesfully

  Scenario Outline: US13(14-20) Check that generate the data graph successful with starting node when running service on Perspective
    Given user accesses select perspective menu
    Given user accesses perspective "<perspectivename>"
    And user select action "<actionname>"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      | 3Name1 |

    Examples: 
      | perspectivename | actionname |
      | M_DataGraph     | MValue5    |
      | M_DataGraph     | MValue11   |

  #********************************************
  Scenario Outline: US13(15-18-19-23) Check that generate the data graph successful with expanding 4 direction starting node when running service on Perspective.
    Given user accesses select perspective menu
    Given user accesses perspective "<perspectivename>"
    And user select action "<actionname>"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      | 1Name1 |
      | 2Name3 |
      | 3Name1 |

    Examples: 
      | perspectivename | actionname |
      | M_DataGraph     | MValue6    |
      | M_DataGraph     | MValue9    |
      | M_DataGraph     | MValue10   |
      | M_DataGraph     | MValue14   |

  #*************************************************
  Scenario Outline: US13(10,11,16,28) Check that show error message with abnormal cases when running service on Perspective
    Given user accesses select perspective menu
    Given user accesses perspective "<perspectivename>"
    And user select action "<actionname>"
    Then the error message should be displayed "<msg>"

    Examples: 
      | perspectivename | actionname | msg                                                                            |
      | M_DataGraph     | MValue1    | An error occured while displaying MValue1. Please contact your administrator.  |
      | M_DataGraph     | MValue2    | An error occured while displaying MValue2. Please contact your administrator.  |
      | M_DataGraph     | MValue7    | An error occured while displaying MValue7. Please contact your administrator.  |
      | M_DataGraph     | MValue19   | An error occured while displaying MValue19. Please contact your administrator. |
      
  # ***********************************
  Scenario Outline: US13(13,24,31) Check that show list graph configuration screen when running service on Perspective.
    Given user accesses select perspective menu
    Given user accesses perspective "<perspectivename>"
    And user select action "<actionname>"
    Then the select graph configuration should be displayed

    Examples: 
      | perspectivename | actionname |
      | M_DataGraph     | MValue4    |
      | M_DataGraph     | MValue15   |
      | M_DataGraph     | MValue22   |

  #***********************************
  Scenario Outline: US13-17 Check that run service on Perspective when create it with many record
    Given user accesses select perspective menu
    Given user accesses perspective "<perspectivename>"
    And user select action "<actionname>"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      | 1Name1 |
      | 2Name3 |
      | 3Name1 |
      | 3Name2 |
      | 3Name3 |

    Examples: 
      | perspectivename | actionname |
      | M_DataGraph     | MValue8    |

  #********************************************
  Scenario Outline: US13-21 Check that run service on Perspective when create it with many record and Expand by default is True
    Given user accesses select perspective menu
    Given user accesses perspective "<perspectivename>"
    And user select action "<actionname>"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      | 1Name1 |
      | 2Name3 |
      | 3Name1 |
      | 3Name2 |
      | 3Name3 |
      | 3Name4 |
      | 3Name5 |
      | 3Name6 |
      | 3Name7 |
      | 2name2 |
      | 1NAME2 |

    Examples: 
      | perspectivename | actionname |
      | M_DataGraph     | MValue12   |

  #****************************************
  Scenario Outline: US13-22 Check that run service on Perspective when create it with many record and Expand by default is False
    Given user accesses select perspective menu
    Given user accesses perspective "<perspectivename>"
    And user select action "<actionname>"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      | 3Name1 |
      | 3Name2 |
      | 3Name3 |

    Examples: 
      | perspectivename | actionname |
      | M_DataGraph     | MValue13   |

  #***********************************************
  Scenario Outline: US13-27 Check that run service on Perspective when create it with simple dataset
    Given user accesses select perspective menu
    Given user accesses perspective "<perspectivename>"
    And user select action "<actionname>"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      | 1Name1 |
      | 2Name3 |
      | 3Name1 |
      | 3Name7 |

    Examples: 
      | perspectivename | actionname |
      | M_DataGraph     | MValue18   |

  #*************************************************
  Scenario Outline: US13-38 Check that the data graph with duplicate node
    Given user accesses select perspective menu
    Given user accesses perspective "<perspectivename>"
    And user select action "<actionname>"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      | 2Name1 |
      | 2Name1 |
      | 3Name1 |
      | 4Name1 |

    Examples: 
      | perspectivename | actionname |
      | M_DataGraph_2   | MValue26   |

  #**************************************
  Scenario Outline: US13-39 Check that expand/collapse node of the data graph
    Given user accesses select perspective menu
    Given user accesses perspective "<perspectivename>"
    And user select action "<actionname>"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      | 9Name1 |
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | 9Name1  |
      | 10Name1 |
      | 10Name3 |
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      | 9Name1  |
      | 10Name1 |
      | 10Name3 |
      | 11Name2 |
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      | 9Name1  |
      | 10Name1 |
      | 10Name3 |
      | 11Name2 |
      | 12Name1 |
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | 9Name1  |
      | 10Name1 |
      | 10Name3 |
      | 11Name2 |
      | 12Name1 |
      | 8Name1  |
    When user collapse target on node "5"
    Then the label of all nodes is displayed as following
      | 9Name1  |
      | 11Name2 |
      | 12Name1 |
      | 8Name1  |
    When user collapse source on node "5"
    Then the label of all nodes is displayed as following
      | 9Name1  |
      | 12Name1 |
      | 8Name1  |
    When user collapse children on node "5"
    Then the label of all nodes is displayed as following
      | 9Name1 |
      | 8Name1 |
    When user collapse parent on node "5"
    Then the label of all nodes is displayed as following
      | 9Name1 |

    Examples: 
      | perspectivename | actionname |
      | M_DataGraph_2   | MValue28   |

  #*************************************************
  Scenario Outline: US13-42 Check that displayed label of node correctly
    Given user accesses select perspective menu
    Given user accesses perspective "<perspectivename>"
    And user select action "<actionname>"
    Then the graph should be displayed
    Then the label of node "0" equal "Add label for node"

    Examples: 
      | perspectivename | actionname |
      | M_DataGraph_2   | MValue29   |

  #****************************************
  Scenario Outline: US13-43 Check that displayed label of link correctly
    Given user accesses select perspective menu
    Given user accesses perspective "<perspectivename>"
    And user select action "<actionname>"
    Then the graph should be displayed
    Then the label of link from node "1" to "0" equal "Add label for link"

    Examples: 
      | perspectivename | actionname |
      | M_DataGraph_2   | MValue30   |

  #*****************************************
  Scenario Outline: US13-48 Check that user can zoom in/zoom out the data graph
    Given user accesses select perspective menu
    Given user accesses perspective "<perspectivename>"
    And user select action "<actionname>"
    Then the graph should be displayed
    When user zoom in graph
    Then graph should be zoomed-in
    When user zoom out graph
    Then graph should be zoomed-out

    Examples: 
      | perspectivename | actionname |
      | M_DataGraph_2   | MValue25   |

  #************************************
  Scenario Outline: US13-49 Check that user can view graph with full screen mode
    Given user accesses select perspective menu
    Given user accesses perspective "<perspectivename>"
    And user select action "<actionname>"
    Then the graph should be displayed
    When user selects fullscreen graph
    Then graph should be displayed fullscreen
    When user exits fullscreen
    Then graph should be displayed normally

    Examples: 
      | perspectivename | actionname |
      | M_DataGraph_2   | MValue25   |

      