Feature: Upload CSV file
  As a user
  I want to upload CSV file

  Background:
    Given the user is on the EBX home page

  Scenario: Upload file with CSV
    Given user login to EBX with username "alice" and password "onvn"
    And user accesses dataspace "Master Data - Reference"
    And user accesses data set "Burger"
    And user selects table "Products"
    When user select "Data Exchange>Import CSV" service
    And user upload CSV file with name "Employee.csv"

