package com.orchestranetworks.auto.addon.defs;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.orchestranetworks.auto.addon.common.DataObject;
import com.orchestranetworks.auto.addon.common.TableObject;
import com.orchestranetworks.auto.addon.utils.*;
import com.orchestranetworks.auto.addon.steps.CommonSteps;
import com.orchestranetworks.auto.addon.steps.DatasetSteps;
import com.orchestranetworks.auto.addon.steps.AdministrationSteps;

import static com.orchestranetworks.auto.addon.utils.MAMEConstants.RECORDMETADATA_TABLE;
import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

import java.util.*;

import com.orchestranetworks.auto.addon.steps.ManualMergeSteps;
import cucumber.api.DataTable;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.serenitybdd.core.Serenity;
import net.thucydides.core.annotations.Steps;
import org.junit.Assert;

public class ManualMergeDefs {
    @Steps
    ManualMergeSteps onManualMergeSteps;
    @Steps
    DatasetSteps onDatasetSteps;
    @Steps
    AdministrationSteps onAdministrationSteps;
    @Steps
    CommonSteps onCommonSteps;
    private DataObject mergedRecord;

    /**
     * Verify the preview table when merging
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">And</font> preview table is displayed as below
     * <ul>
     * <font color="green">| Id {H} | Name {H}      |</font>
     * </ul>
     * <ul>
     * <font color="green">| 1      | Poortvliet    |</font>
     * </ul>
     *
     * </ul>
     * </p>
     *
     * @param tableMerge record view table information
     */
    @Then("^record view table will be displayed and highlighted as below$")
    public void user_will_see_the_data_as_below(List<List<String>> tableMerge) {
        onManualMergeSteps.verify_record_view_table(tableMerge);
    }

    /**
     * Verify the preview table when merging
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">And</font> preview table is displayed as below
     * <ul>
     * <font color="green">| Id | Name       |</font>
     * </ul>
     * <ul>
     * <font color="green">| 1  | Poortvliet |</font>
     * </ul>
     *
     * </ul>
     * </p>
     *
     * @param tablePreview preview table information
     */
    @And("^preview table is displayed as below$")
    public void table_is_highlighted_and_display_on_preview_table_as_below(List<List<String>> tablePreview) {
        onManualMergeSteps.verify_table_preview(tablePreview);
    }

    /**
     * Complete the merging process (Click button Next then Merge)
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">And</font> I complete merging process
     * </ul>
     * </p>
     */
    @When("^I complete merging process$")
    public void i_complete_merging_process() {
        onManualMergeSteps.click_button_next();
        onManualMergeSteps.click_button_merge();

    }

