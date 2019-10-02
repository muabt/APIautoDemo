package com.orchestranetworks.auto.addon.defs;

import java.util.List;
import java.util.Map;

import com.orchestranetworks.auto.addon.steps.DatasetSteps;
import com.orchestranetworks.auto.addon.steps.ManualMergeSteps;
import com.orchestranetworks.auto.addon.steps.RunMatchSteps;

import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

public class RunMatchDefs {
	
	@Steps
	RunMatchSteps onRunMatchSteps;
	
	@Steps
	ManualMergeSteps onManualMergeSteps;

	@Steps
    DatasetSteps onDatasetSteps;

	/**
     * Verify the Run match information
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">Then</font> the Run Match service is executed with the information as belows
     *      <ul>
     * 			     <font color="green">| Matching process | Records to match against |</font>
     *     </ul>
     *     <ul>
     * 			     <font color="green">| SESSION          | Entire table             |</font>
     *     </ul>
     * </ul>
     * </p>
     *
     * @param dt data table information
     */

    @Then("^the Run Match service is executed with the information as belows$")
    public void the_run_match_service_is_executed_with_the_information_as_belows(DataTable dt) {
        onDatasetSteps.select_table_service("Match and Merge > Run match");
        List<Map<String, String>> dataTable = dt.asMaps(String.class, String.class);
        Map<String, String> row = dataTable.get(0);
        onRunMatchSteps.input_run_match(row);
    }

    /**
     * Click to Run Match button
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">When</font> I click on Run Match button
     * </ul>
     * </p>
     *
     */
    @When("^I click on Run Match button$")
    public void click_on_run_match_button() {
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
     * @param message message to be verified
     */
    @Then("^the popup message should be shown \"([^\"]*)\"$")
    public void the_popup_message_should_be_shown(String message){
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
     * @param label label of matching process
     * @param tab Tab name in matching process
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
     * @param label label of matching process
     * @param tab Tab name in matching process
     */
    @Given("^I select matching field record with label \"([^\"]*)\" in \"([^\"]*)\" tab$")
    public void i_select_matching_field_record_of_table(String label, String tab) {
    	onRunMatchSteps.view_matching_field_record_with_name(tab, label);
    	
    }
    

}
