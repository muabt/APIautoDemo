@SYSTEM_TEST
Feature: Matching process configuration
  I want to use this template for Matching process configuration

  Background:
    Given I login to EBX successfully

  Scenario: SC-CFMPS001->011 Validate fields when creating a new matching process
    And I permit to access matching table
    And I create record in Matching table with the content followings
      | Data model:DDL                                   | Table:DDL | Active:RADIO | Default matching process:DDL | Source field:DDL | Event listener:TXT | Disable trigger:RADIO |
      | Publication: Matching_Process_Configuration_Auto | AutoStore |              |                              |                  |                    |                       |
   # And I select matching table record of table "AutoStore" of "Publication: Matching_Process_Configuration_Auto"
    When I open matching process popup
    Then the default value of "input" field "Matching process code" should be ""
    And the default value of "radio" field "Active" should be "Yes"
    And the default value of "drop-down list" field "Matching execution on creation" should be "Manual"
    And the default value of "drop-down list" field "Matching execution on update" should be "Manual"
    And the default value of "drop-down list" field "Merge policy" should be "[not defined]"
    And the default value of "radio" field "Keep not matched records untouched" should be "No"
    And the default value of "radio" field "Merged record is recycled" should be "No"
    And the default value of "radio" field "Modify merged without match" should be "No"
    And the field "Matching process code" should be mandatory with message "Field 'Matching process code' is mandatory."

    And I should see tooltip of all fields as following
      | Field                              | Tooltip                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | Matching process code              | Identifier of the matching process.                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | Active                             | If set to:• 'Yes': This matching process is used.• 'No': This matching process is not used.This field indicates whether or not the matching process is used when running matches. To disable a matching process, set the Active field to 'No'.Only one matching process can be active at the same time for a given table, but if using the API, we can specify which one we want to apply.Default value: 'Yes'                                                                                                |
      | Matching execution on creation     | Define when the execution of matching should be done when a user is creating a record.- Manual: There is no automatic execution for record creation.- After submit: Once the record is created, the matching process will be executed. There is no mandatory validation from user if some duplicates has been found.- Inline matching: If one or more duplicates record are found during the creation, they will be displayed in the record form. The user must review the duplicate before submitting his creation. |
      | Matching execution on update       | Define when the execution of matching should be done when a user is updating a record.- Manual: There is no automatic execution for record update.- After submit: Once the record is updated, the matching process will be executed. There is no mandatory validation from user if some duplicates has been found.- Inline matching: If one or more duplicates record are found during the update, they will be displayed in the record form. The user must review the duplicate before submitting his creation.   |
      | Merge policy                       | Defines the merge policy to apply to merge duplicate records.                                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | Keep not matched records untouched | Determines whether records keep their current state after a matching operation produces no matches.If set to:• 'Yes': Records remain in their current state when no matches are found.• 'No' or not defined: Records that do not have any matches become Golden.Default value: 'No'                                                                                                                                                                                                                              |
      | Merged record is recycled          | This property enables, or disables automatic modification of merged records.If set to:• 'Yes': Modification of merged records is enabled.If 'No': Modification of merged records is disabled.Default value: 'No'                                                                                                                                                                                                                                                                                               |
      | Modify merged without match        | If set to:• 'Yes': A new match will not be triggered when modify a merged record.• 'No': When a merged record is modified with 'Merged record is recycled' activated, it will trigger a new match.Default value: 'No'|

    And the field "Matching process code" should have ability to trim space with data "  Hien"

  Scenario: SC-CFMPS001->011 Validate fields when creating a new matching process
    And I permit to access matching table
    And system save successfully when all inputs value meet condition after clicking Save button
    And system save successfully when all inputs value meet condition after clicking Save and Close button
    And system close popup create new matching field
