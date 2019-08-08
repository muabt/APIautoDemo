#Author: tbui@tibco.com
@DMDV100
Feature: Test graph data with configuration

  Background: 
    Given I login to EBX succesfully

  Scenario: Data_230 - Check Node Label when no input to default label on Model
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_230"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_230"
    Then the graph should be displayed
    Then the label of node "0" equal "A1"
    
      Scenario: Data_231 - Check Node Label when input Valid to default label on Model
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_231"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_231"
    Then the graph should be displayed
    Then the label of node "0" equal "Default label"
    
      Scenario: Data_232 - Check Node Label when No input to Localized label on Model
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_232"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_232"
    Then the graph should be displayed
    Then the label of node "0" equal "No localization label"
    
      Scenario: Data_233 - Check Node Label when Input valid to Localized label on Model
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_233"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_233"
    Then the graph should be displayed
    Then the label of node "0" equal "Localized label"
    
     Scenario: Data_234 - Check Node Label when input With content too long on Model
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_234"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_234"
    Then the graph should be displayed
    Then the label of node "0" equal "We should add a new group"
    
     Scenario: Data_235 - Check Node Label when input With content too long on Model
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_235"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_235"
    Then the graph should be displayed
    Then the label of node "0" equal "We should add a new group. We should add a new group.  We should add a new group."
    
      Scenario: Data_236 - Check Node Label when input With content too long on Model
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_236"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_236"
    Then the graph should be displayed
    Then the label of node "0" equal "We should add a new group. We should add a new group.-We should add a new group. We should add a new group."
    