Feature: Manual Merge
  In order to use Manual Merge
  As a user
  I want to specify the feature flow

  Background:
    Given I login to EBX successfully

  Scenario: Merge policy with Most trusted source, Longest default merge function
    Given I want to create matching table
    And I create record with the followings
      | Data model:DDL         | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: genealogy | Person    | Yes          |                              |                  |                    |                       |
    And I select matching policy record of table "Person"
    When I specific the options in Main tab of Merge policy as belows
      | Merge policy code | Survivor record selection mode | Default merge function | Auto create new golden | Used for manual merge | Apply permission on merge view |
      | RANDOM            | Most trusted source            | Longest                | Disabled               | Yes                   | Yes                            |
#    And I create Survivorship field with selections as followings
#      | KEY | Survivorship field code | Field               | Merge function | Auto create new golden | Condition for field value survivorship | Execute only if empty |
#      | 01  | RANDOM                  | Most trusted source | Longest        | Disabled               |                                        | Yes                   |
#    And I create a child of dataspace "Master Data - Reference > ManualMerge" with information as following
#      | Identifier | Owner               | English Label |
#      |            | admin admin (admin) |               |
#    And I access table "Items" of dataset "Metadatas" in dataspace "Master Data - Reference > ManualMerge"
#    When I select first "2" records in table
#    And I select table service "Match and Merge > Merge"
#    Then record view table will be displayed and highlighted as below
#      | KEY | Indentifiers | Category  | Brand   | Name             | Available  | defaultPrice | Expire_date         | testSourceField | integer     |
#      | 01  | 1            | name1 - 1 | Branh 2 | Minh Tran Tranhg | [List] 4/4 | 120          | 04/09/2019 17:04:24 | 2010            | 999,999,999 |
#      | 01  | 2            | name1 - 1 | Branh 2 | Minh Tran        | [List] 0/3 | 120          | 04/09/2019 17:04:24 | 2010            | 999,999,999 |
#    And preview table is displayed as below
#      | KEY | Indentifiers | Category  | Brand   | Name             | Available  | defaultPrice | Expire_date         | testSourceField | integer     |
#      | 01  | 1            | name1 - 1 | Branh 2 | Minh Tran Tranhg | [List] 4/4 | 120          | 04/09/2019 17:04:24 | 2010            | 999,999,999 |
    And I select first "1" records in table
    And I select table service "Delete"
#    Then delete it
#  Scenario: Backup defs
#   Given I want to access the Matching record of table "Items"
#    And I select the expected source field "Indentifiers"

