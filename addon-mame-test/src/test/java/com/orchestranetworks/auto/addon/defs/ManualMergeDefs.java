package com.orchestranetworks.auto.addon.defs;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.orchestranetworks.auto.addon.common.DataObject;
import com.orchestranetworks.auto.addon.common.KeyObject;
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

import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.serenitybdd.core.Serenity;
import net.thucydides.core.annotations.Steps;
import org.jetbrains.annotations.NotNull;
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
    private String autoCreatedRecordPK = "";

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
        TableObject expectedTbl = SessionData.convertArrayListToTableObject(MAMEConstants.RECORD_METADATA_TBL, recordMetadataExpect);
        mergedRecord = SessionData.getDataObjectFromSession(Constants.DATA_OBJECT);

        // Filter selected record by Functional ID
        List<Map<String, String>> filterConditions = new ArrayList<Map<String, String>>();
        for (int i = 0; i < expectedTbl.size(); i++) {
            JsonObject record = expectedTbl.getRecord(i).getAsJsonObject();
            filterConditions.add(filterCondition(TechnicalTable.RecordMetadata.FUNCTIONAL_ID, "equals", record.get(TechnicalTable.RecordMetadata.FUNCTIONAL_ID).getAsString().replace("*", "|"), Constants.INPUT_TYPE));
        }
        onCommonSteps.search_with_advance_search(Constants.AT_LEAST_ONE_MATCHES, filterConditions);

        // Filter by group id if golden record is auto generated
        String actualGroupID = onManualMergeSteps.get_groupID();
        if (expectedTbl.size() > mergedRecord.getPKs().size()) {
            filterConditions = new ArrayList<Map<String, String>>();
            onCommonSteps.delete_all_occurrence();
            filterConditions.add(filterCondition(TechnicalTable.RecordMetadata.GROUP_ID, "=", actualGroupID, Constants.INPUT_TYPE));
            onCommonSteps.input_search_condition(filterConditions);
            onCommonSteps.click_btn_apply_advanced_search();
        }

        TableObject actualTbl = onDatasetSteps.getDefaultViewTable(MAMEConstants.RECORD_METADATA_TBL);
        mergedRecord.addTable(actualTbl.getTableName(), actualTbl.getTable());
        // verify size of actual and expected table
        assertThat(actualTbl.size()).isEqualTo(expectedTbl.size());

        //Loop for verify detail
        for (int i = 0; i < expectedTbl.size(); i++) {
            String functionalID = expectedTbl.getRecord(i).getAsJsonObject()
                    .get(TechnicalTable.RecordMetadata.FUNCTIONAL_ID).getAsString().replace("*", "|");

            if (functionalID.toLowerCase().equals("[last]")) {
                functionalID = autoCreatedRecordPK;
                expectedTbl.getRecord(i).addProperty(TechnicalTable.RecordMetadata.FUNCTIONAL_ID, autoCreatedRecordPK);

            }
            JsonArray expected = expectedTbl.filter(TechnicalTable.RecordMetadata.FUNCTIONAL_ID, functionalID);
            JsonArray actual = actualTbl.filter(TechnicalTable.RecordMetadata.FUNCTIONAL_ID, functionalID);
            assertThat(actual.size()).isEqualTo(expected.size()).isEqualTo(1).withFailMessage("Actual size =" + actual.size() + ", expected size =" + expected.size());

            JsonObject expectedRecord = expected.get(0).getAsJsonObject();
            JsonObject actualRecord = actual.get(0).getAsJsonObject();

            String groupID = expectedRecord.get(TechnicalTable.RecordMetadata.GROUP_ID).getAsString();
            String state = expectedRecord.get(TechnicalTable.RecordMetadata.STATE).getAsString();
            String autoCreated = expectedRecord.get(TechnicalTable.RecordMetadata.AUTO_CREATED).getAsString();

            if (!groupID.isEmpty()) {
                SessionData.compareJsonObjectValue(actualRecord, TechnicalTable.RecordMetadata.GROUP_ID, actualGroupID);
            }
            if (!state.isEmpty()) {
                SessionData.compareJsonObjectValue(actualRecord, TechnicalTable.RecordMetadata.STATE, state);
            }
            if (!autoCreated.isEmpty()) {
                SessionData.compareJsonObjectValue(actualRecord, TechnicalTable.RecordMetadata.AUTO_CREATED, autoCreated);
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
/*
        // get Merging process ID with groupID in RecordMetadata table
        String groupID = TableObject.takeTable(mergedRecord, MAMEConstants.RECORD_METADATA_TBL)
                .getRecord(0).getAsJsonObject()
                .get(TechnicalTable.RecordMetadata.GROUP_ID).getAsString();*/

        String mergingProcessID = TableObject.takeTable(mergedRecord, MAMEConstants.MERGE_RESULT_TBL)
                .getRecord(0).getAsJsonObject()
                .get(TechnicalTable.MergeResult.MERGING_PROCESS_ID).getAsString();

        // Filter selected record by GroupID
        List<Map<String, String>> filterConditions = new ArrayList<Map<String, String>>();
        filterConditions.add(filterCondition(TechnicalTable.MergingProcess.ID, "=", mergingProcessID, Constants.INPUT_TYPE));
        onCommonSteps.search_with_advance_search(Constants.AT_LEAST_ONE_MATCHES, filterConditions);

        // Save table to DataObject in session
        TableObject actualTbl = onDatasetSteps.getDefaultViewTable(MAMEConstants.MERGING_PROCESS_TBL);
        mergedRecord.addTable(actualTbl.getTableName(), actualTbl.getTable());

        for (int i = 0; i < expectedTbl.size(); i++) {
            JsonObject expectedRow = expectedTbl.get(i).getAsJsonObject();
            JsonObject actualRow = actualTbl.getRecord(i);

            String mergePolicyId = expectedRow.get(TechnicalTable.MergingProcess.MERGE_POLICY_ID).getAsString();
            String mergeMode = expectedRow.get(TechnicalTable.MergingProcess.MERGE_MODE).getAsString();
            String executionDate = expectedRow.get(TechnicalTable.MergingProcess.EXECUTION_DATE).getAsString();
            String snapshotId = expectedRow.get(TechnicalTable.MergingProcess.SNAPSHOT_ID).getAsString();
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
            if (!mergePolicyId.isEmpty()) {
                assertThat(actualRow.get(TechnicalTable.MergingProcess.MERGE_POLICY_ID).getAsString()).isNullOrEmpty();
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

        String goldenID = TableObject.takeTable(mergedRecord, MAMEConstants.RECORD_METADATA_TBL).filter(TechnicalTable.RecordMetadata.STATE, "Golden")
                .get(0).getAsJsonObject()
                .get(TechnicalTable.RecordMetadata.FUNCTIONAL_ID).getAsString();
        // Filter selected record by golden record
        List<Map<String, String>> filterConditions = new ArrayList<Map<String, String>>();
        filterConditions.add(filterCondition(TechnicalTable.MergeResult.GOLDEN_ID, "equals", goldenID, Constants.INPUT_TYPE));
        onCommonSteps.search_with_advance_search(Constants.AT_LEAST_ONE_MATCHES, filterConditions);

        // Save table to DataObject in session
        TableObject actualTbl = onDatasetSteps.getDefaultViewTable(MAMEConstants.MERGE_RESULT_TBL);
        mergedRecord.addTable(actualTbl.getTableName(), actualTbl.getTable());

        for (int i = 0; i < expectedTbl.size(); i++) {
            JsonObject expectedRow = expectedTbl.get(i).getAsJsonObject();
            JsonObject actualRow = actualTbl.getRecord(i);

            String recordId = expectedRow.get(TechnicalTable.MergeResult.RECORD_ID).getAsString().replace("*", "|");
            String goldenId = expectedRow.get(TechnicalTable.MergeResult.GOLDEN_ID).getAsString().replace("*", "|");
            String mpID = expectedRow.get(TechnicalTable.MergeResult.MERGING_PROCESS_ID).getAsString();
            String isInterpolation = expectedRow.get(TechnicalTable.MergeResult.IS_INTERPOLATION).getAsString();

            if (!recordId.isEmpty()) {
                SessionData.compareJsonObjectValue(actualRow, TechnicalTable.MergeResult.RECORD_ID, recordId);
            }
            if (!goldenId.isEmpty()) {
                if (goldenId.equalsIgnoreCase("[Last]"))
                    goldenId = goldenID;
                SessionData.compareJsonObjectValue(actualRow, TechnicalTable.MergeResult.GOLDEN_ID, goldenId);

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
        filterConditions.add(filterCondition(TechnicalTable.MergeResult.MERGING_PROCESS_ID, "", mpID, Constants.ENUMERATION));
        onCommonSteps.search_with_advance_search(Constants.AT_LEAST_ONE_MATCHES, filterConditions);

        TableObject actualTbl = onDatasetSteps.getDefaultViewTable(MAMEConstants.DECISION);
        mergedRecord.addTable(actualTbl.getTableName(), actualTbl.getTable());

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

    @NotNull
    private Map<String, String> filterCondition(String criterion, String operation, String value, String fieldType) {
        Map<String, String> condition = new HashMap<String, String>();
        condition.put(Constants.CRITERION, criterion);
        condition.put(Constants.OPERATION, operation);
        condition.put(Constants.VALUE, value);
        condition.put(Constants.FIELD_TYPE, fieldType);
        return condition;
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
        assertThat(actualTbl.size()).isGreaterThan(0).withFailMessage("Expected table has number of record > 0 but was:" + actualTbl.size());
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

    @And("^I see an exception error popup \"([^\"]*)\"$")
    public void i_see_an_exception_error_popup(String expectedError) {
        onManualMergeSteps.verify_exception_error_popup(expectedError);

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

    @Then("^no record found in table \"([^\"]*)\" with following information$")
    public void noRecordFoundInTableWithFollowingInformation(String tblName, List<List<String>> table) {
        onCommonSteps.click_on_table_name(tblName);
        JsonArray expectedTbl = SessionData.convertArrayListToJson(table);
        // Filter selected record by Merging process ID
        List<Map<String, String>> filterConditions = new ArrayList<Map<String, String>>();
        for (int i = 0; i < expectedTbl.size(); i++) {
            Map<String, String> condition = new HashMap<String, String>();
            JsonObject record = expectedTbl.get(i).getAsJsonObject();

            condition.put(Constants.CRITERION, "mergingProcessId");
            condition.put(Constants.OPERATION, "");
            String value = record.get("mergingProcessId").getAsString();

            if (!value.toLowerCase().equals("auto_generated")) {
                value = TableObject.takeTable(mergedRecord, MAMEConstants.MERGING_PROCESS_TBL)
                        .getRecord(0).getAsJsonObject()
                        .get(TechnicalTable.MergingProcess.ID).getAsString();
            }
            condition.put(Constants.VALUE, value);
            condition.put(Constants.FIELD_TYPE, Constants.ENUMERATION);
            filterConditions.add(condition);
        }
        onCommonSteps.search_with_advance_search(Constants.AT_LEAST_ONE_MATCHES, filterConditions);
        onCommonSteps.verify_table_no_record_found();
    }

    @When("^I want to merge some records with primary key is filtered as following$")
    public void iWantToMergeSomeRecordsWithPrimaryKeyIsFilteredAsFollowing(List<List<String>> dt) {
        onCommonSteps.refreshSearch();
        List<Map<String, String>> filterConditions = new ArrayList<Map<String, String>>();
        List<String> headers = dt.get(0);
        DataObject dataObject = new DataObject();
        KeyObject keyObject = null;
        for (int i = 1; i < dt.size(); i++) {
            List<String> row = dt.get(i);
            keyObject = new KeyObject();
            for (int j = 0; j < headers.size(); j++) {
                String pk = row.get(j);
                if (pk.toLowerCase().equals("[last]")) {
                    pk = onCommonSteps.get_last_record_pk();
                    autoCreatedRecordPK = pk;
                }
                keyObject.addPK(headers.get(j), pk);
                filterConditions.add(filterCondition(headers.get(j), "equals", pk, Constants.INPUT_TYPE));
            }
            dataObject.addPK(keyObject);
        }
        SessionData.saveDataObjectToSession(Constants.DATA_OBJECT, dataObject);

        onCommonSteps.search_with_advance_search(Constants.AT_LEAST_ONE_MATCHES, filterConditions);
        for (int i = 1; i < dt.size(); i++) {
            List<String> row = dt.get(i);
            onDatasetSteps.select_record_with_PK(row);
        }
        onDatasetSteps.select_table_service("Match and Merge > Merge");
    }

    @When("^I want to merge some records with primary key as following$")
    public void iWantToMergeSomeRecordsWithPrimaryKeyAsFollowing(List<List<String>> dt) {
        onDatasetSteps.unselect_all();
        List<String> headers = dt.get(0);
        DataObject dataObject = new DataObject();
        KeyObject keyObject = null;
        for (int i = 1; i < dt.size(); i++) {
            List<String> row = dt.get(i);
            keyObject = new KeyObject();
            for (int j = 0; j < headers.size(); j++) {
                String pk = row.get(j);
                if (pk.toLowerCase().equals("[last]")) {
                    pk = onCommonSteps.get_last_record_pk();
                    autoCreatedRecordPK = pk;
                }
                keyObject.addPK(headers.get(j), pk);
            }
            dataObject.addPK(keyObject);
            onDatasetSteps.select_record_with_PK(row);
        }
        SessionData.saveDataObjectToSession(Constants.DATA_OBJECT, dataObject);
        onDatasetSteps.select_table_service("Match and Merge > Merge");
    }

    @Then("^records should be merged successful$")
    public void recordsShouldBeMergedSuccessful() {
        onManualMergeSteps.click_button_next();
        onManualMergeSteps.click_button_merge();
        onManualMergeSteps.click_btn_back_to_main_view();
    }

    @Then("^merge process will be blocked with exception message \"([^\"]*)\"$")
    public void merge_process_iwll_be_blocked_with_exception_message(String message) {
        onManualMergeSteps.click_button_next();
        onManualMergeSteps.click_button_merge();
        onManualMergeSteps.verify_exception_error_popup(message);
    }

    @When("^I decide to select value for golden record as following$")
    public void i_decide_to_select_value_for_golden_record_as_following(List<List<String>> dt) {
        List<String> headers = dt.get(0);
        for (int i = 1; i < dt.size(); i++) {
            List<String> rc = dt.get(i);
            for (int j = 0; j < headers.size(); j++) {
                String value = rc.get(j);
                if (!value.isEmpty()) {
                    onManualMergeSteps.select_golden_value(1, j + 1, value);
                }
            }
        }
    }


    @And("^preview table which has auto created PK is displayed as below$")
    public void previewTableWhichHasAutoCreatedPKIsDisplayedAsBelow(List<List<String>> tablePreview) {
        onManualMergeSteps.verify_table_preview_has_auto_created_pk(tablePreview);
    }

    @When("^multi value field \"([^\"]*)\" is defined as below$")
    public void multiValueFieldIsDefinedAsBelow(String fieldName, DataTable dt)  {
        List<Map<String, String>> dataTable = dt.asMaps(String.class, String.class);
       onManualMergeSteps.select_multi_value_field(fieldName);
       dataTable.forEach(row ->{
           String recordLabel = row.get("Field label");
           String value = row.get("Selected value");
           onManualMergeSteps.select_relation_value(recordLabel,value);

       });
       onManualMergeSteps.click_button_done();

    }

    @And("^all relation records should be updated$")
    public void allRelationRecordsShouldBeUpdated() {
        onManualMergeSteps.click_button_next();
        onManualMergeSteps.select_all_relation_value();
    }
}