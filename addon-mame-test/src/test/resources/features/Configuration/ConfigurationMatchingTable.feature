Feature: Matching table configuration
  I want to use this template for Matching table configuration

  Background:
    Given I login to EBX successfully

  @Data-model-field
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

#  Scenario: SC-CFT06 Validate Combobox "Table" when Table is not defined
#    And I permit to access matching table
#    And I create record with the followings
#      | Data model:DDL | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
#      |                |           |              |                              |                  |                    |                       |
#    Then errors message are raised with the followings
#      | Field      | Message                          |
#      | Data model | Field 'Data model' is mandatory. |
#      | Table      | Field 'Table' is mandatory.      |
#    And block of error messages are displayed like below
#      | Block      | Message                          |
#      | Data model | Field 'Data model' is mandatory. |
#      | Table      | Field 'Table' is mandatory.      |