@DMDV
Feature: Create new data model graph
  As user
  I want to generate new graph

  Background: 
    Given I login to EBX succesfully

  Scenario: Graph model
    Given I access dataspace "FastTrack>[03] Parties data>Company employees"
    Given I access dataset "Company employees"
    And user views data model graph
    When user closes graph
    Then the graph is no longer displayed.
    When user views data model graph
    Then the graph should be displayed
    #############Step 6,7
    And user exports graph to "PNG" file
    Then "CompanyEmployees.png" file should exported
    And user exports graph to "PDF" file
    Then "CompanyEmployees.pdf" file should exported
    #############Step 8,9
    When user selects fullscreen graph
    Then graph should be displayed fullscreen
    When user exits fullscreen
    Then graph should be displayed normally
    #############Step 10
    When user zoom in graph
    Then graph should be zoomed-in
    When user zoom out graph
    Then graph should be zoomed-out
    ##############Step 11
    When user wants to filter graph
    And user move cursor on some fields on tables list
    And user applies filter with all field
    And user finished filter graph
    When user wants to filter graph
    And user applies filter with no field
    Then user should see the warning "You must select at least one table."
    ###############
    When user saves graph as the name "DMDV Graph"
    ###############
    When user loads new graph has the name "DMDV Graph"
    Then the graph should be displayed
    ###############Step 30
    When user wants to change graph template
    And user updates configuration as following
      | Config          | Options    | Value                |
      | Table           | Border     | EB1D1D               |
      | Table           | Background | F6F625               |
      | Table           | Text       | 1751F0               |
      | External table  | Border     | FFFFFF               |
      | External table  | Background | F0F0F0               |
      | External table  | Text       |               000000 |
      | Tooltip         | Background | FFFFCC               |
      | Tooltip         | Text       |               000000 |
      | Link            | Color      | A6AAA9               |
      | Link            | Label      |               000000 |
      #| Synchronization | Creation   | 00B000 |
      #| Synchronization | Update     | 0000FF |
      #| Synchronization | Delete     | FF0000 |
      | Highlight color |            | FF0000               |
      | Display options |            | Cardinality on links |
    #FFFFFF ,C5E3FD,111111
    Then the graph "-937087177" should be updated according to configuration
      | Config | Options    | Value  |
      | Table  | Border     | EB1D1D |
      | Table  | Background | F6F625 |
      | Table  | Text       | 1751F0 |
    Then graph should has 18 groups and nodes
    Then graph should has node key: "-937087177"
