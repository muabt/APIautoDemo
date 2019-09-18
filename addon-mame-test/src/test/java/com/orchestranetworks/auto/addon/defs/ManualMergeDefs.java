package com.orchestranetworks.auto.addon.defs;

import com.orchestranetworks.auto.addon.steps.DatasetSteps;
import com.orchestranetworks.auto.addon.steps.AdministrationSteps;
import java.util.List;
import java.util.Map;

import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.steps.DatasetSteps;
import com.orchestranetworks.auto.addon.steps.AdministrationSteps;
import com.orchestranetworks.auto.addon.steps.ManualMergeSteps;
import cucumber.api.DataTable;

import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

import java.util.List;
import java.util.Map;

public class ManualMergeDefs {
    @Steps
    ManualMergeSteps onManualMergeSteps;
    @Steps
    DatasetSteps onDatasetSteps;
    @Steps
    AdministrationSteps onAdministrationSteps;

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
    public void i_will_see_table_recordmetadata_as_below(DataTable recordMetadataExpect){
        List<Map<String, String>> list = recordMetadataExpect.asMaps(String.class, String.class);
        for (int i = 1; i <= list.size(); i++) {
            Map<String, String> row = list.get(i - 1);
            String recordID = row.get("id");
            String groupID = row.get("groupId");
            String state = row.get("state");
            String autoCreated = row.get("autoCreated");
            String functionalID = row.get("functionalId");

            if (!recordID.isEmpty()) {
                onDatasetSteps.verify_record_value(i, "id", recordID);
            }
            if (!groupID.isEmpty()) {
                onManualMergeSteps.verify_group_id(i);
            }
            if (!state.isEmpty()) {
                onDatasetSteps.verify_record_value(i, "state", state);
            }
            if (!autoCreated.isEmpty()) {
                onDatasetSteps.verify_record_value(i, "autoCreated", autoCreated);
            }
            if (!functionalID.isEmpty()) {
                onDatasetSteps.verify_record_value(i, "functionalId", functionalID);
            }
        }

    }


    @Given("^I select matching policy record of table \"([^\"]*)\"$")
    public void i_select_matching_policy_record_of_table(String tblName) {
        onAdministrationSteps.select_record_with_name(tblName);
    }

    @Given("^I want to access the Matching record of table \"([^\"]*)\"$")
    public void i_want_to_access_the_matching_record_of_table(String tblName) {
        onAdministrationSteps.access_matching_table();
        onAdministrationSteps.select_record_with_name(tblName);
    }

    @And("^I select the expected source field \"([^\"]*)\"$")
    public void i_select_the_expected_source_field(String fieldName) {

    }

    @When("^I specific the options in Main tab of Merge policy as belows$")
    public void i_specific_the_options_in_main_tab_of_merge_policy_as_belows(DataTable dt) {

        onManualMergeSteps.select_merge_policy_tab();
        onManualMergeSteps.select_btn_create_record();

        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (int i = 0; i < list.size(); i++) {
            Map<String, String> row = list.get(i);
            String mergePolicyCode = row.get("Merge policy code");
            String selectionMode = row.get("Survivor record selection mode");
            String defaultFunction = row.get("Default merge function");
            String useManualMerge = row.get("Used for manual merge");

            if (!mergePolicyCode.isEmpty()) {
                onManualMergeSteps.input_merge_policy_code();
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
        }
       // onManualMergeSteps.click_btn_save();
        onManualMergeSteps.click_btn_save_and_close_internal_popup();
        onManualMergeSteps.click_btn_save_and_close();
    }

    @And("^I create Survivorship field with selections as followings$")
    public void i_create_survivorship_field_with_selections_as_followings(DataTable dt){
        onManualMergeSteps.select_survivor_field_tab();
        onManualMergeSteps.select_btn_create_record();

        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (int i = 0; i < list.size(); i++) {
            Map<String, String> row = list.get(i);
            String survivorCode = row.get("Survivorship field code");
            String field = row.get("Field");
            String mergeFunction = row.get("Merge function");
            String condition = row.get("Condition for field value survivorship");
            String executeEmpty = row.get("Execute only if empty");

            if (!survivorCode.isEmpty()) {
                onManualMergeSteps.input_survivor_code();
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
    }

    @And("^some configurations like belows$")
    public void some_configurations_like_belows(){

    }

}
