@Survivor_record_selection_mode
Feature: Survivor record selection mode is defined


  Scenario: SC-MPMM01 Check pre-selected records at merge view screen when Used for manual merge is No
    Given I login to EBX succesfully
    And I access dataspace "Master Data - Reference>Reference-child"
    And I access dataset "Master Data - Reference>Reference-child>Human_Resource"
    And I access table "TableNotUsedforManualMerge"
    When I select first "2" records in table
    And I select table service "Match and Merge>Merge"
    Then record view table will be displayed and highlighted as below
      | id | Owner | Employee |
      |  1 | Luna  | Davied   |
      |  2 | Alex  | Davied   |
    And preview table is displayed as below
      | id | Owner | Employee |
      |    |       |          |
    #And the screen displays buttons as below
      #| Name               | Status  |
      #| Reset              | Enable |
      #| Cancel last action | Disable  |
    
    Scenario: SC-MPMM02 Check pre-selected records at merge view screen when Survivor record selection mode is Most trusted source
    Given I login to EBX succesfully
    And I access dataspace "Master Data - Reference>Reference-child"
    And I access dataset "Master Data - Reference>Reference-child>Human_Resource"
    And I access table "Employee"
    When I select first "2" records in table
    And I select table service "Match and Merge>Merge"
    Then record view table will be displayed and highlighted as below
    | Identifier | Date of birth | National |Phone Number|Email|Rank|Supervisor|Date and time created|PIT|Assurance number|
    |  1 | Luna  |          |
    |  2 | Alex  |          |
    And preview table is displayed as below
    | ID | Owner | Employee |
    ||||
    And the screen displays buttons as below
      | Name               | Status  |
      | Reset              | Disable |
      | Cancel last action | enable  |
