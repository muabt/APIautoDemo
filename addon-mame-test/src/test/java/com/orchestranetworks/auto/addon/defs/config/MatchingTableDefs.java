package com.orchestranetworks.auto.addon.defs.config;

import com.orchestranetworks.auto.addon.steps.AdministrationSteps;
import com.orchestranetworks.auto.addon.steps.config.MatchingTableSteps;
import com.orchestranetworks.auto.addon.steps.DatasetSteps;
import com.orchestranetworks.auto.addon.utils.MAMEConstants;
import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.serenitybdd.core.Serenity;
import net.thucydides.core.annotations.Steps;

import java.util.List;
import java.util.Map;

public class MatchingTableDefs {
    @Steps
    MatchingTableSteps onMatchingTableSteps;
    @Steps
    DatasetSteps onDatasetSteps;
    @Steps
    AdministrationSteps onAdministrationSteps;

    /**
     * Verify the error message in fields
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">Then</font> errors message are raised with the followings
     * <ul>
     * <font color="green">| Field | Message|</font>
     * </ul>
     * <ul>
     * <font color="green">| Table | More than one table configuration is defined for this table</font>
     * </ul>

     * </ul>
     * </p>
     *
     * @param dt table information
     */
    @Then("^errors message are raised with the followings$")
    public void errors_message_are_raised_with_the_followings(DataTable dt) throws Throwable {
        List<Map<String, String>> list = dt.asMaps(String.class, String.class);

        for (int i = 0; i < list.size(); i++) {
            Map<String, String> row = list.get(i);
            String field = row.get("Field");
            String message = row.get("Message");

            if (field.equals("Data model")) {
                onMatchingTableSteps.verify_error_message_data_model_field(message);
            }
            if (field.equals("Table")) {
                onMatchingTableSteps.verify_error_message_table_field(message);
            }
        }
    }

    /**
     * Verify the error message in block
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">And</font> block of error messages are displayed like below
     * <ul>
     * <font color="green">| Block | Message                     |</font>
     * </ul>
     * <ul>
     * <font color="green">| Table | Field 'Table' is mandatory. |</font>
     * </ul>

     * </ul>
     * </p>
     *
     * @param dt table information
     */
    @And("^block of error messages are displayed like below$")
    public void block_of_error_messages_are_displayed_like_below(DataTable dt) throws Throwable {
        onMatchingTableSteps.click_btn_expand();
        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (int i = 0; i < list.size(); i++) {
            Map<String, String> row = list.get(i);
            String field = row.get("Block");
            String message = row.get("Message");

            if (field.equals("Data model")) {
                onMatchingTableSteps.verify_error_message_data_model_in_block(message);
            }
            if (field.equals("Table")) {
                onMatchingTableSteps.verify_error_message_table_in_block(message);
            }
        }
    }

    /**
     * Verify the Matching record detailed
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">And</font> I should see Matching record detailed as following
     * <ul>
     * <font color="green">| Data model             | Table               | Active | Default matching process | Source field  | Event listener | Disable trigger |</font>
     * </ul>
     * <ul>
     * <font color="green">| Publication: Bulk_data | Person Relationship | Yes    | [not defined]            | [not defined] |                | No              |</font>
     * </ul>

     * </ul>
     * </p>
     *
     * @param recordDetail table information
     */
    @And("^I should see Matching record detailed as following$")
    public void i_should_see_matching_record_detailed_as_following(List<List<String>> recordDetail) {
        onMatchingTableSteps.click_btn_expand();
        onMatchingTableSteps.verify_record_detail(recordDetail);
    }

    /**
     * Click to create a record button
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">And</font> I click to create a record button
     * </ul>
     * </p>
     *
     */
    @And("^I click to create a record button$")
    public void i_click_to_create_a_record_button() {
        onDatasetSteps.click_btn_create_record();
    }

    /**
     * Verify tooltips
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">And</font> I should see tooltip of all fields as following
     * </ul>
     * </p>
     *
     */
    @And("^I should see tooltip of all fields as following$")
    public void i_should_see_tooltip_of_all_fields_as_following(DataTable dt) throws Throwable {
        onMatchingTableSteps.click_btn_expand();
        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (Map<String, String> row : list) {
            String field = row.get("Field");
            String tooltip = row.get("Tooltip");

            onMatchingTableSteps.verify_tooltip_of_field(field, tooltip);
        }

    }

    /**
     * Click to create a preview button
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">And</font> I click to preview button
     * </ul>
     * </p>
     *
     */
    @And("^I click to preview button$")
    public void i_click_to_preview_button() throws Throwable {
        onMatchingTableSteps.click_btn_preview();
    }

