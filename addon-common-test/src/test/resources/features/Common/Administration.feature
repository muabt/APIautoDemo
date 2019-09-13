@PRE-TESTING
Feature: Administration workspace
  As user
  I want to use all service of Administration workspace

  Background:
    Given I login to EBX succesfully

  #Scenario: Delete the dataspace in administration workspace1
    Given I want to create matching table
#
  #Scenario: Delete the dataspace in administration workspace
    #And I access "dataspace" menu
    #And I access dataspace "FastTrack>[03] Parties data>Company employees"
    #And I create child Dataspace with information as following
      #| Identifier | Owner              | English Label |
      #|            | John Smith (admin) | Store         |
    #And I close dataspace with service "Close this dataspace"
    #And I access "administration" menu
    #And I access to administration service "Dataspaces"
    #And I access table "Dataspaces/snapshots" service
    #And I select filter by text with keyword and field below
      #| Field contains: | In fields |
      #| Store           |           |
    #And I delete the dataspace "Dataspace Store (Store)" with service "Delete dataspaces and snapshots recursively"
    #
    
  Scenario: Run Match with MAME configuration with MatchingTable and Matching Policy Active.
    And I access "administration" menu
    And I access to "Match and Merge configuration" parent item
    And I access to "Matching table" item
    And I create record with the followings
      | Data model:DDL | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: genealogy| Person |     Yes      |                              |                  |                |                     |
    And I select first "1" records in table