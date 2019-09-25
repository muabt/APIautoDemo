package com.orchestranetworks.auto.addon.defs;

import com.google.gson.JsonArray;
import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.steps.CommonSteps;
import com.orchestranetworks.auto.addon.steps.DatasetSteps;
import com.orchestranetworks.auto.addon.steps.AdministrationSteps;
import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.orchestranetworks.auto.addon.steps.ManualMergeSteps;
import com.orchestranetworks.auto.addon.utils.DateTimeUtils;
import com.orchestranetworks.auto.addon.utils.MAMEConstants;
import com.orchestranetworks.auto.addon.utils.TechnicalTable;
import cucumber.api.DataTable;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.serenitybdd.core.Serenity;
import net.thucydides.core.annotations.Steps;

public class ManualMergeDefs {
    @Steps
    ManualMergeSteps onManualMergeSteps;
    @Steps
    DatasetSteps onDatasetSteps;
    @Steps
    AdministrationSteps onAdministrationSteps;
    @Steps
    CommonSteps onCommonSteps;

    @Then("^record view table will be displayed and highlighted as below$")
    public void user_will_see_the_data_as_below(List<List<String>> tableMerge) {
        onManualMergeSteps.verify_record_view_table(tableMerge);
    }
//
//	@Then("^the table will be showed as below$")
//    public void the_table_will_be_showed_as_below(List<List<String>> tableMerge) {
//		onManualMergeSteps.verify_record_view_table(tableMerge);
//    }

    @And("^preview table is displayed as below$")
    public void table_is_highlighted_and_display_on_preview_table_as_below(List<List<String>> tablePreview) {
        onManualMergeSteps.verify_table_preview(tablePreview);
    }

    /*
     * @And("^the screen displays buttons as below$") public void
     * the_screen_displays_buttons_as_below() {
     *
     * }
     */
    @When("^I complete merging process$")
    public void i_complete_merging_process() {
        onManualMergeSteps.click_button_next();
        onManualMergeSteps.click_button_merge();

    }

    @Then("^I will see table RecordMetadata as below$")
    public void i_will_see_table_recordmetadata_as_below(DataTable recordMetadataExpect) {
        List<Map<String, String>> list = recordMetadataExpect.asMaps(String.class, String.class);
        onDatasetSteps.getDefaultViewTable(MAMEConstants.RECORD_METADATA_TBL);

        String colRecordID = TechnicalTable.RecordMetadata.ID;
        String colGroupID = TechnicalTable.RecordMetadata.GROUP_ID;
        String colState = TechnicalTable.RecordMetadata.STATE;
        String colAutoCreated = TechnicalTable.RecordMetadata.AUTO_CREATED;
        String colFunctionalID = TechnicalTable.RecordMetadata.FUNCTIONAL_ID;

        String actualValue = "";
        for (int i = 0; i < list.size(); i++) {
            Map<String, String> row = list.get(i);
            String recordID = row.get(colRecordID);
            String groupID = row.get(colGroupID);
            String state = row.get(colState);
            String autoCreated = row.get(colAutoCreated);
            String functionalID = row.get(colFunctionalID);

            if (!recordID.isEmpty()) {

            }

            if (!groupID.isEmpty()) {
                onManualMergeSteps.verify_group_id(i);
            }

            if (!state.isEmpty()) {
                actualValue = SessionData.getJsonTableValue(MAMEConstants.RECORD_METADATA_TBL,i,colState);
                assertThat(actualValue).isEqualTo(state);
            }

            if (!autoCreated.isEmpty()) {
                actualValue = SessionData.getJsonTableValue(MAMEConstants.RECORD_METADATA_TBL,i,colAutoCreated);
                assertThat(actualValue).isEqualTo(autoCreated);
            }

            if (!functionalID.isEmpty()) {
                actualValue = SessionData.getJsonTableValue(MAMEConstants.RECORD_METADATA_TBL,i,colFunctionalID);
                assertThat(actualValue).isEqualTo(functionalID);
            }

        }

    }


    @Given("^I select matching policy record of table \"([^\"]*)\"$")
    public void i_select_matching_policy_record_of_table(String label) {
        onAdministrationSteps.select_record_with_name(label);
    }

    @Given("^I want to access the Matching record of table \"([^\"]*)\"$")
    public void i_want_to_access_the_matching_record_of_table(String tblName) {
        onAdministrationSteps.access_matching_table();
        onAdministrationSteps.select_record_with_name(tblName);
    }

    @And("^I select the expected source field \"([^\"]*)\"$")
    public void i_select_the_expected_source_field(String fieldName) {

    }