    /**
     * Click to create a preview button
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">And</font> I should see matching process record details as following
     * </ul>
     * </p>
     *
     */
    @And("^I should see matching process record details as following$")
    public void i_should_see_matching_process_record_details_as_following(List<List<String>> recordDetail) {
        onMatchingTableSteps.verify_matching_process_detail(recordDetail);
    }

    /**
     * Select matching table configuration record
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">Given</font> I select matching table record of table "<font color="green">Person</font>"
     * </ul>
     * </p>
     *
     */
    @Given("^I select matching table record of table \"([^\"]*)\"$")
    public void i_select_matching_table_record_of_table(String label) {
        onAdministrationSteps.select_record_with_name(label);
    }

    /**
     * Select matching record configuration of given table
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">Given</font> I select matching table record of table "<font color="green">Person</font>"
     * </ul>
     * </p>
     *
     */
    @Given("^I want to access the Matching record of table \"([^\"]*)\"$")
    public void i_want_to_access_the_matching_record_of_table(String tblName) {
        onAdministrationSteps.access_matching_table();
        onAdministrationSteps.select_record_with_name(tblName);
    }

    /**
     * Create a Matching process configuration
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">And</font> the matching process is configured as the followings
     * <ul>
     * <font color="green">| Matching process code | Matching table | Active | Matching execution on creation | Matching execution on update | Merge policy | Advanced settings |</font>
     * </ul>
     * <ul>
     * <font color="green">| RANDOM                |                | Yes    | Inline matching                | Inline matching              |              |                   |</font>
     * </ul>
     * </ul>
     * </p>
     *
     * @param dt table information
     */
    @And("^the matching process is configured as the followings$")
    public void the_matching_process_is_configured_as_the_followings(DataTable dt) {
        onMatchingTableSteps.select_matching_process_tab();

        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (Map<String, String> row : list) {
            String matchingProcessCode = row.get(MAMEConstants.MATCHING_PROCESS_CODE);
            String active = row.get(MAMEConstants.ACTIVE);
            String matchingExecutionOnCreation = row.get(MAMEConstants.MATCHING_EXECUTION_ON_CREATION);
            String matchingExecutionOnUpdate = row.get(MAMEConstants.MATCHING_EXECUTION_ON_UPDATE);
            String mergePolicy = row.get(MAMEConstants.MERGE_POLICY_TAB);
            String keepNotMatchedRecordsUntouched = row.get(MAMEConstants.KEEP_NOT_MATCH);
            String mergedRecordIsRecycled = row.get(MAMEConstants.RECORD_RECYCLED);
            String modifyMergedWithoutMatch = row.get(MAMEConstants.MODIFY_MERGE);

            if (!matchingProcessCode.isEmpty()) {
                if (onMatchingTableSteps.verify_code_existed(matchingProcessCode)) {
                    onMatchingTableSteps.select_record_with_label(matchingProcessCode);
                    onMatchingTableSteps.click_btn_expand();
                } else {
                    onMatchingTableSteps.select_btn_create_record(1);
                    onMatchingTableSteps.click_btn_expand();
                    onMatchingTableSteps.input_matching_process_code(matchingProcessCode);
                }
            }

            if (!active.isEmpty()) {
                onMatchingTableSteps.selectActive(active);
            }

            if (!matchingExecutionOnCreation.isEmpty()) {
                onMatchingTableSteps.select_matching_execution_on_creation(matchingExecutionOnCreation);
            }

            if (!matchingExecutionOnUpdate.isEmpty()) {
                onMatchingTableSteps.select_matching_excution_on_update(matchingExecutionOnUpdate);
            }

            if (!mergePolicy.isEmpty()) {
                onMatchingTableSteps.select_merge_policy(mergePolicy);
            }

            if (!keepNotMatchedRecordsUntouched.isEmpty()) {
                onMatchingTableSteps.select_keep_not_matched_records_untouched(keepNotMatchedRecordsUntouched);
            }

            if (!mergedRecordIsRecycled.isEmpty()) {
                onMatchingTableSteps.select_merged_record_is_recycled(mergedRecordIsRecycled);
            }

            if (!modifyMergedWithoutMatch.isEmpty()) {
                onMatchingTableSteps.select_modify_merged_without_match(modifyMergedWithoutMatch);
            }
        }
        onMatchingTableSteps.click_btn_save_and_close_internal_popup(1);
    }

