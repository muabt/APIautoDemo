package com.orchestranetworks.auto.addon.defs.config;

import com.orchestranetworks.auto.addon.steps.AdministrationSteps;
import com.orchestranetworks.auto.addon.steps.CommonSteps;
import com.orchestranetworks.auto.addon.steps.config.MatchingTableSteps;
import com.orchestranetworks.auto.addon.steps.DatasetSteps;
import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.utils.MAMEConstants;
import com.orchestranetworks.auto.addon.utils.TechnicalTable;
import cucumber.api.DataTable;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.serenitybdd.core.Serenity;
import net.thucydides.core.annotations.Steps;

import java.util.*;

public class MatchingTableDefs {
    @Steps
    MatchingTableSteps onMatchingTableSteps;
    @Steps
    DatasetSteps onDatasetSteps;
    @Steps
    AdministrationSteps onAdministrationSteps;
    @Steps
    CommonSteps onCommonSteps;

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
     *
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
     *
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
     *
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
     */
    @And("^I should see tooltip of all fields as following$")
    public void i_should_see_tooltip_of_all_fields_as_following(DataTable dt) throws Throwable {
//        onMatchingTableSteps.click_btn_expand();
        onMatchingTableSteps.expand_all_field_group();
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
     */

    @And("^I select matching table record of table \"([^\"]*)\" of \"([^\"]*)\"$")
    public void i_select_matching_table_record_of_publication(String table, String publication) {
        onCommonSteps.refreshSearch();
        List<String> values = new ArrayList<String>(Arrays.asList(table, publication));
        List<Map<String, String>> filterConditions = new ArrayList<Map<String, String>>();
        Map<String, String> condition = null;
        String[] fields = {MAMEConstants.TABLE_FIELD, MAMEConstants.DATA_MODEL_FIELD};
        for (int i = 0; i < fields.length; i++) {
            condition = new HashMap<String, String>();
            condition.put(Constants.CRITERION, fields[i]);
            condition.put(Constants.OPERATION, "equals");
            condition.put(Constants.VALUE, values.get(i));
            condition.put(Constants.FIELD_TYPE, Constants.INPUT_TYPE);
            filterConditions.add(condition);
        }
        onCommonSteps.search_with_advance_search(Constants.ALL_CRITERIA_MATCH, filterConditions);
        onAdministrationSteps.select_record_with_name(table);
    }

    /**
     * Select matching record configuration of given table
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">Given</font> I select matching table record of table "<font color="green">Person</font>"
     * </ul>
     * </p>
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
    public void i_create_survivorship_field_with_selections_as_followings(DataTable dt) {
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
            onMatchingTableSteps.click_btn_save_and_close_internal_popup(1);
        }


        onMatchingTableSteps.click_btn_save_and_close();
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
     *
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
     *
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

    /**
     * Create record with given information and PK
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">And</font> I create record with PK "TXT" and the content followings
     *      <ul>
     * 			     <font color="green">| Identifer:TXT | Civil status:DDL | First name:TXT | Last name:TXT | Maiden name:TXT | Birth date:DATE | Gender:RADIO | Marital status:DDL | GDPR type:DDL |</font>
     *     </ul>
     *     <ul>
     * 			     <font color="green">|               | Dr.              | Jenifer        | Pham          |                 | 7/29/1988       | Female       | (C) Single         | Child         |</font>
     *     </ul>
     * </ul>
     * </p>
     *
     * @param dt information of the record
     */
    @And("^I create record in Matching table with the content followings$")
    public void i_create_record_in_matching_table_with_the_content_followings(DataTable dt) {
        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        Map<String, String> row = list.get(0);
        String dataModel = row.get("Data model:DDL");
        String table = row.get("Table:DDL");

        List<Map<String, String>> filterConditions = new ArrayList<Map<String, String>>();
        Map<String, String> condition = new HashMap<String, String>();
        condition.put(Constants.CRITERION, "Data model");
        condition.put(Constants.OPERATION, "equals");
        condition.put(Constants.VALUE, dataModel);
        condition.put(Constants.FIELD_TYPE, Constants.INPUT_TYPE);
        filterConditions.add(condition);
        condition = new HashMap<String, String>();
        condition.put(Constants.CRITERION, "Table");
        condition.put(Constants.OPERATION, "equals");
        condition.put(Constants.VALUE, table);
        condition.put(Constants.FIELD_TYPE, Constants.INPUT_TYPE);
        filterConditions.add(condition);
        onCommonSteps.search_with_advance_search(Constants.ALL_CRITERIA_MATCH, filterConditions);

//        onCommonSteps.click_btn_filter();
//        filter_record_existed(dataModel, Constants.INPUT_TYPE, table, new String[]{Constants.DATA_MODEL_FIELD, Constants.TABLE_FIELD}, dt);
        if (onDatasetSteps.verify_record_existed(dataModel, table)) {
            onDatasetSteps.select_first_record("1");
            onDatasetSteps.select_table_service(Constants.DELETE_SERVICE);
            onCommonSteps.confirm_popup_OK();
            create_record_with_content(dt);
        } else {
            create_record_with_content(dt);
        }
    }

    /**
     * This method will filter the expected record with advance search
     */
    private void filter_record_existed(String fieldName, String searchType, String keyword, String[] fields, DataTable dt) {
        String[] field = fields;
        for (int i = 0; i < field.length; i++) {
            onCommonSteps.select_criteria_with_label(field[i]);
            if (i == 0) {
                onCommonSteps.input_search_value(fieldName, searchType, field[0]);
            } else {
                onCommonSteps.input_search_value(keyword, searchType, field[1]);
            }
        }
        onCommonSteps.click_btn_apply_advanced_search();
    }

    private void create_record_with_content(DataTable dt) {
        onDatasetSteps.click_btn_create_record();
        List<List<String>> dataTable = dt.asLists(String.class);
        List<String> header = dataTable.get(0);
        // Get header then split to 2 element of array
        for (int i = 0; i < header.size(); i++) {
            String[] tmp = header.get(i).split(":");
            // Get row of data table
            for (int j = 1; j < dataTable.size(); j++) {
                List<String> row = dataTable.get(j);
                String col = tmp[0];
                String dataType = tmp[1].trim();
                String cell = row.get(i).trim();
                if (!cell.isEmpty()) {
                    onDatasetSteps.input_record_field(col, cell, dataType);
                }
            }
        }
        onCommonSteps.click_btn_save();
    }

    @When("^I open matching process popup$")
    public void i_open_matching_process_popup() {
        onMatchingTableSteps.select_matching_process_tab();
        onMatchingTableSteps.select_btn_create_record(1);
    }

    /*@And("^the field \"([^\"]*)\" should be mandatory$")
    public void the_field_should_mandatory(String arg0) {
        onCommonSteps.click_btn_save();
    }*/
    @When("^I input field \"([^\"]*)\" with value \"([^\"]*)\"$")
    @And("^the field \"([^\"]*)\" should have ability to trim space with data \"([^\"]*)\"$")
    public void the_field_should_have_ability_to_trim_space_with_data(String fieldName, String value) {
        onMatchingTableSteps.input_matching_process_code(value);
        onCommonSteps.click_btn_save();
        onMatchingTableSteps.verify_field_trimspace(fieldName, value.trim());
    }

    @And("^the field \"([^\"]*)\" is able to have \"([^\"]*)\" value$")
    public void the_field_is_able_to_have_value(String arg0, String arg1) {

    }

    @And("^the field \"([^\"]*)\" should be mandatory with message \"([^\"]*)\"$")
    public void the_Field_Should_Be_Mandatory_With_Message(String fieldName, String msg) throws Throwable {
        onCommonSteps.click_btn_save();
        onMatchingTableSteps.verify_validation_message(fieldName, msg);
    }


    @Then("^the default value of \"([^\"]*)\" field \"([^\"]*)\" should be \"([^\"]*)\"$")
    public void the_Default_Value_Of_Field_Should_Be(String fieldType, String fieldName, String defaultValue) throws Throwable {
        onMatchingTableSteps.verify_default_value(fieldType, fieldName, defaultValue);
    }

    public void iInputFieldWithValue(String arg0, String arg1) throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        throw new PendingException();
    }