    @And("^the matching process is configured as the followings$")
    public void the_matching_process_is_configured_as_the_followings(DataTable dt) {
        onManualMergeSteps.select_matching_process_tab();

        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (Map<String, String> row : list) {
            String matchingProcessCode = row.get("Matching process code");
            String active = row.get("Active");
            String matchingExecutionOnCreation = row.get("Matching execution on creation");
            String matchingExecutionOnUpdate = row.get("Matching execution on update");
            String mergePolicy = row.get("Merge policy");
            String advancedSettings = row.get("Advanced settings");

            if (!matchingProcessCode.isEmpty()) {
                if (onManualMergeSteps.verify_code_existed(matchingProcessCode)) {
                    onManualMergeSteps.select_record_with_label(matchingProcessCode);
                } else {
                    onManualMergeSteps.select_btn_create_record(1);
                    onManualMergeSteps.input_matching_process_code(matchingProcessCode);
                }
            }

            if (!active.isEmpty()) {
                onManualMergeSteps.selectActive(active);
            }

            if (!matchingExecutionOnCreation.isEmpty()) {
                onManualMergeSteps.select_matching_execution_on_creation(matchingExecutionOnCreation);
            }

            if (!matchingExecutionOnUpdate.isEmpty()) {
                onManualMergeSteps.select_matching_excution_on_update(matchingExecutionOnUpdate);
            }

            if (!mergePolicy.isEmpty()) {
                onManualMergeSteps.select_merge_policy(mergePolicy);
            }

        }
        onManualMergeSteps.click_btn_save_and_close_internal_popup(1);
    }

    @When("^I set Merge policy configuration as belows$")
    public void i_set_merge_policy_configuration_as_belows(DataTable dt) {

        onManualMergeSteps.select_merge_policy_tab();

        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (Map<String, String> row : list) {
            String mergePolicyCode = row.get("Merge policy code");
            String selectionMode = row.get("Survivor record selection mode");
            String defaultFunction = row.get("Default merge function");
            String useManualMerge = row.get("Used for manual merge");
            String mode = row.get("Mode");
            String applyPermission = row.get("Apply permission on merge view");

            if (!mergePolicyCode.isEmpty()) {
                if (onManualMergeSteps.verify_code_existed(mergePolicyCode)) {
                    onManualMergeSteps.select_record_with_label(mergePolicyCode);
                } else {
                    onManualMergeSteps.select_btn_create_record(2);
                    onManualMergeSteps.input_merge_policy_code(mergePolicyCode);
                }
            }

            if (!selectionMode.isEmpty()) {
                onManualMergeSteps.select_survivor_record(selectionMode);
            }

            if (!defaultFunction.isEmpty()) {
                onManualMergeSteps.select_default_merge_function(defaultFunction);
            }

            if (!useManualMerge.isEmpty()) {
                onManualMergeSteps.use_for_merge_function(useManualMerge);
            }

            if (!mode.isEmpty()) {
                onManualMergeSteps.select_auto_create_new_golden_mode(mode);
            }

            if (!applyPermission.isEmpty()) {
                onManualMergeSteps.apply_permission_on_merge_view(applyPermission);
            }
        }
        onManualMergeSteps.click_btn_save_and_close_internal_popup(1);
    }

    @And("^I create Survivorship field with selections as followings$")
    public void i_create_survivorship_field_with_selections_as_followings(DataTable dt) throws Exception {
        onManualMergeSteps.select_merge_policy_record(Serenity.sessionVariableCalled(MAMEConstants.MERGE_POLICY_CODE));
        onManualMergeSteps.select_survivor_field_tab();

        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (Map<String, String> row : list) {
            String survivorCode = row.get("Survivorship field code");
            String field = row.get("Field");
            String mergeFunction = row.get("Merge function");
            String condition = row.get("Condition for field value survivorship");
            String executeEmpty = row.get("Execute only if empty");

            if (!survivorCode.isEmpty()) {
                if (onManualMergeSteps.verify_code_existed(survivorCode)) {
                    onManualMergeSteps.select_record_with_label(survivorCode);
                } else {
                    onManualMergeSteps.select_btn_create_record(1);
                    onManualMergeSteps.input_survivor_code(survivorCode);
                }
            }

            if (!field.isEmpty()) {
                onManualMergeSteps.select_field_survivor(field);
            }

            if (!mergeFunction.isEmpty()) {
                onManualMergeSteps.select_merge_function_for_field(mergeFunction);
            }

            if (!condition.isEmpty()) {
                onManualMergeSteps.input_condition(condition);
            }

            if (!executeEmpty.isEmpty()) {
                onManualMergeSteps.select_execute_option(executeEmpty);
            }
        }

        onManualMergeSteps.click_btn_save_and_close_internal_popup(2);
        onManualMergeSteps.click_btn_save_and_close();
    }

    @And("^the Source in Trusted source are$")
    public void the_source_in_trusted_source_are(DataTable dt) {
        onAdministrationSteps.access_source_table();
        onAdministrationSteps.click_create_record();

        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (Map<String, String> row : list) {
            String nameOfSource = row.get("Name of source");
            String description = row.get("Description");

            if (!nameOfSource.isEmpty()) {
                onManualMergeSteps.input_name_of_source(nameOfSource);
            }

            if (!description.isEmpty()) {
                onManualMergeSteps.input_description(description);
            }
        }
        onManualMergeSteps.click_btn_save_and_close();
    }