    /**
     * Create a Merge policy configuration
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">When</font> I set Merge policy configuration as belows
     * <ul>
     * <font color="green">| Merge policy code | Survivor record selection mode | Default merge function | Mode | Used for manual merge | Apply permission on merge view |</font>
     * </ul>
     * <ul>
     * <font color="green">| RANDOM            | Was golden                     |                        |      | Yes                   | No                             |</font>
     * </ul>
     * </ul>
     * </p>
     *
     * @param dt table information
     */
    @When("^I set Merge policy configuration as belows$")
    public void i_set_merge_policy_configuration_as_belows(DataTable dt) {

        onMatchingTableSteps.select_merge_policy_tab();

        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (Map<String, String> row : list) {
            String mergePolicyCode = row.get(MAMEConstants.MERGE_POLICY_CODE_FIELD);
            String selectionMode = row.get(MAMEConstants.SURVIVOR_RECORD_SELECTION_MODE);
            String defaultFunction = row.get(MAMEConstants.DEFAULT_MERGE_FUNCTION);
            String useManualMerge = row.get(MAMEConstants.USE_MANUAL_MERGE);
            String mode = row.get(MAMEConstants.MODE);
            String applyPermission = row.get(MAMEConstants.APPLY_PERMISSION_ON_MERGE_VIEW);

            if (!mergePolicyCode.isEmpty()) {
                if (onMatchingTableSteps.verify_code_existed(mergePolicyCode)) {
                    onMatchingTableSteps.select_record_with_label(mergePolicyCode);
                } else {
                    onMatchingTableSteps.select_btn_create_record(2);
                    onMatchingTableSteps.input_merge_policy_code(mergePolicyCode);
                }
            }

            if (!selectionMode.isEmpty()) {
                onMatchingTableSteps.select_survivor_record(selectionMode);
            }

            if (!defaultFunction.isEmpty()) {
                onMatchingTableSteps.select_default_merge_function(defaultFunction);
            } else {
                onMatchingTableSteps.clear_default_merge_function();
            }

            if (!useManualMerge.isEmpty()) {
                onMatchingTableSteps.use_for_merge_function(useManualMerge);
            }

            if (!mode.isEmpty()) {
                onMatchingTableSteps.select_auto_create_new_golden_mode(mode);
            }

            if (!applyPermission.isEmpty()) {
                onMatchingTableSteps.apply_permission_on_merge_view(applyPermission);
            }
        }
        onMatchingTableSteps.click_btn_save_and_close_internal_popup(1);
    }


    /**
     * Create a Survivorship fields
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">And</font> I create Survivorship field with selections as followings
     * <ul>
     * <font color="green">| Survivorship field code | Field | Merge function      | Condition for field value survivorship | Execute only if empty |</font>
     * </ul>
     * <ul>
     * <font color="green">| RANDOM                  | Name  | Most trusted source |                                        | Yes                   |</font>
     * </ul>
     * </ul>
     * </p>
     *
     * @param dt table information
     */
    @And("^I create Survivorship field with selections as followings$")
    public void i_create_survivorship_field_with_selections_as_followings(DataTable dt) throws Exception {
        onMatchingTableSteps.select_merge_policy_record(Serenity.sessionVariableCalled(MAMEConstants.MERGE_POLICY_CODE));
        onMatchingTableSteps.select_survivor_field_tab();

        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (Map<String, String> row : list) {
            String survivorCode = row.get(MAMEConstants.SURVIVORSHIP_FIELD_CODE);
            String field = row.get(MAMEConstants.FIELD);
            String mergeFunction = row.get(MAMEConstants.MERGE_FUNCTION);
            String condition = row.get(MAMEConstants.CONDITION_FOR_FIELD);
            String executeEmpty = row.get(MAMEConstants.EXECUTE_EMPTY);

            if (!survivorCode.isEmpty()) {
                if (onMatchingTableSteps.verify_code_existed(survivorCode)) {
                    onMatchingTableSteps.select_record_with_label(survivorCode);
                } else {
                    onMatchingTableSteps.select_btn_create_record(1);
                    onMatchingTableSteps.input_survivor_code(survivorCode);
                }
            }

            if (!field.isEmpty()) {
                onMatchingTableSteps.select_field_survivor(field);
            }

            if (!mergeFunction.isEmpty()) {
                onMatchingTableSteps.select_merge_function_for_field(mergeFunction);
            }

            if (!condition.isEmpty()) {
                onMatchingTableSteps.input_condition(condition);
            }

            if (!executeEmpty.isEmpty()) {
                onMatchingTableSteps.select_execute_option(executeEmpty);
            }
        }

        onMatchingTableSteps.click_btn_save_and_close_internal_popup(2);
        onMatchingTableSteps.click_btn_save_and_close();
    }

