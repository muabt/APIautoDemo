#Author: tbui@tibco.com
@DMDV120
Feature: US07-Provide service for incremental tree (another table (Same dataset))

  Background: 
    Given I login to EBX succesfully

  Scenario: US07-179 Check Node Label when no input to default label on Model
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-179"
    And I access table "TableA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then in the displayed incremental graph the label of node "0" equal "1"

  #**********************************
  Scenario: US07-180 Check Node Label when input Valid to default label on Model
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-179"
    And I access table "TableB"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then in the displayed incremental graph the label of node "0" equal "B1"

  #**********************************
  Scenario: US07-181 Check Node Label when input Valid to default label on Model
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-179"
    And I access table "TableC"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then in the displayed incremental graph the label of node "0" equal "1"

  #**********************************
  Scenario: US07-182 Check Node Label when input Valid to default label on Model
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-182"
    And I access table "TableA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then in the displayed incremental graph the label of node "0" equal "EnglishA"

  #**********************************
  Scenario: US07-183 Check Node Label when input Valid to default label on Model
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-183"
    And I access table "TableA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then in the displayed incremental graph the label of node "0" equal "Please remember that all slides"

  #**********************************
  Scenario: US07-184 Check Node Label when input Valid to default label on Model
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-184"
    And I access table "TableA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then in the displayed incremental graph the label of node "0" equal "Please remember that all slides and recordings produced"

  #**********************************
  Scenario: US07-185 Check Node Label when input Valid to default label on Model
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07-185"
    And I access table "TableA"
    And user views "Visualization>Display selected data" of record has ID is "1"
    Then the incremental graph should be displayed
    Then in the displayed incremental graph the label of node "0" equal "Please remember that all slides and recordings produced for the Brown Bags are"
