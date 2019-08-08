@DMDV110
Feature: US02-Ability to define a graph orientation on data graph

  Background: 
    Given I login to EBX succesfully

	Scenario: Check generated data correctly with Line config and FK same Table
    Given I access dataspace "Master Data - Reference>DMDV1.1.0"
    Given I access dataset "US02"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "1"
    And user generates graph with configuration "US02-01"
    Then the graph should be displayed
    When user expands source on node "0"
    When user expands target on node "0"
    #Then the label of all nodes is displayed as following
    #	|	AName1	|
    #	|	BName1	|
    #	|	DName1	|
    Then current graph orientation should be "Left to right"
    #When user change graph orientation to "Bottom up"
    #Then the label of all nodes is displayed as following
    #	|	AName1	|
    #	|	BName1	|
    #	|	DName1	|
    #Then current graph orientation should be "Bottom up"
    
    