    @And("^the Table trusted source with the followings$")
    public void the_table_trusted_source_with_the_followings(DataTable dt) {
        onAdministrationSteps.access_table_trusted_source();
        onAdministrationSteps.click_create_record();

        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (Map<String, String> row : list) {
            String matchingTable = row.get("Matching table");
            String trustedSourceList = row.get("Trusted source list");

            if (!matchingTable.isEmpty()) {
                onManualMergeSteps.select_matching_table(matchingTable);
            }

            if (!trustedSourceList.isEmpty()) {
                onManualMergeSteps.add_trusted_source_list(trustedSourceList);
            }
        }
        onManualMergeSteps.click_btn_save_and_close();
    }

    @And("^the Field trusted source with the followings$")
    public void the_field_trusted_source_with_the_followings(DataTable dt) {
        onAdministrationSteps.access_field_trusted_source();
        onAdministrationSteps.click_create_record();

        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (Map<String, String> row : list) {
            String matchingTable = row.get("Matching table");
            String field = row.get("Field");
            String trustedSourceList = row.get("Trusted source list");

            if (!matchingTable.isEmpty()) {
                onManualMergeSteps.select_matching_table(matchingTable);
            }
            if (!field.isEmpty()) {
                onManualMergeSteps.select_field_trusted_source(field);
            }
            if (!trustedSourceList.isEmpty()) {
                onManualMergeSteps.add_trusted_source_list(trustedSourceList);
            }
        }
        onManualMergeSteps.click_btn_save_and_close();
    }

    @And("^I click button Save and close$")
    public void i_click_button_save_and_close() {
        onManualMergeSteps.click_btn_save_and_close();
    }


    @Then("^I will see table MergingProcess as below$")
    public void iWillSeeTableMergingProcessAsBelow(DataTable table) {
        onCommonSteps.click_on_table_name("MergingProcess");
        onDatasetSteps.getDefaultViewTable(MAMEConstants.MERGEING_PROCESS_TBL);

        List<Map<String, String>> list = table.asMaps(String.class, String.class);

        String colId = TechnicalTable.MergingProcess.ID;
        String colMergePolicyId = TechnicalTable.MergingProcess.MERGE_POLICY_ID;
        String colMergeMode = TechnicalTable.MergingProcess.MERGE_MODE;
        String colExecutionDate = TechnicalTable.MergingProcess.EXECUTION_DATE;
        String colSnapshotId = TechnicalTable.MergingProcess.SNAPSHOT_ID;
        String colGroupId = TechnicalTable.MergingProcess.GROUP_ID;
        String colUser = TechnicalTable.MergingProcess.USER;
        String colIsUnmerged = TechnicalTable.MergingProcess.IS_UNMERGED;

        // get Merging process ID with groupID in RecordMetadata table
        String groupID = SessionData.getJsonTableValue(MAMEConstants.RECORD_METADATA_TBL, 0, TechnicalTable.RecordMetadata.GROUP_ID);

        String actualValue = "";
        for (int i = 0; i < list.size(); i++) {
            Map<String, String> row = list.get(i);
            String id = row.get(colId);
            String mergePolicyId = row.get(colMergePolicyId);
            String mergeMode = row.get(colMergeMode);
            String executionDate = row.get(colExecutionDate);
            String snapshotId = row.get(colSnapshotId);
            String groupId = row.get(colGroupId);
            String user = row.get(colUser);
            String isUnmerged = row.get(colIsUnmerged);

            if (!mergeMode.isEmpty()) {
                 actualValue = SessionData.getJsonTableValue(MAMEConstants.MERGEING_PROCESS_TBL, i, colMergeMode);
                assertThat(actualValue).isEqualTo(mergeMode);
            }
            if (!executionDate.isEmpty()) {
                executionDate = DateTimeUtils.getCurrentDateTime();
                actualValue = SessionData.getJsonTableValue(MAMEConstants.MERGEING_PROCESS_TBL, i, colExecutionDate);
                assertThat(actualValue).contains(executionDate);
            }
            if (!user.isEmpty()) {
                actualValue = SessionData.getJsonTableValue(MAMEConstants.MERGEING_PROCESS_TBL, i, colUser);
                assertThat(actualValue).isEqualTo(user);
            }
            if (!isUnmerged.isEmpty()) {
                actualValue = SessionData.getJsonTableValue(MAMEConstants.MERGEING_PROCESS_TBL, i, colIsUnmerged);
                assertThat(actualValue).isEqualTo(isUnmerged);
            }

        }

    }

    @And("^I close the error popup$")
    public void iCloseTheErrorPopup() {
        onManualMergeSteps.close_error_popup();
    }
}
