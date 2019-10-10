package com.orchestranetworks.auto.addon.defs;

import java.util.List;
import java.util.Map;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.orchestranetworks.auto.addon.common.DataObject;
import com.orchestranetworks.auto.addon.common.TableObject;
import com.orchestranetworks.auto.addon.steps.CommonSteps;
import com.orchestranetworks.auto.addon.steps.DatasetSteps;
import com.orchestranetworks.auto.addon.steps.ManualMergeSteps;
import com.orchestranetworks.auto.addon.steps.RunMatchSteps;

import com.orchestranetworks.auto.addon.utils.MAMEConstants;
import com.orchestranetworks.auto.addon.utils.SessionData;
import com.orchestranetworks.auto.addon.utils.TechnicalTable;
import cucumber.api.DataTable;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

import static com.orchestranetworks.auto.addon.utils.MAMEConstants.MATCHING_SESSION_TBL;

public class RunMatchDefs {

    @Steps
    RunMatchSteps onRunMatchSteps;

    @Steps
    ManualMergeSteps onManualMergeSteps;

    @Steps
    DatasetSteps onDatasetSteps;

    @Steps
    CommonSteps onCommonSteps;

    private DataObject runMatchData = null;

    /**
     * Verify the Run match information
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">Then</font> the Run Match service is executed with the information as belows
     * <ul>
     * <font color="green">| Matching process | Records to match against |</font>
     * </ul>
     * <ul>
     * <font color="green">| SESSION          | Entire table             |</font>
     * </ul>
     * </ul>
     * </p>
     *
     * @param dt data table information
     */

    @Then("^the Run Match service is executed with the information as belows$")
    public void the_run_match_service_is_executed_with_the_information_as_belows(DataTable dt) {
        onDatasetSteps.select_table_service("Match and Merge > Run match");
        List<Map<String, String>> dataTable = dt.asMaps(String.class, String.class);
        for (Map<String, String> row : dataTable) {
            String matchingProcess = row.get(MAMEConstants.MATCHING_PROCESS);
            String recordToMatch = row.get(MAMEConstants.RECORD_TO_MATCH_AGAINST);

            if (!matchingProcess.isEmpty()) {

            }

            if (!recordToMatch.isEmpty()) {
                onRunMatchSteps.input_run_match(MAMEConstants.RECORD_TO_MATCH_AGAINST, recordToMatch);
            }
        }
        onRunMatchSteps.click_on_run_match();
    }

    /**
     * Click to Run Match button
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">When</font> I click on Run Match button
     * </ul>
     * </p>
     */

    @When("^I complete Run Match process$")
    public void i_complete_run_match_process() {
        onRunMatchSteps.click_on_run_match();
    }

    /**
     * Verify the popup message
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">Then</font> the popup message should be shown <font color="green">
     * "The run match service can't be executed: No matching process is actived. Please check your configuration."</font>
     * </ul>
     * </p>
     *
     * @param message message to be verified
     */
    @Then("^the popup message should be shown \"([^\"]*)\"$")
    public void the_popup_message_should_be_shown(String message) {
        onRunMatchSteps.verify_message_run_match_service_popup(message);
    }

    /**
     * Select matching process record with label
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">Then</font> I select matching process record with label "<color font="green">MPC1</color>"
     * in "<color font="green">Matching process</color>" tab
     * </ul>
     * </p>
     *
     * @param label label of matching process
     * @param tab   Tab name in matching process
     */
    @Given("^I select matching process record with label \"([^\"]*)\" in \"([^\"]*)\" tab$")
    public void i_select_matching_process_record_of_table(String label, String tab) {
        onRunMatchSteps.view_record_with_name(tab, label);
    }

    /**
     * Select matching field record with label
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">Then</font> I select matching field record with label "<color font="green">Residence</color>"
     * in "<color font="green">Matching fields</color>" tab
     * </ul>
     * </p>
     *
     * @param label label of matching process
     * @param tab   Tab name in matching process
     */
    @Given("^I select matching field record with label \"([^\"]*)\" in \"([^\"]*)\" tab$")
    public void i_select_matching_field_record_of_table(String label, String tab) {
        onRunMatchSteps.view_matching_field_record_with_name(tab, label);

    }

