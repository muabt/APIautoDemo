package com.orchestranetworks.auto.addon.defs;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.orchestranetworks.auto.addon.common.DataObject;
import com.orchestranetworks.auto.addon.common.TableObject;
import com.orchestranetworks.auto.addon.steps.ChangeStateSteps;
import com.orchestranetworks.auto.addon.steps.DatasetSteps;
import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.utils.MAMEConstants;
import com.orchestranetworks.auto.addon.utils.SessionData;
import com.orchestranetworks.auto.addon.utils.TechnicalTable;
import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

import static org.assertj.core.api.Assertions.assertThat;

import com.orchestranetworks.auto.addon.steps.CommonSteps;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class ChangeStateDefs {
    @Steps
    ChangeStateSteps onChangeStateSteps;
    @Steps
    CommonSteps onCommonSteps;
    private DataObject mergedRecord;
    @Steps
    DatasetSteps onDatasetSteps;

    @Then("^change state screen will be displayed with the title \"([^\"]*)\"$")
    public void change_state_screen_will_be_displayed_with_the_title(String stateDes) {
        onChangeStateSteps.verify_state_descriptions(stateDes);
    }

    @And("^I complete change state process$")
    public void i_complete_change_state_process() {
        onChangeStateSteps.click_button_launch_service();
    }

    @When("^I select target state is Golden$")
    public void i_select_target_state_is_golden() {
        onChangeStateSteps.select_golden_state();
    }

    @When("^I select target state is Unset$")
    public void iSelectTargetStateIsUnset() {
        onChangeStateSteps.select_target_state();
    }

    @Then("^the \"([^\"]*)\" dataset is not created under this dataspaces$")
    public void the_dataset_is_not_created_under_this_dataspaces(String metadataSet) {
        onChangeStateSteps.verify_dataset_not_existed(metadataSet);

    }

    @Then("^I will see table RecordMetadata before changing as below$")
    public void iWillSeeTableRecordMetadataBeforeChangingAsBelow(List<List<String>> dt) {
        JsonArray expectedTbl = SessionData.convertArrayListToJson(dt);
        //Filter selected record by Functional ID
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
        //Loop for verify
        TableObject actualTbl = onDatasetSteps.getDefaultViewTable(MAMEConstants.RECORD_METADATA_TBL);
        for (int i = 0; i < expectedTbl.size(); i++) {
            JsonObject expected = expectedTbl.get(i).getAsJsonObject();
            JsonObject actual = actualTbl.getRecord(i);

            String state = expected.get(TechnicalTable.RecordMetadata.STATE).getAsString();
            String autoCreated = expected.get(TechnicalTable.RecordMetadata.AUTO_CREATED).getAsString();
            String functionalID = expected.get(TechnicalTable.RecordMetadata.FUNCTIONAL_ID).getAsString().replace("*", "|");

            if (!state.isEmpty()) {
                SessionData.compareJsonObjectValue(actual, TechnicalTable.RecordMetadata.STATE, state);
            }
            if (!autoCreated.isEmpty()) {
                SessionData.compareJsonObjectValue(actual, TechnicalTable.RecordMetadata.AUTO_CREATED, autoCreated);
            }
            if (!functionalID.isEmpty()) {
                SessionData.compareJsonObjectValue(actual, TechnicalTable.RecordMetadata.FUNCTIONAL_ID, functionalID);
            }

        }
        DataObject selectedRecord = new DataObject();
        selectedRecord.addTable(MAMEConstants.RECORD_METADATA_TBL, actualTbl.getTable());
        SessionData.saveDataObjectToSession(MAMEConstants.CHANGE_STATE_DATA_OBJECT, selectedRecord);

    }

    @Then("^I will see table RecordMetadata after changing as below$")
    public void iWillSeeTableRecordMetadataAfterChangingAsBelow(List<List<String>> dt) {
        JsonArray expectedTbl = SessionData.convertArrayListToJson(dt);
        //Filter selected record by Functional ID
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
        TableObject actualTbl = onDatasetSteps.getDefaultViewTable("RECORD_METADATA_AFTER_CHANGING");
        TableObject sessionTbl = TableObject.takeTable(SessionData.getDataObjectFromSession(MAMEConstants.CHANGE_STATE_DATA_OBJECT), MAMEConstants.RECORD_METADATA_TBL);

        for (int i = 0; i < expectedTbl.size(); i++) {
            JsonObject session = sessionTbl.getRecord(i);
            JsonObject expected = expectedTbl.get(i).getAsJsonObject();
            JsonObject actual = actualTbl.getRecord(i);

            String state = expected.get(TechnicalTable.RecordMetadata.STATE).getAsString();
            String autoCreated = expected.get(TechnicalTable.RecordMetadata.AUTO_CREATED).getAsString();
            String functionalID = expected.get(TechnicalTable.RecordMetadata.FUNCTIONAL_ID).getAsString().replace("*", "|");
            String groupFromSession = session.get(TechnicalTable.RecordMetadata.GROUP_ID).getAsString();
            String groupFromFeature = expected.get(TechnicalTable.RecordMetadata.GROUP_ID).getAsString();
            String actualGroup = actual.get(TechnicalTable.RecordMetadata.GROUP_ID).getAsString();

            if (!state.isEmpty()) {
                SessionData.compareJsonObjectValue(actual, TechnicalTable.RecordMetadata.STATE, state);
            }
            if (!autoCreated.isEmpty()) {
                SessionData.compareJsonObjectValue(actual, TechnicalTable.RecordMetadata.AUTO_CREATED, autoCreated);
            }
            if (!functionalID.isEmpty()) {
                SessionData.compareJsonObjectValue(actual, TechnicalTable.RecordMetadata.FUNCTIONAL_ID, functionalID);
            }
            if (!groupFromFeature.isEmpty()) {
                assertThat(actualGroup).isNotEqualTo(groupFromSession);
            } else {
                assertThat(actualGroup).isNullOrEmpty();
            }

        }

    }

    @And("^I will see table MergingProcess after changing as below$")
    @Then("^I will see table MergingProcess before changing as below$")
    public void iWillSeeTableMergingProcessBeforeChangingAsBelow(List<List<String>> dt) {
        JsonArray expectedTbl = SessionData.convertArrayListToJson(dt);

        TableObject actualTbl = onDatasetSteps.getDefaultViewTable("MERGING_PROCESS_BEFORE_CHANGING");
        DataObject dataObject = new DataObject();
        dataObject.addTable(MAMEConstants.MERGING_PROCESS_TBL, actualTbl.getTable());
        SessionData.saveDataObjectToSession("MERGING_PROCESS_BEFORE_CHANGING", dataObject);

        for (int i = 0; i < expectedTbl.size(); i++) {
            JsonObject expected = expectedTbl.get(i).getAsJsonObject();
            JsonObject actual = actualTbl.getRecord(i);

            String id = expected.get(TechnicalTable.MergingProcess.ID).getAsString();
            String mergePolicyID = expected.get(TechnicalTable.MergingProcess.MERGE_POLICY_ID).getAsString();
            String mergeMode = expected.get(TechnicalTable.MergingProcess.MERGE_MODE).getAsString();
            String executionDate = expected.get(TechnicalTable.MergingProcess.EXECUTION_DATE).getAsString();
            String snapshotId = actual.get(TechnicalTable.MergingProcess.SNAPSHOT_ID).getAsString();
            String groupId = actual.get(TechnicalTable.MergingProcess.GROUP_ID).getAsString();
            String user = actual.get(TechnicalTable.MergingProcess.USER).getAsString();
            String isUnmerged = actual.get(TechnicalTable.MergingProcess.IS_UNMERGED).getAsString();

            SessionData.compareJsonObjectValue(actual, TechnicalTable.MergingProcess.ID, id);
            SessionData.compareJsonObjectValue(actual, TechnicalTable.MergingProcess.MERGE_POLICY_ID, mergePolicyID);
            SessionData.compareJsonObjectValue(actual, TechnicalTable.MergingProcess.MERGE_MODE, mergeMode);
            SessionData.compareJsonObjectValue(actual, TechnicalTable.MergingProcess.EXECUTION_DATE, executionDate);
            SessionData.compareJsonObjectValue(actual, TechnicalTable.MergingProcess.SNAPSHOT_ID, snapshotId);
            SessionData.compareJsonObjectValue(actual, TechnicalTable.MergingProcess.GROUP_ID, groupId);
            SessionData.compareJsonObjectValue(actual, TechnicalTable.MergingProcess.USER, user);
            SessionData.compareJsonObjectValue(actual, TechnicalTable.MergingProcess.IS_UNMERGED, isUnmerged);
        }

    }
}

