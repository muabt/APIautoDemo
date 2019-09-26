@SYSTEM
Feature: Matching table configuration
  I want to use this template for Matching table configuration

  Background:
    Given I login to EBX successfully

  Scenario: SC-CFT03 Validate Combobox "Data model" when Data model is not defined
    And I permit to access matching table
    And I create record with the followings
      | Data model:DDL | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      |                |           |              |                              |                  |                    |                       |
    Then errors message are raised with the followings
      | Field      | Message                          |
      | Data model | Field 'Data model' is mandatory. |
      | Table      | Field 'Table' is mandatory.      |
    And block of error messages are displayed like below
      | Block      | Message                          |
      | Data model | Field 'Data model' is mandatory. |
      | Table      | Field 'Table' is mandatory.      |

  Scenario: SC-CFT06 Validate Combobox "Table" when Table is not defined
    And I permit to access matching table
    And I create record with the followings
      | Data model:DDL     | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: Green |           |              |                              |                  |                    |                       |
    Then errors message are raised with the followings
      | Field | Message                     |
      | Table | Field 'Table' is mandatory. |
    And block of error messages are displayed like below
      | Block | Message                     |
      | Table | Field 'Table' is mandatory. |

  Scenario: SC-CFT09 Validate Combobox "Table" when Table has been defined already
    And I permit to access matching table
    And I create record with the followings
      | Data model:DDL     | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: Green | Brands    |              |                              |                  |                    |                       |
    Then errors message are raised with the followings
      | Field | Message                                                     |
      | Table | More than one table configuration is defined for this table |
    And block of error messages are displayed like below
      | Block | Message                                                     |
      | Table | More than one table configuration is defined for this table |

  Scenario: SC-CFT20 Validate Combobox "Table" when Table has been defined already
    And I permit to access matching table
#    And I create record with the followings
#      | Data model:DDL         | Table:DDL           | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
#      | Publication: Bulk_data | Person Relationship |              |                              |                  |                    |                       |
    When I select filter by simple search with criterion
      | Criterion  | Operation | Value                  | Field type |
      | Data model | equals    | Publication: Bulk_data | INPUT      |
      | Table      | equals    | Person Relationship    | INPUT      |
    And I select matching table record of table "Person Relationship"
    And I should see Matching record detailed as following
      | Data model             | Table               | Active | Advanced settings | Default matching process | Source field  | Event listener | Disable trigger |
      | Publication: Bulk_data | Person Relationship | true   |                   | [not defined]            | [not defined] |                | false           |
    And I select first "1" records in table
    Then delete it