    /**
     * Verify the RecordMetadata table
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">Then</font> I will see table RecordMetadata as below
     * <ul>
     * <font color="green">| id   | groupId  | state  | autoCreated | functionalId |</font>
     * </ul>
     * <ul>
     * <font color="green">| KEY1 | GROUP_ID | Golden | No          | 3            |</font>
     * </ul>
     * <ul>
     * <font color="green">| KEY2 | GROUP_ID | Merged | No          | 4            |</font>
     * </ul>
     * </ul>
     * </p>
     *
     * @param recordMetadataExpect RecordMetadata table information
     */
    @Then("^I will see table RecordMetadata as below$")
    public void i_will_see_table_recordmetadata_as_below(List<List<String>> recordMetadataExpect) {
        JsonArray expectedTbl = SessionData.convertArrayListToJson(recordMetadataExpect);
        mergedRecord = SessionData.getDataObjectFromSession(Constants.DATA_OBJECT);

        // Filter selected record by Functional ID
        List<Map<String, String>> filterConditions = new ArrayList<Map<String, String>>();
        Map<String, String> condition = null;
        for (int i = 0; i < expectedTbl.size(); i++) {
            condition = new HashMap<String, String>();
            JsonObject record = expectedTbl.get(i).getAsJsonObject();
            condition.put(Constants.CRITERION, TechnicalTable.RecordMetadata.FUNCTIONAL_ID);
            condition.put(Constants.OPERATION, "equals");
            condition.put(Constants.VALUE, record.get(TechnicalTable.RecordMetadata.FUNCTIONAL_ID).getAsString().replace("*", "|"));
            condition.put(Constants.FIELD_TYPE, Constants.INPUT_TYPE);
            filterConditions.add(condition);
        }
        onCommonSteps.search_with_advance_search(Constants.AT_LEAST_ONE_MATCHES, filterConditions);
        String actualGroupID = onManualMergeSteps.get_groupID();

        // Filter by group id if golden record is auto generated
        if (expectedTbl.size() > mergedRecord.getPKs().size()) {
            onCommonSteps.delete_all_occurrence();
            filterConditions = new ArrayList<Map<String, String>>();
            condition = new HashMap<String, String>();
            condition.put(Constants.CRITERION, TechnicalTable.RecordMetadata.GROUP_ID);
            condition.put(Constants.OPERATION, "=");
            condition.put(Constants.VALUE, actualGroupID);
            condition.put(Constants.FIELD_TYPE, Constants.INPUT_TYPE);
            filterConditions.add(condition);
            onCommonSteps.input_search_condition(filterConditions);
            onCommonSteps.click_btn_apply_advanced_search();
        }

        TableObject actualTbl = onDatasetSteps.getDefaultViewTable(MAMEConstants.RECORD_METADATA_TBL);
        mergedRecord.addTable(actualTbl.getTableName(), actualTbl.getTable());

        //Loop for verify
        for (int i = 0; i < expectedTbl.size(); i++) {
            JsonObject expected = expectedTbl.get(i).getAsJsonObject();
            JsonObject actual = actualTbl.getRecord(i);

            String groupID = expected.get(TechnicalTable.RecordMetadata.GROUP_ID).getAsString();
            String state = expected.get(TechnicalTable.RecordMetadata.STATE).getAsString();
            String autoCreated = expected.get(TechnicalTable.RecordMetadata.AUTO_CREATED).getAsString();
            String functionalID = expected.get(TechnicalTable.RecordMetadata.FUNCTIONAL_ID).getAsString().replace("*", "|");

            if (!groupID.isEmpty()) {
                SessionData.compareJsonObjectValue(actual, TechnicalTable.RecordMetadata.GROUP_ID, actualGroupID);
            }
            if (!state.isEmpty()) {
                SessionData.compareJsonObjectValue(actual, TechnicalTable.RecordMetadata.STATE, state);
            }
            if (!autoCreated.isEmpty()) {
                SessionData.compareJsonObjectValue(actual, TechnicalTable.RecordMetadata.AUTO_CREATED, autoCreated);
            }
            if (!functionalID.isEmpty()) {
                SessionData.compareJsonObjectValue(actual, TechnicalTable.RecordMetadata.FUNCTIONAL_ID, functionalID);
            } else {
                String autoGeneratePK = actualTbl.getRecord(actualTbl.getRecords().size() - 1).get(TechnicalTable.RecordMetadata.FUNCTIONAL_ID).getAsString();
                mergedRecord.addPK(TechnicalTable.RecordMetadata.FUNCTIONAL_ID, autoGeneratePK);
            }


        }
    }

    @And("^I click button Save and close$")
    public void i_click_button_save_and_close() {
        onCommonSteps.click_btn_save_and_close();
    }


