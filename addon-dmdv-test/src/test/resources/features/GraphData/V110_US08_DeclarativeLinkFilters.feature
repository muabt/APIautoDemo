@DMDV110
Feature: US08-Declarative link filters

  Background: 
    Given I login to EBX succesfully

  #Scenario Outline: Check saved link config when input invalid for all options on Filter
  #Given open configuration with name "<configuration-name>"
  #And input "<xpath>" to Conditional Filter text box
  #Then error message "<error-message>" should be display on pop-up
  #And click save button
  #Then error message "<error-message>" should be display
  #
  #Examples:
  #| configuration-name | xpath | error-message                              |
  #| DM1_US08_01        | aaa   | Invalid xpath predicate expression [ aaa]. |
  @FKsameTable
  Scenario: US08_17.2- Check generated data correctly after created Filter condition by a target field + String function
    Given I access dataspace "Master Data - Reference>TDMDV"
    And I access dataset "DM1"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "1|A2"
    And user generates graph with configuration "DM1_US08_09.2"
    Then the graph should be displayed
    Then the label of node "0" equal "A2"
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A1  |
      | A2  |
      | A13 |

  Scenario: US08_17.3- Check generated data correctly after created Filter condition by a target field ( on group/group) + (boolean) function
    Given I access dataspace "Master Data - Reference>TDMDV"
    Given I access dataset "DM1"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "1|A2"
    And user generates graph with configuration "DM1_US08_09.3"
    Then the graph should be displayed
    Then the label of node "0" equal "A2"
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A1 |
      | A2 |

  Scenario: US08_17.4- Check generated data correctly after created Filter condition by a target (date) field ( on /group) +  'date' function
    Given I access dataspace "Master Data - Reference>TDMDV"
    Given I access dataset "DM1"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "1|A2"
    And user generates graph with configuration "DM1_US08_09.4"
    Then the graph should be displayed
    Then the label of node "0" equal "A2"
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A2 |

  Scenario: US08_17.5- Check generated data correctly after created Filter condition by a target (dateTime) field ( on /group/group) +  'dateTime' function
    Given I access dataspace "Master Data - Reference>TDMDV"
    Given I access dataset "DM1"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "1|A2"
    And user generates graph with configuration "DM1_US08_09.5"
    Then the graph should be displayed
    Then the label of node "0" equal "A2"
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A2 |

  Scenario: US08_17.6- Check generated data correctly after created Filter condition by a target (Time) field ( on /group) +  'Time' function
    Given I access dataspace "Master Data - Reference>TDMDV"
    Given I access dataset "DM1"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "1|A2"
    And user generates graph with configuration "DM1_US08_09.6"
    Then the graph should be displayed
    Then the label of node "0" equal "A2"
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A2 |

  Scenario: US08_17.7- Check generated data correctly after created Filter condition by a target (Time) field ( on /group) +  'Time' function & operator
    Given I access dataspace "Master Data - Reference>TDMDV"
    Given I access dataset "DM1"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "2|A7"
    And user generates graph with configuration "DM1_US08_09.changed"
    Then the graph should be displayed
    Then the label of node "0" equal "A7"
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | A7 |
      | A9 |

  Scenario: US08_17.8- Check generated data correctly after created Filter condition by target (interger) fields +  operators
    Given I access dataspace "Master Data - Reference>TDMDV"
    Given I access dataset "DM1"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "2|A8"
    And user generates graph with configuration "DM1_US08_10.1"
    Then the graph should be displayed
    Then the label of node "0" equal "A8"
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A8 |
      |    |

  Scenario: US08_17.9- Check generated data correctly after created Filter condition by a target (interger) field +  operators
    Given I access dataspace "Master Data - Reference>TDMDV"
    Given I access dataset "DM1"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "2|A8"
    And user generates graph with configuration "DM1_US08_10.2"
    Then the graph should be displayed
    Then the label of node "0" equal "A8"
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A8  |
      | A60 |

  #Scenario: US08_17.10- Check generated data correctly after created Filter condition by a FK (interger) field +  operators
  #Given I access dataspace "Master Data - Reference>TDMDV"
  #Given I access dataset "DM1"
  #And I access table "TableA"
  #And user views "Visualization>Display data using configuration" of record has ID is "2|A8"
  #And user generates graph with configuration "DM1_US08_10.3"
  #Then the graph should be displayed
  #Then the label of node "0" equal "A8"
  #When user expands target on node "0"
  #Then the label of all nodes is displayed as following
  #| A8 |
  #| A60 |
  Scenario: US08_17.11- Check generated data correctly after created Filter condition by targets (Interger and Boolean) field ( on /group) +  function & operator
    Given I access dataspace "Master Data - Reference>TDMDV"
    Given I access dataset "DM1"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "2|A8"
    And user generates graph with configuration "DM1_US08_10.changed"
    Then the graph should be displayed
    Then the label of node "0" equal "A8"
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A8 |

  Scenario: US08_17.12- Check generated data correctly after created Filter condition by normal and FK fields  +  function & operator
    Given I access dataspace "Master Data - Reference>TDMDV"
    Given I access dataset "DM1"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "1|A2"
    And user generates graph with configuration "DM1_US08_12"
    Then the graph should be displayed
    Then the label of node "0" equal "A2"
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A1  |
      | A13 |
      |     |
      | A2  |

  Scenario: US08_17.13- Check generated data correctly after created Filter condition by random fields  +  function & operator
    Given I access dataspace "Master Data - Reference>TDMDV"
    Given I access dataset "DM1"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "1|A2"
    And user generates graph with configuration "DM1_US08_12.changed"
    Then the graph should be displayed
    Then the label of node "0" equal "A2"
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A2 |
      |    |

  @FKtoOtherTable
  Scenario: US08_18.1- Check generated data correctly after created Filter condition by a source field + function
    Given I access dataspace "Master Data - Reference>TDMDV"
    Given I access dataset "DM1"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | 1 | A1  |
      | 2 | A10 |
    And user generates graph with configuration "DM1_US08_18.1"
    Then the graph should be displayed
    Then the label of node "0" equal "A1"
    When user expands target on node "0"
    Then the label of node "1" equal "A10"
    When user expands target on node "1"
    Then the label of all nodes is displayed as following
      | A1  |
      | B1  |
      | A10 |

  Scenario: US08_18.2- Check generated data correctly after created Filter condition by a target field + string function
    Given I access dataspace "Master Data - Reference>TDMDV"
    Given I access dataset "DM1"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | 1 | A1  |
      | 2 | A10 |
    And user generates graph with configuration "DM1_US08_18.2"
    Then the graph should be displayed
    Then the label of node "0" equal "A1"
    When user expands target on node "0"
    Then the label of node "1" equal "A10"
    When user expands target on node "1"
    Then the label of all nodes is displayed as following
      | A1  |
      | B1  |
      | A10 |

  Scenario: US08_18.3- Check generated data correctly after created Filter condition by a target field (on /group/group )+ boolean function
    Given I access dataspace "Master Data - Reference>TDMDV"
    Given I access dataset "DM1"
    And I access table "TableB"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "DM1_US08_18.3"
    Then the graph should be displayed
    Then the label of node "0" equal "B1"
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A10 |
      | B1  |

  Scenario: US08_18.4- Check generated data correctly after created Filter condition by a target field (on /group )+ date function
    Given I access dataspace "Master Data - Reference>TDMDV"
    Given I access dataset "DM1"
    And I access table "TableB"
    And user views "Visualization>Display data using configuration" of record has ID is "3"
    And user generates graph with configuration "DM1_US08_18.4"
    Then the graph should be displayed
    Then the label of node "0" equal "B3"
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A3 |
      | B3 |
      | A7 |

  Scenario: US08_18.5- Check generated data correctly after created Filter condition by a target field (on /group/group )+ dateTime function
    Given I access dataspace "Master Data - Reference>TDMDV"
    Given I access dataset "DM1"
    And I access table "TableB"
    And user views "Visualization>Display data using configuration" of record has ID is "3"
    And user generates graph with configuration "DM1_US08_18.5"
    Then the graph should be displayed
    Then the label of node "0" equal "B3"
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | B3 |

  Scenario: US08_18.6- Check generated data correctly after created Filter condition by a target field + Time function
    Given I access dataspace "Master Data - Reference>TDMDV"
    Given I access dataset "DM1"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | 2 | A11 |
      | 1 | A5  |
      | 2 | A10 |
    And user generates graph with configuration "DM1_US08_18.6"
    Then the graph should be displayed
    Then the label of node "0" equal "A5"
    When user expands target on node "0"
    Then the label of node "1" equal ""
    When user expands target on node "1"
    Then the label of node "2" equal "A10"
    When user expands target on node "2"
    Then the label of all nodes is displayed as following
      |     |
      | B11 |
      | A5  |
      | B4  |
      | A10 |

  Scenario: US08_18.7- Check generated data correctly after created Filter condition by a target field + string function & operators
    Given I access dataspace "Master Data - Reference>TDMDV"
    Given I access dataset "DM1"
    And I access table "TableB"
    And user views "Visualization>Display data using configuration" of record has ID is "11"
    And user generates graph with configuration "DM1_US08_18.7"
    Then the graph should be displayed
    Then the label of node "0" equal "B11"
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      |     |
      | B11 |

  #Scenario: US08_18.8- Check generated data correctly after created Filter condition by a target(FK) field + string function & operators
  #Given I access dataspace "Master Data - Reference>TDMDV"
  #Given I access dataset "DM1"
  #And I access table "TableB"
  #And user views "Visualization>Display data using configuration" of record has ID is "9"
  #And user generates graph with configuration "DM1_US08_18.8"
  #Then the graph should be displayed
  #Then the label of node "0" equal "B9"
  #When user expands target on node "0"
  #Then the label of all nodes is displayed as following
  #| B9 |
  Scenario: US08_18.9- Check generated data correctly after created many Filter condition by random1
    Given I access dataspace "Master Data - Reference>TDMDV"
    Given I access dataset "DM1"
    And I access table "/root/GroupA/TableLayer2" on group "/root/GroupA"
    And user views "Visualization>Display data using configuration" of record has ID is "12"
    And user generates graph with configuration "DM1_US08_18.9"
    Then the graph should be displayed
    Then the label of node "0" equal "12"
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      |  12 |
      | A60 |

  Scenario: US08_18.10- Check generated data correctly after created many Filter condition by random2
    Given I access dataspace "Master Data - Reference>TDMDV"
    Given I access dataset "DM1"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | 2 | A6 |
      | 2 | A7 |
    And user generates graph with configuration "DM1_US08_18.10"
    Then the graph should be displayed
    Then the label of node "0" equal "A7"
    When user expands target on node "0"
    Then the label of node "1" equal "A6"
    When user expands target on node "1"
    Then the label of all nodes is displayed as following
      | A6 |
      | A7 |
      | 13 |

  Scenario: US08_18.11- Check generated data correctly after created many Filter condition by random3
    Given I access dataspace "Master Data - Reference>TDMDV"
    Given I access dataset "DM1"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "6"
    And user generates graph with configuration "DM1_US08_18.changed"
    Then the graph should be displayed
    Then the label of node "0" equal "A60"
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      |  12 |
      | A60 |

  @FKtoExternaldataset(samemodel)
  Scenario: US08_19.1- Check generated data correctly with Line config and FK to external dataset (same model)1
    Given I access dataspace "Master Data - Reference>TDMDV"
    Given I access dataset "DM2"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | 1 | A1 |
      | 1 | A2 |
    And user generates graph with configuration "DM2_US08_19"
    Then the graph should be displayed
    Then the label of node "0" equal ""
    When user expands source on node "0"
    Then the label of node "1" equal "A1"
    When user expands source on node "1"
    Then the label of all nodes is displayed as following
      | A1 |
      |    |
      | F1 |
      | F2 |

  #Scenario: US08_19.2- Check generated data correctly with Line config and FK to external dataset (same model)2
  #Given I access dataspace "Master Data - Reference"
  #Given I access dataset "DM2"
  #And I access table "TableF"
  #And user views "Visualization>Display data using configuration" of record has ID is "1"
  #And user generates graph with configuration "DM2_US08_19.changed"
  #Then the graph should be displayed
  #Then the label of node "0" equal "F1"
  #When user expands target on node "0"
  #Then the label of all nodes is displayed as following
  #|F1|
  @FKtoExternaldataset(othermodel(samedataspace))
  Scenario: US08_20.1- Check generated data correctly with Line config and FK to external dataset (other model(same dataspace))
    Given I access dataspace "Master Data - Reference>TDMDV"
    Given I access dataset "DM2"
    And I access table "TableG"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "DM2_US08_20"
    Then the graph should be displayed
    Then the label of node "0" equal "G1"
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | G1 |
      | A1 |

  @FKtoExternaldataset(othermodel(otherdataspace))
  Scenario: US08_21- Check generated data correctly with Container config and FK to external dataset (other model(otherdataspace))
    Given I access dataspace "Master Data - Reference"
    Given I access dataset "DM2"
    And I access table "TableB"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "DM2_US08_21"
    Then the graph should be displayed
    Then the label of node "0" equal "B1'"
    When user expands parent on node "0"
    #Then the label of node "0" equal "A10"
    #When user expands children on node "0"
    Then the label of all nodes is displayed as following
      | B1' |
      | A10 |

  @FKtoexternaldataset(samemodel(inheritdataset))
  Scenario: US08_22- Check generated data correctly with Container config and FK to external dataset (same model(inheritdataset))
    Given I access dataspace "Master Data - Reference>TDMDV"
    Given I access dataset "DM2>DM2-N72"
    And I access table "TableG"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "DM2_US08_22"
    Then the graph should be displayed
    Then the label of node "0" equal "G1"
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | G1 |
      |    |

  #Scenario: Check generated data correctly with Container config and FK to external dataset (same model(inheritdataset))
  #Given I access dataspace "Master Data - Reference"
  #Given I access dataset "DM2"
  #And I access table "TableF"
  #And user views "Visualization>Display data using configuration" of record has ID is "1"
  #And user generates graph with configuration "DM2_US08_19"
  #Then the graph should be displayed
  #Then the label of node "0" equal "F1"
  #When user expands target on node "0"
  #Then the label of all nodes is displayed as following
  #| A1|
  #| A1|
  #| A1' |
  #|  |
  #|  |
  #
  #@FKtoexternaldataset(othermodel(inheritdataset))
  #Scenario: Check generated data correctly with Container config and FK to external dataset (another model(inheritdataset))
  #Given I access dataspace "Master Data - Reference>TDMDV"
  #Given I access dataset "DM1"
  #And I access table "TableA"
  #And user views "Visualization>Display data using configuration" of record has ID is "2|A10"
  #And user generates graph with configuration "DM2_US08_21"
  #Then the graph should be displayed
  #Then the label of node "0" equal "A10"
  #When user expands children on node "0"
  #Then the label of all nodes is displayed as following
  #|B1'|
  #|A10|
  #|B1 |
  #|B1 |
  @outofTC
  Scenario: Check generated data correctly with Line config and FK to other Table (in case Group>Group>Table)
    Given I access dataspace "Master Data - Reference>TDMDV"
    Given I access dataset "DM1"
    And I access table "/root/GroupB/groupLayer2/TableLayer3" on group "/root/GroupB>/root/GroupB,/root/GroupB/groupLayer2"
    And user views "Visualization>Display data using configuration" of records have ID are
      | 1 |
      | 2 |
    And user generates graph with configuration "DM1_US08_18.changed2"
    Then the label of node "0" equal "1"
    When user expands source on node "0"
    Then the label of all nodes is displayed as following
      | 1 |
      | 2 |
      | 2 |