    /**
     * Update the matching process configuration
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">And</font> the matching process is updated as the followings
     * <ul>
     * <font color="green">| Matching process code | Active | Matching execution on creation | Matching execution on update | Merge policy | Keep not matched records untouched | Merged record is recycled | Modify merged without match |</font>
     * </ul>
     * <ul>
     * <font color="green">| MPC1                  | Yes    | Inline matching                | Inline matching              |              | Yes                                | Yes                       | Yes                         |</font>
     * </ul>
     * </ul>
     * </p>
     * @param dt
     */
    @And("^the matching process is updated as the followings$")
    public void the_matching_process_is_updated_as_the_followings(DataTable dt) {
        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (Map<String, String> row : list) {
            //String matchingProcessCode = row.get(MAMEConstants.MATCHING_PROCESS_CODE);
            String active = row.get(MAMEConstants.ACTIVE);
            String matchingExecutionOnCreation = row.get(MAMEConstants.MATCHING_EXECUTION_ON_CREATION);
            String matchingExecutionOnUpdate = row.get(MAMEConstants.MATCHING_EXECUTION_ON_UPDATE);
            String mergePolicy = row.get(MAMEConstants.MERGE_POLICY_TAB);
            String keepNotMatchedRecordsUntouched = row.get(MAMEConstants.KEEP_NOT_MATCH);
            String mergedRecordIsRecycled = row.get(MAMEConstants.RECORD_RECYCLED);
            String modifyMergedWithoutMatch = row.get(MAMEConstants.MODIFY_MERGE);

            if (!active.isEmpty()) {
                onMatchingTableSteps.selectActive(active);
            }

            if (!matchingExecutionOnCreation.isEmpty()) {
                onMatchingTableSteps.select_matching_execution_on_creation(matchingExecutionOnCreation);
            }

            if (!matchingExecutionOnUpdate.isEmpty()) {
                onMatchingTableSteps.select_matching_excution_on_update(matchingExecutionOnUpdate);
            }

            if (!mergePolicy.isEmpty()) {
                onMatchingTableSteps.select_merge_policy(mergePolicy);
            }

            if (!keepNotMatchedRecordsUntouched.isEmpty()) {
                onMatchingTableSteps.select_keep_not_matched_records_untouched(keepNotMatchedRecordsUntouched);
            }

            if (!mergedRecordIsRecycled.isEmpty()) {
                onMatchingTableSteps.select_merged_record_is_recycled(mergedRecordIsRecycled);
            }

            if (!modifyMergedWithoutMatch.isEmpty()) {
                onMatchingTableSteps.select_modify_merged_without_match(modifyMergedWithoutMatch);
            }

        }
        onMatchingTableSteps.click_btn_save_and_close_internal_popup(1);
    }

    /**
     * Update the matching fields configuration
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">And</font> the matching field is updated as the followings
     * <ul>
     * <font color="green">| Field | Both values are null | One of the values is null |</font>
     * </ul>
     * <ul>
     * <font color="green">|       | Won't match          | Won't match               |</font>
     * </ul>
     * </ul>
     * </p>
     * @param dt
     */
    @And("^the matching field is updated as the followings$")
    public void the_matching_field_is_updated_as_the_followings(DataTable dt) {
        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (Map<String, String> row : list) {
            String field = row.get(MAMEConstants.FIELD);
            String bothValuesAreNull = row.get(MAMEConstants.BOTH_VALUE_ARE_NULL);
            String oneOfTheValuesIsNull = row.get(MAMEConstants.ONE_VALUE_NULL);

            if (!bothValuesAreNull.isEmpty()) {
                onMatchingTableSteps.select_both_values_are_null(bothValuesAreNull);
            }

            if (!oneOfTheValuesIsNull.isEmpty()) {
                onMatchingTableSteps.select_one_of_the_values_is_null(oneOfTheValuesIsNull);
            }
        }
        onMatchingTableSteps.click_btn_save_and_close_internal_popup(1);
    }



    @When("^I delete some MAME config records with primary key as following$")
    public void i_delete_some_records_with_primary_key_as_following(List<List<String>> dt) {
        onAdministrationSteps.access_matching_table();
        for (int i = 1; i < dt.size(); i++) {
            String[] col = dt.get(i).toArray(new String[0]);
            onMatchingTableSteps.select_record_with_pk(col);
            //  onDatasetSteps.select_record_with_PK(col);
        }
        onDatasetSteps.select_table_service("Delete");
        onDatasetSteps.confirmPopupOK();
    }

}


