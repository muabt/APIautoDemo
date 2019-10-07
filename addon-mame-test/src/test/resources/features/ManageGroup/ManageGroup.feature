@SYSTEM
Feature: Run Manage group service
  Background:
    Given I login to EBX successfully

Scenario: SC-MGD004 Check behaviour when user doesn't select any record and run "Manage group" service
  And I access table "Inventory" of dataset "Diamond" in dataspace "Reference-child"
  And I select table service "Match and Merge > Manage group "
  Then the popup message should be shown "One row has to be selected."