    @When("^I select matching process tab$")
    public void i_Select_Matching_Process_Tab() {
        onMatchingTableSteps.select_matching_process_tab();
    }

    @And("^the field \"([^\"]*)\" should be unique with message \"([^\"]*)\"$")
    public void the_Field_Should_Be_Unique_With_Message(String fieldName, String msg) throws Throwable {
        onMatchingTableSteps.verify_validation_message(fieldName, msg);
    }

    @And("^I should edit Matching process record detailed as following$")
    public void i_should_edit_matching_process_record_detailed_as_following(String fieldName, String value) {
        onMatchingTableSteps.click_btn_expand();
        onMatchingTableSteps.input_matching_process_code(value);

    }

    @When("^I open matching field screen$")
    public void i_Open_Matching_Field_Screen() {
        onMatchingTableSteps.select_matching_fields_tab();
        onMatchingTableSteps.click_btn_create_matching_field();
        onMatchingTableSteps.expand_all_field_group();
    }

    @And("^I create matching process with Matching process code is \"([^\"]*)\"$")
    public void i_Create_Matching_Process_With_Matching_Process_Code_Is(String value) {
        onMatchingTableSteps.input_matching_process_code(value);
        onCommonSteps.click_btn_save_and_close();
    }

    @And("^all merge policy should be deleted$")
    public void all_merge_policy_should_be_deleted() {
        onMatchingTableSteps.select_merge_policy_tab();
        onDatasetSteps.delete_all_record_in_displayed_table();

    }

    @And("^relation management should be defined as following$")
    public void relation_management_should_be_defined(DataTable dt) {

        onMatchingTableSteps.select_merge_policy_record(Serenity.sessionVariableCalled(MAMEConstants.MERGE_POLICY_CODE));
        onMatchingTableSteps.select_relation_tab();

        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (Map<String, String> row : list) {
            String relationPath = row.get(MAMEConstants.MatchingTable.Relations.RELATION_PATH);
            String relationName = row.get(MAMEConstants.MatchingTable.Relations.RELATION_NAME);
            String relationManagement = row.get(MAMEConstants.MatchingTable.Relations.RELATION_MANAGEMENT);
            onMatchingTableSteps.open_relation_record(relationPath,relationName);
            onMatchingTableSteps.select_relation_management(relationManagement);
            onMatchingTableSteps.click_btn_save_and_close();

        }
        onMatchingTableSteps.click_btn_save_and_close();
    }
}