    /**
     * Verify the MergingProcess table
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">Then</font> I will see table MergingProcess as below
     * <ul>
     * <font color="green">| id   | mergePolicyId | mergeMode | executionDate | snapshotId | groupId  | user  | isUnmerged |</font>
     * </ul>
     * <ul>
     * <font color="green">| KEY1 | 15            | Manual    | TODAY         |            | GROUP_ID | admin | No         |</font>
     * </ul>
     * </ul>
     * </p>
     *
     * @param table MergeResult table information
     */
    @Then("^I will see table MergingProcess as below$")
    public void i_will_see_table_merging_process_below(List<List<String>> table) {
        onCommonSteps.click_on_table_name(MAMEConstants.MERGING_PROCESS_TBL);
        JsonArray expectedTbl = SessionData.convertArrayListToJson(table);

        // get Merging process ID with groupID in RecordMetadata table
        String groupID = TableObject.takeTable(mergedRecord, MAMEConstants.RECORD_METADATA_TBL)
                .getRecord(0).getAsJsonObject()
                .get(TechnicalTable.RecordMetadata.GROUP_ID).getAsString();

        // Filter selected record by GroupID
        List<Map<String, String>> filterConditions = new ArrayList<Map<String, String>>();
        for (int i = 0; i < expectedTbl.size(); i++) {
            Map<String, String> condition = new HashMap<String, String>();
            JsonObject record = expectedTbl.get(i).getAsJsonObject();
            condition.put(Constants.CRITERION, TechnicalTable.MergingProcess.GROUP_ID);
            condition.put(Constants.OPERATION, "=");
            condition.put(Constants.VALUE, groupID);
            condition.put(Constants.FIELD_TYPE, Constants.INPUT_TYPE);
            filterConditions.add(condition);
        }
        onCommonSteps.search_with_advance_search(Constants.AT_LEAST_ONE_MATCHES, filterConditions);

        // Save table to DataObject in session
        TableObject actualTbl = onDatasetSteps.getDefaultViewTable(MAMEConstants.MERGING_PROCESS_TBL);
        LogWork.info("Test null poiter =" + actualTbl);
        mergedRecord.addTable(actualTbl.getTableName(), actualTbl.getTable());

        for (int i = 0; i < expectedTbl.size(); i++) {
            JsonObject expectedRow = expectedTbl.get(i).getAsJsonObject();
            JsonObject actualRow = actualTbl.getRecord(i);

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
                if (executionDate.equals("TODAY")) {
                    executionDate = DateTimeUtils.getCurrentDateTime();
                }
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

    /**
     * Close the error popup displayed while merging
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">And</font>I close the error popup
     * </ul>
     * </p>
     */
    @And("^I close the error popup$")
    public void i_close_the_error_popup() {
        onManualMergeSteps.close_error_popup();
    }

    /**
     * Verify the MergeResult table
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">Then</font> I will see table MergeResult as below
     * <ul>
     * <font color="green">| id   | recordId     | goldenId      | mergingProcessId | isInterpolation |</font>
     * </ul>
     * <ul>
     * <font color="green">| KEY1 | Merge_record | Golden_record | mergingProcessId | No              |</font>
     * </ul>
     * </ul>
     * </p>
     *
     * @param table MergeResult table information
     */
    @Then("^I will see table MergeResult as below$")
    public void i_will_see_table_merge_result(List<List<String>> table) {
        onCommonSteps.click_on_table_name(MAMEConstants.MERGE_RESULT_TBL);
        JsonArray expectedTbl = SessionData.convertArrayListToJson(table);

        // Get Merging process ID from MergingProcess table
        String mergingProcessId = TableObject.takeTable(mergedRecord, MAMEConstants.MERGING_PROCESS_TBL)
                .getRecord(0).getAsJsonObject()
                .get(TechnicalTable.MergingProcess.ID).getAsString();

        // Filter selected record by Merging process ID
        List<Map<String, String>> filterConditions = new ArrayList<Map<String, String>>();
        for (int i = 0; i < expectedTbl.size(); i++) {
            Map<String, String> condition = new HashMap<String, String>();
            JsonObject record = expectedTbl.get(i).getAsJsonObject();
            condition.put(Constants.CRITERION, TechnicalTable.MergeResult.MERGING_PROCESS_ID);
            condition.put(Constants.OPERATION, "");
            condition.put(Constants.VALUE, mergingProcessId);
            condition.put(Constants.FIELD_TYPE, Constants.ENUMERATION);
            filterConditions.add(condition);
        }
        onCommonSteps.search_with_advance_search(Constants.AT_LEAST_ONE_MATCHES, filterConditions);

        // Save table to DataObject in session
        TableObject actualTbl = onDatasetSteps.getDefaultViewTable(MAMEConstants.MERGE_RESULT_TBL);
        mergedRecord.addTable(actualTbl.getTableName(), actualTbl.getTable());

        for (int i = 0; i < expectedTbl.size(); i++) {
            JsonObject expectedRow = expectedTbl.get(i).getAsJsonObject();
            JsonObject actualRow = actualTbl.getRecord(i);

            String id = expectedRow.get(TechnicalTable.MergeResult.ID).getAsString();
            String recordId = expectedRow.get(TechnicalTable.MergeResult.RECORD_ID).getAsString().replace("*", "|");
            String goldenId = expectedRow.get(TechnicalTable.MergeResult.GOLDEN_ID).getAsString().replace("*", "|");
            String mpID = expectedRow.get(TechnicalTable.MergeResult.MERGING_PROCESS_ID).getAsString();
            String isInterpolation = expectedRow.get(TechnicalTable.MergeResult.IS_INTERPOLATION).getAsString();

            if (!id.isEmpty()) {

            }
            if (!recordId.isEmpty()) {
                SessionData.compareJsonObjectValue(actualRow, TechnicalTable.MergeResult.RECORD_ID, recordId);
            }
            if (!goldenId.isEmpty()) {
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

    /**
     * Verify the decision table
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">Then</font> I will see table Decision as below
     * <ul>
     * <font color="green">| id   | sourceId     | targetId      | lastDecision        | user  | decisionDate | mergingProcessId |</font>
     * </ul>
     * <ul>
     * <font color="green">      | KEY1 | Merge_record | Golden_record | Identified as match | admin | decisionDate | mergingProcessId |</font>
     * </ul>
     * </ul>
     * </p>
     *
     * @param table Decision table information
     */
    @Then("^I will see table Decision as below$")
    public void i_will_see_table_decision_below(List<List<String>> table) {
        onCommonSteps.click_on_table_name(MAMEConstants.DECISION);
        JsonArray expectedTbl = SessionData.convertArrayListToJson(table);
        // Get Merging process ID from MergingProcess table
        String mpID = TableObject.takeTable(mergedRecord, MAMEConstants.MERGING_PROCESS_TBL)
                .getRecord(0).getAsJsonObject()
                .get(TechnicalTable.MergingProcess.ID)
                .getAsString();

        // Filter selected record by Merging process ID
        List<Map<String, String>> filterConditions = new ArrayList<Map<String, String>>();
        for (int i = 0; i < expectedTbl.size(); i++) {
            Map<String, String> condition = new HashMap<String, String>();
            JsonObject record = expectedTbl.get(i).getAsJsonObject();
            condition.put(Constants.CRITERION, TechnicalTable.MergeResult.MERGING_PROCESS_ID);
            condition.put(Constants.OPERATION, "");
            condition.put(Constants.VALUE, mpID);
            condition.put(Constants.FIELD_TYPE, Constants.ENUMERATION);
            filterConditions.add(condition);
        }
        onCommonSteps.search_with_advance_search(Constants.AT_LEAST_ONE_MATCHES, filterConditions);

        TableObject actualTbl = onDatasetSteps.getDefaultViewTable(MAMEConstants.DECISION);
        mergedRecord.addTable(actualTbl.getTableName(), actualTbl.getTable());

      /*  String mergedId = TableObject.takeTable(mergedRecord, MAMEConstants.RECORD_METADATA_TBL)
                .filter(TechnicalTable.RecordMetadata.STATE, "Merged")
                .get(0).getAsJsonObject()
                .get(TechnicalTable.RecordMetadata.FUNCTIONAL_ID).getAsString();*/

        String goldenId = TableObject.takeTable(mergedRecord, MAMEConstants.RECORD_METADATA_TBL)
                .filter(TechnicalTable.RecordMetadata.STATE, "Golden")
                .get(0).getAsJsonObject()
                .get(TechnicalTable.RecordMetadata.FUNCTIONAL_ID).getAsString();

        for (int i = 0; i < expectedTbl.size(); i++) {
            JsonObject expectedRow = expectedTbl.get(i).getAsJsonObject();
            JsonObject actualRow = actualTbl.getRecord(i);
            String id = expectedRow.get(TechnicalTable.Decision.ID).getAsString();
            String sourceId = expectedRow.get(TechnicalTable.Decision.SOURCE_ID).getAsString().replace("*", "|");
            String targetId = expectedRow.get(TechnicalTable.Decision.TARGET_ID).getAsString().replace("*", "|");
            String lastDecision = expectedRow.get(TechnicalTable.Decision.LAST_DECISION).getAsString();
            String user = expectedRow.get(TechnicalTable.Decision.USER).getAsString();
            String decisionDate = expectedRow.get(TechnicalTable.Decision.DECISION_DATE).getAsString();
            String mergingProcessId = expectedRow.get(TechnicalTable.Decision.MERGING_PROCESS_ID).getAsString();

            if (!id.isEmpty()) {

            }
            if (!sourceId.isEmpty()) {
                SessionData.compareJsonObjectValue(actualRow, TechnicalTable.Decision.SOURCE_ID, sourceId);
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
                if (decisionDate.equals("TODAY")) {
                    decisionDate = DateTimeUtils.getCurrentDateTime();
                }
                SessionData.compareJsonObjectValueContains(actualRow, TechnicalTable.Decision.DECISION_DATE, decisionDate);
            }
            if (!mergingProcessId.isEmpty()) {
                SessionData.compareJsonObjectValueContains(actualRow, TechnicalTable.Decision.MERGING_PROCESS_ID, mpID);
            }
        }
    }

    /**
     * Verify the Merge Value Lineage table
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">Then</font> I will see table MergeValueLineage as below
     * <ul>
     * <font color="green">| id   | mergingProcessId | recordId      | sourceIndex | fieldPath | goldenIndex |   |</font>
     * </ul>
     * <ul>
     * <font color="green">| KEY1 | mergingProcessId | Golden_record | 0           | admin     | /email      | 0 |</font>
     * </ul>
     * </ul>
     * </p>
     *
     * @param table mergeValueLineage table information
     */
    @Then("^I will see table MergeValueLineage as below$")
    public void i_will_see_table_MergeValueLineage_as_below(List<List<String>> table) {
        onCommonSteps.click_on_table_name(MAMEConstants.MERGE_VALUE_LINEAGE_TBL);
        JsonArray expectedTbl = SessionData.convertArrayListToJson(table);

        String mpID = TableObject.takeTable(mergedRecord, MAMEConstants.MERGING_PROCESS_TBL)
                .getRecord(0).getAsJsonObject()
                .get(TechnicalTable.MergingProcess.ID).getAsString();

        // Filter selected record by Merging process ID
        List<Map<String, String>> filterConditions = new ArrayList<Map<String, String>>();
        for (int i = 0; i < expectedTbl.size(); i++) {
            Map<String, String> condition = new HashMap<String, String>();
            JsonObject record = expectedTbl.get(i).getAsJsonObject();
            condition.put(Constants.CRITERION, TechnicalTable.MergeResult.MERGING_PROCESS_ID);
            condition.put(Constants.OPERATION, "");
            condition.put(Constants.VALUE, mpID);
            condition.put(Constants.FIELD_TYPE, Constants.ENUMERATION);
            filterConditions.add(condition);
        }
        onCommonSteps.search_with_advance_search(Constants.AT_LEAST_ONE_MATCHES, filterConditions);

        TableObject actualTbl = onDatasetSteps.getDefaultViewTable(MAMEConstants.MERGE_VALUE_LINEAGE_TBL);
        mergedRecord.addTable(actualTbl.getTableName(), actualTbl.getTable());

        for (int i = 0; i < expectedTbl.size(); i++) {
            JsonObject expectedRow = expectedTbl.get(i).getAsJsonObject();
            JsonObject actualRow = actualTbl.getRecord(i);

            String id = expectedRow.get(TechnicalTable.MergeValueLineage.ID).toString();
            String mergingProcessId = expectedRow.get(TechnicalTable.MergeValueLineage.MERGING_PROCESS_ID).toString();
            String recordId = expectedRow.get(TechnicalTable.MergeValueLineage.RECORD_ID).toString();
            String sourceIndex = expectedRow.get(TechnicalTable.MergeValueLineage.SOURCE_INDEX).toString();
            String fieldPath = expectedRow.get(TechnicalTable.MergeValueLineage.FIELD_PATH).toString();
            String goldenIndex = expectedRow.get(TechnicalTable.MergeValueLineage.GOLDEN_INDEX).toString();

            if (mergingProcessId.isEmpty()) {
                SessionData.compareJsonObjectValueContains(actualRow, TechnicalTable.MergeValueLineage.MERGING_PROCESS_ID, mpID);
            }

            if (recordId.isEmpty()) {
                SessionData.compareJsonObjectValueContains(actualRow, TechnicalTable.MergeValueLineage.RECORD_ID, recordId);
            }
            if (sourceIndex.isEmpty()) {
                SessionData.compareJsonObjectValueContains(actualRow, TechnicalTable.MergeValueLineage.SOURCE_INDEX, sourceIndex);
            }
            if (fieldPath.isEmpty()) {
                SessionData.compareJsonObjectValueContains(actualRow, TechnicalTable.MergeValueLineage.FIELD_PATH, sourceIndex);
            }
            if (goldenIndex.isEmpty()) {
                SessionData.compareJsonObjectValueContains(actualRow, TechnicalTable.MergeValueLineage.GOLDEN_INDEX, goldenIndex);
            }
        }
    }

    /**
     * Verify the button display in the screen
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">And</font> the screen displays buttons as below
     * <ul>
     * <font color="green">| Name | Status |</font>
     * </ul>
     * <ul>
     * <font color="green">| Apply merge policy |  |</font>
     * </ul>
     * <ul>
     * <font color="green">| Cancel last action| inactive |</font>
     * </ul>
     * </ul>
     * </p>
     *
     * @param tableButtons List of buttons displayed
     */
    @And("^the screen displays buttons as below$")
    public void the_screen_displays_buttons_as_below(DataTable tableButtons) {
        List<Map<String, String>> list = tableButtons.asMaps(String.class, String.class);
        for (int i = 0; i < list.size(); i++) {
            Map<String, String> row = list.get(i);
            String name = row.get(MAMEConstants.NAME_FIELD);
            String status = row.get("Status");

            if (!name.isEmpty()) {
                onManualMergeSteps.verify_name_of_buttons(name);
            }
            if (!status.isEmpty()) {
                onManualMergeSteps.verify_status_of_buttons(status);
            }
        }
    }

    /**
     * Verify the table name existed in dropdown list
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">And</font> And I see the table name <font color="green">"1. NewEmployee"</font> in dropdown list
     * </ul>
     * </p>
     *
     * @param tableName table name that user want to check
     */
    @And("^I see the table name \"([^\"]*)\" in dropdown list$")
    public void i_see_the_table_name_something_in_dropdown_list(String tableName) {
        onManualMergeSteps.verify_name_of_table(tableName);
    }

    /**
     * Verify the table name shows no record founds
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">And</font> no records found in table <font color="green">"NewEmployee"</font>
     * </ul>
     * </p>
     *
     * @param tableName table name that user want to check
     */
    @Then("^no records found in table \"([^\"]*)\"$")
    public void no_records_found_in_table(String tableName) {
        onCommonSteps.click_on_table_name(tableName);
        onCommonSteps.verify_table_no_record_found();
    }

    @Then("^I will verify the group id of table Recordmetadata as below$")
    public void i_will_verify_the_groupid_of_table_recordmetadata_as_below(List<Map<String, String>> table) {
        List<List<String>> expectList = new ArrayList<>();
        table.forEach(row -> {
            List<String> list = Arrays.asList(row.get(TechnicalTable.RecordMetadata.FUNCTIONAL_ID)
                    .replace("*", "|")
                    .split("\\s*,\\s*"));
            Collections.sort(list);
            expectList.add(list);
        });

        TableObject actualTbl = onDatasetSteps.getDefaultViewTable(MAMEConstants.RECORD_METADATA_TBL);
        if (mergedRecord == null) {
            mergedRecord = new DataObject();
        }
        mergedRecord.addTable(actualTbl.getTableName(), actualTbl.getTable());

        // Get actual table and add the list of same group ID in the hashmap, using groupId as key
        HashMap<String, List<String>> hashMapGroupId = new HashMap<>();
        HashMap<String, List<String>> actualTblData = new HashMap<>();
        for (int i = 0; i < actualTbl.getRecords().size(); i++) {
            String groupId = actualTbl.getRecord(i).getAsJsonObject()
                    .get(TechnicalTable.RecordMetadata.GROUP_ID).getAsString();
            String functionalId = actualTbl.getRecord(i).getAsJsonObject()
                    .get(TechnicalTable.RecordMetadata.FUNCTIONAL_ID).getAsString();
            String state = actualTbl.getRecord(i).getAsJsonObject()
                    .get(TechnicalTable.RecordMetadata.STATE).getAsString();
            String autoCreated = actualTbl.getRecord(i).getAsJsonObject()
                    .get(TechnicalTable.RecordMetadata.AUTO_CREATED).getAsString();
            String isolated = actualTbl.getRecord(i).getAsJsonObject()
                    .get(TechnicalTable.RecordMetadata.ISOLATED).getAsString();

            actualTblData.put(functionalId, Arrays.asList(functionalId, state, autoCreated, isolated));
            if (!hashMapGroupId.containsKey(groupId)) {
                List<String> list = new ArrayList<>();
                list.add(functionalId);
                hashMapGroupId.put(groupId, list);
            } else {
                hashMapGroupId.get(groupId).add(functionalId);
            }
        }
        Serenity.setSessionVariable(RECORDMETADATA_TABLE).to(actualTblData);

        List<List<String>> actualList = new ArrayList<>(hashMapGroupId.values());

        System.out.println("Expected list");
        expectList.forEach(row -> {
            row.forEach(cell -> System.out.print(cell + " "));
            System.out.println();
        });
        System.out.println("============");
        System.out.println("Actual list");
        actualList.forEach(row -> {
            Collections.sort(row);
            row.forEach(cell -> System.out.print(cell + " "));
            System.out.println();
        });
        Assert.assertTrue(actualList.containsAll(expectList)
                && actualList.size() == expectList.size());
    }

    /**
     * Verify the raw data of Recordmetadata table
     *
     * @param table
     */
    @And("^I will verify other data of the table Recordmetadata as below$")
    public void i_will_verify_the_data_of_table_recordmetadata_as_below(List<Map<String, String>> table) {
        HashMap<String, List<String>> actualTable = Serenity.sessionVariableCalled(RECORDMETADATA_TABLE);
        table.forEach(row -> {
            String expectedFunctionalId = row.get(TechnicalTable.RecordMetadata.FUNCTIONAL_ID).replace("*", "|");
            String expectedState = row.get(TechnicalTable.RecordMetadata.STATE);
            String expectedAutoCreated = row.get(TechnicalTable.RecordMetadata.AUTO_CREATED);
            String expectedIsolated = row.get(TechnicalTable.RecordMetadata.ISOLATED);
            assertThat(expectedFunctionalId).isEqualTo(actualTable.get(expectedFunctionalId).get(0));
            assertThat(expectedState).isEqualTo(actualTable.get(expectedFunctionalId).get(1));
            assertThat(expectedAutoCreated).isEqualTo(actualTable.get(expectedFunctionalId).get(2));
            assertThat(expectedIsolated).isEqualTo(actualTable.get(expectedFunctionalId).get(3));
        });
    }

    /**
     * Verify the raw data of MergingProcess table
     *
     * @param table
     */
    @And("^I will verify table MergingProcess as below$")
    public void i_will_verify_table_merging_process_as_below(List<List<String>> table) {
        onCommonSteps.click_on_table_name(MAMEConstants.MERGING_PROCESS_TBL);

        JsonArray expectedTbl = SessionData.convertArrayListToJson(table);
        TableObject actualTbl = onDatasetSteps.getDefaultViewTable(MAMEConstants.MERGING_PROCESS_TBL);

        for (int i = 0; i < expectedTbl.size(); i++) {
            JsonObject expectedRow = expectedTbl.get(i).getAsJsonObject();
            JsonObject actualRow = actualTbl.getRecord(i);
            String expectedId = expectedRow.get(TechnicalTable.MergingProcess.ID).getAsString();
            String expectedMergePolicyId = expectedRow.get(TechnicalTable.MergingProcess.MERGE_POLICY_ID).getAsString();
            String expectedMergeMode = expectedRow.get(TechnicalTable.MergingProcess.MERGE_MODE).getAsString();
            String expectedExecutionDate = expectedRow.get(TechnicalTable.MergingProcess.EXECUTION_DATE).getAsString();
            String expectedSnapshotId = expectedRow.get(TechnicalTable.MergingProcess.SNAPSHOT_ID).getAsString();
            String expectedGroupId = expectedRow.get(TechnicalTable.MergingProcess.GROUP_ID).getAsString();
            String expectedUser = expectedRow.get(TechnicalTable.MergingProcess.USER).getAsString();
            String expectedIsUnmerged = expectedRow.get(TechnicalTable.MergingProcess.IS_UNMERGED).getAsString();

            SessionData.compareJsonObjectValueContains(actualRow, TechnicalTable.MergingProcess.ID, expectedId);
            SessionData.compareJsonObjectValueContains(actualRow, TechnicalTable.MergingProcess.MERGE_POLICY_ID, expectedMergePolicyId);
            SessionData.compareJsonObjectValueContains(actualRow, TechnicalTable.MergingProcess.MERGE_MODE, expectedMergeMode);
            SessionData.compareJsonObjectValueContains(actualRow, TechnicalTable.MergingProcess.EXECUTION_DATE, expectedExecutionDate);
            SessionData.compareJsonObjectValueContains(actualRow, TechnicalTable.MergingProcess.SNAPSHOT_ID, expectedSnapshotId);
            SessionData.compareJsonObjectValueContains(actualRow, TechnicalTable.MergingProcess.GROUP_ID, expectedGroupId);
            SessionData.compareJsonObjectValueContains(actualRow, TechnicalTable.MergingProcess.USER, expectedUser);
            SessionData.compareJsonObjectValueContains(actualRow, TechnicalTable.MergingProcess.IS_UNMERGED, expectedIsUnmerged);
        }

    }

    /**
     * Verify the raw data of Decision table
     *
     * @param table
     */
    @And("^I will verify table Decision as below$")
    public void i_will_verify_table_decision_as_below(List<List<String>> table) {
        onCommonSteps.click_on_table_name(MAMEConstants.DECISION);
        JsonArray expectedTbl = SessionData.convertArrayListToJson(table);
        TableObject actualTbl = onDatasetSteps.getDefaultViewTable(MAMEConstants.DECISION);

        for (int i = 0; i < expectedTbl.size(); i++) {
            JsonObject expectedRow = expectedTbl.get(i).getAsJsonObject();
            JsonObject actualRow = actualTbl.getRecord(i);
            String expectedId = expectedRow.get(TechnicalTable.Decision.ID).getAsString();
            String expectedSourceId = expectedRow.get(TechnicalTable.Decision.SOURCE_ID).getAsString().replace("*", "|");
            String expectedTargetId = expectedRow.get(TechnicalTable.Decision.TARGET_ID).getAsString().replace("*", "|");
            String expectedLastDecision = expectedRow.get(TechnicalTable.Decision.LAST_DECISION).getAsString();
            String expectedUser = expectedRow.get(TechnicalTable.Decision.USER).getAsString();
            String expectedDecisionDate = expectedRow.get(TechnicalTable.Decision.DECISION_DATE).getAsString();
            String expectedMergingProcessId = expectedRow.get(TechnicalTable.Decision.MERGING_PROCESS_ID).getAsString();

            SessionData.compareJsonObjectValue(actualRow, TechnicalTable.Decision.ID, expectedId);
            SessionData.compareJsonObjectValue(actualRow, TechnicalTable.Decision.SOURCE_ID, expectedSourceId);
            SessionData.compareJsonObjectValue(actualRow, TechnicalTable.Decision.TARGET_ID, expectedTargetId);
            SessionData.compareJsonObjectValue(actualRow, TechnicalTable.Decision.LAST_DECISION, expectedLastDecision);
            SessionData.compareJsonObjectValue(actualRow, TechnicalTable.Decision.USER, expectedUser);
            SessionData.compareJsonObjectValue(actualRow, TechnicalTable.Decision.DECISION_DATE, expectedDecisionDate);
            SessionData.compareJsonObjectValue(actualRow, TechnicalTable.Decision.MERGING_PROCESS_ID, expectedMergingProcessId);
        }
    }

    /**
     * Verify the raw data of MergeValueLineage table
     *
     * @param table
     */
    @And("^I will verify table MergeValueLineage as below$")
    public void i_will_verify_table_merge_value_lineage_as_below(List<List<String>> table) {
        onCommonSteps.click_on_table_name(MAMEConstants.MERGE_VALUE_LINEAGE_TBL);
        JsonArray expectedTbl = SessionData.convertArrayListToJson(table);
        TableObject actualTbl = onDatasetSteps.getDefaultViewTable(MAMEConstants.MERGE_VALUE_LINEAGE_TBL);

        for (int i = 0; i < expectedTbl.size(); i++) {
            JsonObject expectedRow = expectedTbl.get(i).getAsJsonObject();
            JsonObject actualRow = actualTbl.getRecord(i);
            String expectedId = expectedRow.get(TechnicalTable.MergeValueLineage.ID).getAsString();
            String expectedMergingProcessId = expectedRow.get(TechnicalTable.MergeValueLineage.MERGING_PROCESS_ID).getAsString();
            String expectedRecordId = expectedRow.get(TechnicalTable.MergeValueLineage.RECORD_ID).getAsString().replace("*", "|");
            String expectedSourceIndex = expectedRow.get(TechnicalTable.MergeValueLineage.SOURCE_INDEX).getAsString();
            String expectedFieldPath = expectedRow.get(TechnicalTable.MergeValueLineage.FIELD_PATH).getAsString();
            String expectedGoldenIndex = expectedRow.get(TechnicalTable.MergeValueLineage.GOLDEN_INDEX).getAsString();

            SessionData.compareJsonObjectValue(actualRow, TechnicalTable.MergeValueLineage.ID, expectedId);
            SessionData.compareJsonObjectValue(actualRow, TechnicalTable.MergeValueLineage.MERGING_PROCESS_ID, expectedMergingProcessId);
            SessionData.compareJsonObjectValue(actualRow, TechnicalTable.MergeValueLineage.RECORD_ID, expectedRecordId);
            SessionData.compareJsonObjectValue(actualRow, TechnicalTable.MergeValueLineage.SOURCE_INDEX, expectedSourceIndex);
            SessionData.compareJsonObjectValue(actualRow, TechnicalTable.MergeValueLineage.FIELD_PATH, expectedFieldPath);
            SessionData.compareJsonObjectValue(actualRow, TechnicalTable.MergeValueLineage.GOLDEN_INDEX, expectedGoldenIndex);
        }
    }

    /**
     * Verify the raw data of MergeResult table
     *
     * @param table
     */
    @And("^I will verify table MergeResult as below$")
    public void i_will_verify_table_merge_result_as_below(List<List<String>> table) {
        onCommonSteps.click_on_table_name(MAMEConstants.MERGE_RESULT_TBL);
        JsonArray expectedTbl = SessionData.convertArrayListToJson(table);
        TableObject actualTbl = onDatasetSteps.getDefaultViewTable(MAMEConstants.MERGE_RESULT_TBL);

        for (int i = 0; i < expectedTbl.size(); i++) {
            JsonObject expectedRow = expectedTbl.get(i).getAsJsonObject();
            JsonObject actualRow = actualTbl.getRecord(i);
            String expectedId = expectedRow.get(TechnicalTable.MergeResult.ID).getAsString();
            String expectedRecordId = expectedRow.get(TechnicalTable.MergeResult.RECORD_ID).getAsString().replace("*", "|");
            String expectedGoldenId = expectedRow.get(TechnicalTable.MergeResult.GOLDEN_ID).getAsString().replace("*", "|");
            String expectedMergingProcessId = expectedRow.get(TechnicalTable.MergeResult.MERGING_PROCESS_ID).getAsString();
            String expectIsInterpolation = expectedRow.get(TechnicalTable.MergeResult.IS_INTERPOLATION).getAsString();

            SessionData.compareJsonObjectValue(actualRow, TechnicalTable.MergeResult.ID, expectedId);
            SessionData.compareJsonObjectValue(actualRow, TechnicalTable.MergeResult.RECORD_ID, expectedRecordId);
            SessionData.compareJsonObjectValue(actualRow, TechnicalTable.MergeResult.GOLDEN_ID, expectedGoldenId);
            SessionData.compareJsonObjectValue(actualRow, TechnicalTable.MergeResult.MERGING_PROCESS_ID, expectedMergingProcessId);
            SessionData.compareJsonObjectValue(actualRow, TechnicalTable.MergeResult.IS_INTERPOLATION, expectIsInterpolation);
        }
    }
}