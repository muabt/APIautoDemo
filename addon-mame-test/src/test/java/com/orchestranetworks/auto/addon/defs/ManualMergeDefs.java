package com.orchestranetworks.auto.addon.defs;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.orchestranetworks.auto.addon.utils.LoadConfig;
import com.orchestranetworks.auto.addon.utils.SessionData;
import com.orchestranetworks.auto.addon.steps.CommonSteps;
import com.orchestranetworks.auto.addon.steps.DatasetSteps;
import com.orchestranetworks.auto.addon.steps.AdministrationSteps;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

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

    @And("^preview table is displayed as below$")
    public void table_is_highlighted_and_display_on_preview_table_as_below(List<List<String>> tablePreview) {
        onManualMergeSteps.verify_table_preview(tablePreview);
    }

    @When("^I complete merging process$")
    public void i_complete_merging_process() {
        onManualMergeSteps.click_button_next();
        onManualMergeSteps.click_button_merge();

    }

    @Then("^I will see table RecordMetadata as below$")
    public void i_will_see_table_recordmetadata_as_below(List<List<String>> recordMetadataExpect) {
        JsonArray actualTbl = onDatasetSteps.getDefaultViewTable();
        Serenity.setSessionVariable(MAMEConstants.RECORD_METADATA_TBL).to(actualTbl);
        JsonArray expectedTbl = SessionData.convertArrayListToJson(recordMetadataExpect);

        // get Merging process ID with groupID in RecordMetadata table
        JsonArray recordMetaDataTbl = Serenity.sessionVariableCalled(MAMEConstants.RECORD_METADATA_TBL);
        String groupID = SessionData.getJsonTableValue(recordMetaDataTbl.get(0).getAsJsonObject(), TechnicalTable.RecordMetadata.GROUP_ID);

        for (int i = 0; i < expectedTbl.size(); i++) {
            JsonObject expected = expectedTbl.get(i).getAsJsonObject();
            JsonObject actual = actualTbl.get(i).getAsJsonObject();

            SessionData.compareJsonObjectValue(actual, TechnicalTable.RecordMetadata.GROUP_ID, groupID);
            SessionData.compareJsonObjectValue(actual, TechnicalTable.RecordMetadata.STATE, expected, TechnicalTable.RecordMetadata.STATE);
            SessionData.compareJsonObjectValue(actual, TechnicalTable.RecordMetadata.AUTO_CREATED, expected, TechnicalTable.RecordMetadata.AUTO_CREATED);
            SessionData.compareJsonObjectValue(actual, TechnicalTable.RecordMetadata.FUNCTIONAL_ID, expected, TechnicalTable.RecordMetadata.FUNCTIONAL_ID);
        }
    }

    @And("^I click button Save and close$")
    public void i_click_button_save_and_close() {
        onCommonSteps.click_btn_save_and_close();
    }


    @Then("^I will see table MergingProcess as below$")
    public void i_will_see_table_merging_process_below(List<List<String>> table) {
        onCommonSteps.click_on_table_name("MergingProcess");
        JsonArray actualTbl = onDatasetSteps.getDefaultViewTable();
        JsonArray expectedTbl = SessionData.convertArrayListToJson(table);

        Serenity.setSessionVariable(MAMEConstants.MERGEING_PROCESS_TBL)
                .to(actualTbl);

        // get Merging process ID with groupID in RecordMetadata table
        JsonArray recordMetaDataTbl = Serenity.sessionVariableCalled(MAMEConstants.RECORD_METADATA_TBL);
        String groupID = SessionData.getJsonTableValue(recordMetaDataTbl.get(0).getAsJsonObject(), TechnicalTable.RecordMetadata.GROUP_ID);

        for (int i = 0; i < expectedTbl.size(); i++) {
            JsonObject expectedRow = expectedTbl.get(i).getAsJsonObject();
            JsonObject actualRow = actualTbl.get(i).getAsJsonObject();

            String id = expectedRow.get(TechnicalTable.MergingProcess.ID).getAsString();
            String mergePolicyId = expectedRow.get(TechnicalTable.MergingProcess.MERGE_POLICY_ID).getAsString();
            String mergeMode = expectedRow.get(TechnicalTable.MergingProcess.MERGE_MODE).getAsString();
            String executionDate = expectedRow.get(TechnicalTable.MergingProcess.EXECUTION_DATE).getAsString();
            String snapshotId = expectedRow.get(TechnicalTable.MergingProcess.SNAPSHOT_ID).getAsString();
            String groupId = expectedRow.get(TechnicalTable.MergingProcess.GROUP_ID).getAsString();
            String user = expectedRow.get(TechnicalTable.MergingProcess.USER).getAsString();
            String isUnmerged = expectedRow.get(TechnicalTable.MergingProcess.IS_UNMERGED).getAsString();

            if (!mergeMode.isEmpty()) {
                SessionData.compareJsonObjectValue(actualRow, TechnicalTable.MergingProcess.MERGE_MODE, mergeMode);
            }
            if (!executionDate.isEmpty()) {
                executionDate = DateTimeUtils.getCurrentDateTime();
                SessionData.compareJsonObjectValueContains(actualRow, TechnicalTable.MergingProcess.EXECUTION_DATE, executionDate);
            }
            if (!user.isEmpty()) {
                SessionData.compareJsonObjectValue(actualRow, TechnicalTable.MergingProcess.USER, user);
            }
            if (!isUnmerged.isEmpty()) {
                SessionData.compareJsonObjectValue(actualRow, TechnicalTable.MergingProcess.IS_UNMERGED, isUnmerged);
            }
        }
    }


    @And("^I close the error popup$")
    public void i_close_the_error_popup() {
        onManualMergeSteps.close_error_popup();
    }

    @Then("^I will see table MergeResult as below$")
    public void i_will_see_table_merge_result(List<List<String>> table) {
        onCommonSteps.click_on_table_name(MAMEConstants.MERGE_RESULT_TBL);
        JsonArray actualTbl = onDatasetSteps.getDefaultViewTable();
        JsonArray expectedTbl = SessionData.convertArrayListToJson(table);
        Serenity.setSessionVariable(actualTbl).to(MAMEConstants.MERGE_RESULT_TBL);

        // Get Merging process ID from MergingProcess table
        JsonArray mergingProcessTbl = Serenity.sessionVariableCalled(MAMEConstants.MERGEING_PROCESS_TBL);
        JsonObject mergingProcessRecord = mergingProcessTbl.get(0).getAsJsonObject();
        String mergingProcessId = SessionData.getJsonTableValue(mergingProcessRecord, TechnicalTable.MergingProcess.ID);

        for (int i = 0; i < expectedTbl.size(); i++) {
            JsonObject expectedRow = expectedTbl.get(i).getAsJsonObject();
            JsonObject actualRow = actualTbl.get(i).getAsJsonObject();

            String id = expectedRow.get(TechnicalTable.MergeResult.ID).getAsString();
            String recordId = expectedRow.get(TechnicalTable.MergeResult.RECORD_ID).getAsString();
            String goldenId = expectedRow.get(TechnicalTable.MergeResult.GOLDEN_ID).getAsString();
            String mpID = expectedRow.get(TechnicalTable.MergeResult.MERGING_PROCESS_ID).getAsString();
            String isInterpolation = expectedRow.get(TechnicalTable.MergeResult.IS_INTERPOLATION).getAsString();

            if (!id.isEmpty()) {

            }
            if (!recordId.isEmpty()) {
                recordId = SessionData.getJsonTableValueWithSourceValue(MAMEConstants.RECORD_METADATA_TBL, TechnicalTable.RecordMetadata.STATE, "Merged", TechnicalTable.RecordMetadata.FUNCTIONAL_ID);
                SessionData.compareJsonObjectValue(actualRow, TechnicalTable.MergeResult.RECORD_ID, recordId);
            }
            if (!goldenId.isEmpty()) {
                goldenId = SessionData.getJsonTableValueWithSourceValue(MAMEConstants.RECORD_METADATA_TBL, TechnicalTable.RecordMetadata.STATE, "Golden", TechnicalTable.RecordMetadata.FUNCTIONAL_ID);
                SessionData.compareJsonObjectValue(actualRow, TechnicalTable.MergeResult.GOLDEN_ID, goldenId);

            }
            if (!mpID.isEmpty()) {
                mpID = mergingProcessId;
                SessionData.compareJsonObjectValue(actualRow, TechnicalTable.MergeResult.MERGING_PROCESS_ID, mpID);
            }
            if (!isInterpolation.isEmpty()) {
                SessionData.compareJsonObjectValue(actualRow, TechnicalTable.MergeResult.IS_INTERPOLATION, isInterpolation);
            }

        }
    }

    @Then("^I will see table Decision as below$")
    public void i_will_see_table_decision_below(List<List<String>> table) {
        onCommonSteps.click_on_table_name(MAMEConstants.DECISION);

        JsonArray actualTbl = onDatasetSteps.getDefaultViewTable();
        Serenity.setSessionVariable(MAMEConstants.DECISION).to(actualTbl);
        JsonArray expectedTbl = SessionData.convertArrayListToJson(table);

        // Get data from other table
        JsonArray mergingProcessTbl = Serenity.sessionVariableCalled(MAMEConstants.MERGEING_PROCESS_TBL);
        String mpID = SessionData.getJsonTableValue(mergingProcessTbl.get(0).getAsJsonObject(), TechnicalTable.MergingProcess.ID);
        String mergedId = SessionData.getJsonTableValueWithSourceValue(MAMEConstants.RECORD_METADATA_TBL, TechnicalTable.RecordMetadata.STATE, "Merged", TechnicalTable.RecordMetadata.FUNCTIONAL_ID);
        String goldenId = SessionData.getJsonTableValueWithSourceValue(MAMEConstants.RECORD_METADATA_TBL, TechnicalTable.RecordMetadata.STATE, "Golden", TechnicalTable.RecordMetadata.FUNCTIONAL_ID);
        for (int i = 0; i < expectedTbl.size(); i++) {
            JsonObject expectedRow = expectedTbl.get(i).getAsJsonObject();
            JsonObject actualRow = actualTbl.get(i).getAsJsonObject();
            String id = expectedRow.get(TechnicalTable.Decision.ID).getAsString();
            String sourceId = expectedRow.get(TechnicalTable.Decision.SOURCE_ID).getAsString();
            String targetId = expectedRow.get(TechnicalTable.Decision.TARGET_ID).getAsString();
            String lastDecision = expectedRow.get(TechnicalTable.Decision.LAST_DECISION).getAsString();
            String user = expectedRow.get(TechnicalTable.Decision.USER).getAsString();
            String decisionDate = expectedRow.get(TechnicalTable.Decision.DECISION_DATE).getAsString();
            String mergingProcessId = expectedRow.get(TechnicalTable.Decision.MERGING_PROCESS_ID).getAsString();

            if (!id.isEmpty()) {

            }
            if (!sourceId.isEmpty()) {
                SessionData.compareJsonObjectValue(actualRow, TechnicalTable.Decision.SOURCE_ID, mergedId);
            }
            if (!targetId.isEmpty()) {
                SessionData.compareJsonObjectValue(actualRow, TechnicalTable.Decision.TARGET_ID, goldenId);

            }
            if (!lastDecision.isEmpty()) {
                SessionData.compareJsonObjectValue(actualRow, TechnicalTable.Decision.LAST_DECISION, lastDecision);
            }
            if (!user.isEmpty()) {
                user = LoadConfig.getUserName();
                SessionData.compareJsonObjectValue(actualRow, TechnicalTable.Decision.USER, user);
            }
            if (!decisionDate.isEmpty()) {
                decisionDate = DateTimeUtils.getCurrentDateTime();
                SessionData.compareJsonObjectValueContains(actualRow, TechnicalTable.Decision.DECISION_DATE, decisionDate);
            }
            if (!mergingProcessId.isEmpty()) {
                SessionData.compareJsonObjectValueContains(actualRow, TechnicalTable.Decision.MERGING_PROCESS_ID, mpID);
            }
        }
    }

    @Then("^I will see table MergeValueLineage as below$")
    public void i_will_see_table_MergeValueLineage_as_below(DataTable table) {
        onCommonSteps.click_on_table_name(MAMEConstants.MERGEVALUELINEAGE);
        onDatasetSteps.getDefaultViewTable();
        List<Map<String, String>> list = table.asMaps(String.class, String.class);
        String actualValue = "";
        for (int i = 0; i < list.size(); i++) {
            Map<String, String> row = list.get(i);
            String id = row.get(TechnicalTable.MergeValueLineage.ID);
            String mergingProcessId = row.get(TechnicalTable.MergeValueLineage.MERGING_PROCESS_ID);
            String recordId = row.get(TechnicalTable.MergeValueLineage.RECORD_ID);
            String sourceIndex = row.get(TechnicalTable.MergeValueLineage.SOURCE_INDEX);
            String fieldPath = row.get(TechnicalTable.MergeValueLineage.FIELD_PATH);
            String goldenIndex = row.get(TechnicalTable.MergeValueLineage.GOLDEN_INDEX);

            if (mergingProcessId.isEmpty()) {
            }
        }
    }

    @And("^the screen displays buttons as below$")
    public void the_screen_displays_buttons_as_below(DataTable tableButtons) {
        List<Map<String, String>> list = tableButtons.asMaps(String.class, String.class);
        for (int i = 0; i < list.size(); i++) {
            Map<String, String> row = list.get(i);
            String name = row.get("Name");
            String status = row.get("Status");

            if (!name.isEmpty()) {
                onManualMergeSteps.verify_name_of_buttons(name);
            }
            if (!status.isEmpty()) {
                onManualMergeSteps.verify_status_of_buttons(status);
            }
        }
    }

    @And("^I see the table name \"([^\"]*)\" in dropdown list$")
    public void i_see_the_table_name_something_in_dropdown_list(String tableName) {
        onManualMergeSteps.verify_name_of_table(tableName);
    }
}
