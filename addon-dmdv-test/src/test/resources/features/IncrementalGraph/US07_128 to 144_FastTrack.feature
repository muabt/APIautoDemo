@DMDV120-UAT
Feature: US07-Provide service for incremental tree

  Background: 
    Given I login to EBX succesfully
         
	  Scenario: US07-65 - Check displayed correctly state of relationship of nodes (it have recursive and incoming nodes on same table) 
	                      when starting by all and expand&collapse them after that
    Given I access dataspace "FastTrack>[02] Data governance>Applications landscape"
    Given I access dataset "Applications landscape"
    And I access table "Attribute Types"
    And user views "Visualization>Display selected data" of records have ID are
      | VARCHAR |
      
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| VARCHAR |	PLUS_SIGN	|
    When user expands on node "0"
    Then the graph should contains following nodes 
 
  Scenario: US07-65 - Check displayed correctly state of relationship of nodes (it have recursive and incoming nodes on same table) 
	                      when starting by all and expand&collapse them after that
    Given I access dataspace "FastTrack>[03] Parties data>Company employees"
    Given I access dataset "Company employees"
    And I access table "Employees"
    And user views "Visualization>Display selected data" of records have ID are
      | 14 |
      
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| 14 - Elia Emmer |	PLUS_SIGN	|
    When user expands on node "0"
    Then the graph should contains following nodes 

  Scenario: US07-65 - Check displayed correctly state of relationship of nodes (it have recursive and incoming nodes on same table) 
	                      when starting by all and expand&collapse them after that
    Given I access dataspace "FastTrack>[03] Parties data>Company employees"
    Given I access dataset "Company employees"
    And I access table "Persons"
    And user views "Visualization>Display selected data" of records have ID are
      | 1 |
      
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| Brandi Robinson |	PLUS_SIGN	|
    When user expands on node "0"
    Then the graph should contains following nodes     
    
	Scenario: US07-65 - Check displayed correctly state of relationship of nodes (it have recursive and incoming nodes on same table) 
	                      when starting by all and expand&collapse them after that
    Given I access dataspace "FastTrack>[03] Parties data>Company employees"
    Given I access dataset "Company employees"
    And I access table "Work contracts"
    And user views "Visualization>Display selected data" of records have ID are
      | 1 |
      
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| Brandi Robinson |	PLUS_SIGN	|
    When user expands on node "0"
    Then the graph should contains following nodes  
    
	Scenario: US07-65 - Check displayed correctly state of relationship of nodes (it have recursive and incoming nodes on same table) 
	                      when starting by all and expand&collapse them after that
    Given I access dataspace "FastTrack>[03] Parties data>Company employees"
    Given I access dataset "Company employees"
    And I access table "Assignments"
    And user views "Visualization>Display selected data" of records have ID are
      | 99 |
      
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| Brandi Robinson |	PLUS_SIGN	|
    When user expands on node "0"
    Then the graph should contains following nodes   
    
	Scenario: US07-65 - Check displayed correctly state of relationship of nodes (it have recursive and incoming nodes on same table) 
	                      when starting by all and expand&collapse them after that
    Given I access dataspace "FastTrack>[02] Data governance>GDPR"
    Given I access dataset "GDPR"
    And I access table "Consents management"
    And user views "Visualization>Display selected data" of records have ID are
      | Brandi Robinson |
      
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| Brandi Robinson |	PLUS_SIGN	|
    When user expands on node "0"
    Then the graph should contains following nodes     

	Scenario: US07-65 - Check displayed correctly state of relationship of nodes (it have recursive and incoming nodes on same table) 
	                      when starting by all and expand&collapse them after that
    Given I access dataspace "FastTrack>[03] Parties data>Customers (Salesforce)"
    Given I access dataset "Customers"
    And I access table "Accounts"
    And user views "Visualization>Display selected data" of records have ID are
      | 1 |
      
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| GenePoint Corp |	PLUS_SIGN	|
    When user expands on node "0"
    Then the graph should contains following nodes 
    
	Scenario: US07-65 - Check displayed correctly state of relationship of nodes (it have recursive and incoming nodes on same table) 
	                      when starting by all and expand&collapse them after that
    Given I access dataspace "FastTrack>[03] Parties data>Executives"
    Given I access dataset "Executives"
    And I access table "Executives"
    And user views "Visualization>Display selected data" of records have ID are
      | 16 |
      
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| Rory Read |	PLUS_SIGN	|
    When user expands on node "0"
    Then the graph should contains following nodes     
    
	Scenario: US07-145 - heck expand & collapse node for a starting node when generated data from Citi and "Record" table
    Given I access dataspace "FastTrack>GrittDataSpace"
    Given I access dataset "[DMDV] Gritt City"
    And I access table "Report"
    And user views "Visualization>Display selected data" of records have ID are
      | 41 |
      
    Then the incremental graph should be displayed
    Then the graph should contains following nodes
      #|Key	| Label |	Button Icon	|
      |0	| FR Y-14Q: A.1 INTERNATIONAL AUTO LOAN |	PLUS_SIGN	|
    When user expands on node "0"
    When user expands on node "223"
    When user expands on node "156"
    When user collapses on node "0"
    When user expands on node "0"
    When user expands on node "184"
    When user expands on node "224"
    When user expands on node "241"  
    When user expands on node "237"               