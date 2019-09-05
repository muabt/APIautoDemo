Feature: Merge function for survivor field
  I want to use this template for Merge function for survivor field

  @Survivor_Field_Longest
  Scenario: SC-MPMM80 Validate the pre-selected records at merge view screen when the sources of survivor field are different lenght
    Given I login to EBX succesfully
    And I access dataspace "Master Data - Reference>Resource"
    And I access dataset "Updater"
    And I access table "Table 38"
    When I select first "4" records in table
    And I select table service "Match and Merge>Merge"
    Then record view table will be displayed and highlighted as below
      | Date       | Name  | Company  |
      | 04/01/2019 | Danny | LG       |
      | 06/01/2019 | Sall  | MS       |
      | 06/06/2019 | Lan   | FPT      |
      | 06/23/2019 | Fry   | PO       |
    And table is highlighted and displayed on Preview table as below
      | Date       | Name  | Company |
      | 06/23/2019 | Danny | PO      |
    And the screen displays buttons as below
      | Name               | Status   |
      | Reset              | Enable   |
      | Cancel last action | Disable  |
      
 @Survivor_Field_Longest 
  Scenario: SC-MPMM81 Validate the pre-selected records at merge view screen when the sources of survivor field are same lenght
  Given I login to EBX succesfully
    And I access dataspace "Master Data - Reference>Resource"
    And I access dataset "Updater"
    And I access table "Table 37"
    When I select first "4" records in table
    And I select table service "Match and Merge>Merge"
    Then record view table will be displayed and highlighted as below
      | identifier | Name  | Phone   | National| 
      |  1         | Lovly | 13,456   | 3       |  
      |  2         | Kylie | 312,456 | 3       |  
      |  3         | Jenny | 21,345  | 3       |  
      |  4         | Coupe | 12,456  | 3       |  
    And table is highlighted and displayed on Preview table as below
      | identifier | Name  | Phone   | National| 
      |  1         | Coupe | 12,456   | 3       |
    And the screen displays buttons as below
      | Name               | Status   |
      | Reset              | Enable   |
      | Cancel last action | Disable  |
      