    /**
     * Verify the Matching Session table metadata
     *
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">Then</font> the Run Match service is executed with the information as belows
     * <ul>
     * <font color="green">| id | executionDate | matchingProcessId | matchAgainst | matchAgainstStates | phase         |</font>
     * </ul>
     * <ul>
     * <font color="green">| ID | DATE          | 101               | ENTIRE_TABLE |                    | DEDUPLICATION |</font>
     * </ul>
     * </ul>
     * </p>
     *
     * @param expectedTable
     * @throws InterruptedException
     */
    @Then("^I will see table MatchingSession as below$")
    public void iWillSeeTableMatchingSessionAsBelow(List<List<String>> expectedTable) {
        onCommonSteps.click_on_table_name(MATCHING_SESSION_TBL);
        runMatchData = new DataObject();
        JsonArray expectedTbl = SessionData.convertArrayListToJson(expectedTable);
        TableObject actualTable = onDatasetSteps.getDefaultViewTable(MATCHING_SESSION_TBL);
        runMatchData.addTable(actualTable.getTableName(), actualTable.getTable());
        for (int i = 0; i < expectedTbl.size(); i++) {
            JsonObject expectedRow = expectedTbl.get(i).getAsJsonObject();
            JsonObject actualRow = actualTable.getRecord(i);
            String matchingProcessId = expectedRow.get(TechnicalTable.MatchingSession.MATCHING_PROCESS_ID).getAsString();
            String matchAgainst = expectedRow.get(TechnicalTable.MatchingSession.MATCH_AGAINST).getAsString();
            String matchAgainstStates = expectedRow.get(TechnicalTable.MatchingSession.MATCH_AGAINST_STATES).getAsString();
            String phase = expectedRow.get(TechnicalTable.MatchingSession.PHASE).getAsString();

//            SessionData.compareJsonObjectValue(actualRow,
//                    TechnicalTable.MatchingSession.MATCHING_PROCESS_ID, matchingProcessId);
            SessionData.compareJsonObjectValue(actualRow,
                    TechnicalTable.MatchingSession.MATCH_AGAINST, matchAgainst);
            SessionData.compareJsonObjectValue(actualRow,
                    TechnicalTable.MatchingSession.MATCH_AGAINST_STATES, matchAgainstStates);
            SessionData.compareJsonObjectValue(actualRow,
                    TechnicalTable.MatchingSession.PHASE, phase);
        }
    }

    /**
     * Verify the Matching Result table metadata
     * <p>
     * If the Matching table has multiple PK, use "*" instead of "|" to seperate PK to avoid broking data table
     * </p>
     *
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">Then</font> the Run Match service is executed with the information as belows
     * <ul>
     * <font color="green">| id    | sourceId | targetId | lastResult  | sessionId |</font>
     * </ul>
     * <ul>
     * <font color="green">| 1*1~~ | 1*1      |          | NOT_MATCHED | SESSIONID |</font>
     * </ul>
     * </ul>
     * </p>
     * @param expectedTable
     */
    @Then("^I will see table MatchingResult as below$")
    public void iWillSeeTableMatchingResultAsBelow(List<List<String>> expectedTable) {
        onCommonSteps.click_on_table_name(MAMEConstants.MATCHING_RESULT_TBL);
        JsonArray expectedTbl = SessionData.convertArrayListToJson(expectedTable);
        TableObject actualTable = onDatasetSteps.getDefaultViewTable(MAMEConstants.MATCHING_RESULT_TBL);
        runMatchData.addTable(actualTable.getTableName(), actualTable.getTable());
        String sessionId = TableObject.takeTable(runMatchData, MAMEConstants.MATCHING_SESSION_TBL)
                .getRecord(0).getAsJsonObject()
                .get(TechnicalTable.MatchingSession.ID)
                .getAsString();
        for (int i = 0; i < expectedTbl.size(); i++) {
            JsonObject expectedRow = expectedTbl.get(i).getAsJsonObject();
            JsonObject actualRow = actualTable.getRecord(i);
            String id = expectedRow.get(TechnicalTable.MatchingResult.ID).getAsString().
                    concat(sessionId).replace("*", "|");
            String sourceId = expectedRow.get(TechnicalTable.MatchingResult.SOURCE_ID).getAsString().replace("*", "|");
            String targetId = expectedRow.get(TechnicalTable.MatchingResult.TARGET_ID).getAsString();
            String lastResult = expectedRow.get(TechnicalTable.MatchingResult.LAST_RESULT).getAsString();

            SessionData.compareJsonObjectValue(actualRow,
                    TechnicalTable.MatchingResult.ID, id);
            SessionData.compareJsonObjectValue(actualRow,
                    TechnicalTable.MatchingResult.SOURCE_ID, sourceId);
            SessionData.compareJsonObjectValue(actualRow,
                    TechnicalTable.MatchingResult.TARGET_ID, targetId);
            SessionData.compareJsonObjectValue(actualRow,
                    TechnicalTable.MatchingResult.LAST_RESULT, lastResult);
            SessionData.compareJsonObjectValue(actualRow,
                    TechnicalTable.MatchingResult.SESSION_ID, sessionId);
        }
    }
}
