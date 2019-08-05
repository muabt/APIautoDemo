@IMPORT
Feature: Import CSV
  As a business user, I want to import data from a CSV file at the table level

  Background: 
     Given I login to EBX succesfully

  @type1
  Scenario: Import valid CSV file
    When user accesses dataspace "Master Data - Reference"
    And user accesses data set "Employee"
    And user access to child of dataset "Employee"
    And user selects table "Employee"
    And user select "Data Exchange>Import CSV" service
    And user upload CSV file with name "Automation_case_2.csv"
    And user select options in import CSV view
      | Load preference | First row contains header | Field separator | List separator | Delimiter |
      |                 | Yes                       | Space           | Line return    | '         |
    And user select "Advanced options" of CSV view
      | Import mode | Use case-sensitive comparison when matching the header | File encoding | Decimal symbol | Download file of invalid data | Ignore the empty or null values | Check empty or null primary keys |
      | Update only | No                                                     | UTF-8         | Dot "."        | No                            | Yes                             | Yes                              |
    And user selects options in "Turbo import" of CSV view
      | Commit threshold | History deactivation | Database history deactivation | Trigger deactivation | Blocking constrains deactivation | Dataset validation deactivation | All privileges |
      |                  | No                   | No                            | No                   | No                               | No                              | No             |
    Then user click on Import button

  Scenario: Import valid CSV file with default configuration
    When user accesses dataspace "Master Data - Reference"
    And user accesses data set "Employee"
    And user access to child of dataset "Employee"
    And user selects table "Employee"
    And user select "Data Exchange>Import CSV" service
    And user upload CSV file with name "Employee.csv"
    And user click on Import button
    Then should be imported successfully and the result view display with credentials
      | Total                              | Inserted       | Updated        | Deleted       | Unchanged       | Invalid          |
      | Total number of processed lines: 8 | 0 row inserted | 8 rows updated | 0 row deleted | 0 row unchanged | 0 row is invalid |
