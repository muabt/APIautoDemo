@SYSTEM_TEST
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
    And I create record in Matching table with the content followings
      | Data model:DDL         | Table:DDL           | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: Bulk_data | Person Relationship |              |                              |                  |                    |                       |
    And I select matching table record of table "Person Relationship" of "Publication: Bulk_data"
    And I should see Matching record detailed as following
      | Data model             | Table               | Active | Default matching process | Source field  | Event listener | Disable trigger |
      | Publication: Bulk_data | Person Relationship | Yes    | [not defined]            | [not defined] |                | No              |
    And I click button Save and close
    And I select first "1" records in table
    Then delete it

  Scenario: SC-CFT33 Validate tooltip of all fields in Matching table details
    And I permit to access matching table
    And I click to create a record button
    And I should see tooltip of all fields as following
      | Field                    | Tooltip                                                                                                                                                                                                                                                                      |
      | Data model               | The data model that contains the table to set under the Match and Merge configuration.                                                                                                                                                                                       |
      | Table                    | Name of table managed by the add-on.                                                                                                                                                                                                                                         |
      | Active                   | If 'Yes': The deduplication features are enabled for the selected table.If 'No': The deduplication features are not enabled.                                                                                                                                                 |
      | Default matching process | Define the default matching process that will be applied during automatic execution of the matching                                                                                                                                                                          |
      | Source field             | Field in the table that is used for getting the record source.This parameter is optional and is used when the record selection policy is 'most trusted source'.                                                                                                              |
      | Event listener           | Java implementation to listen to deduplication events.                                                                                                                                                                                                                       |
      | Disable trigger          | Disabling the trigger will block all automatic deduplication and merge actions.All features are still available but they should be used manually via the Stewardship Console or the API.If 'Yes': The trigger is inactive.If 'No': The trigger is active.Default value: 'No' |

  Scenario: SC-CFT42 Validate button Preview when there is a matching process which is selected in Default matching process attribute
    And I permit to access matching table
    When I select filter by simple search with criterion
      | Criterion  | Operation | Value                       | Field type |
      | Data model | equals    | Publication: Human_Resource | INPUT      |
      | Table      | equals    | Employee                    | INPUT      |
    And I select matching table record of table "Person Relationship" of "Publication: Human_Resource"
    And I click to preview button
    And I should see matching process record details as following
      | Matching process code | Active | Matching execution on creation | Matching execution on update | Merge policy  | Keep not matched records untouched | Merged record is recycled | Modify merged without match |
      | other functions       | Yes    | Inline matching                | Inline matching              | [not defined] | No                                 | No                        | No                          |

