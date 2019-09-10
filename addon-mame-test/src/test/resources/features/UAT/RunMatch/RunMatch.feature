Feature: Run Match feature
  I want to use this Run Match to know the duplicate record in the table.

  Background: 
    Given I login to EBX succesfully
  @Run_Match
  Scenario: Run Match with MAME configuration with MatchingTable and Matching Policy Active
    And I access "administration" menu
    And I access to administration service "Dataspaces"    
    