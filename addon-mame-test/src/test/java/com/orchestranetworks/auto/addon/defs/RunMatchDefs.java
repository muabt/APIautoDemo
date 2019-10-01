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
     * Check the Run Match information
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">Then</font> I should see run match with information as following
     *      <ul>
     * 			     <font color="green"></font>
     *     </ul>
     *     <ul>
     * 			     <font color="green"></font>
     *     </ul>
     * </ul>
     * </p>
     *
     * @param dt
     * @throws Throwable
     */

    @Then("^the Run Match service is executed with the information as belows$")
    public void the_run_match_service_is_executed_with_the_information_as_belows(DataTable dt) {
        onDatasetSteps.select_table_service("Match and Merge > Run match");
        List<Map<String, String>> dataTable = dt.asMaps(String.class, String.class);
        Map<String, String> row = dataTable.get(0);
        onRunMatchSteps.input_run_match(row);
    }
    
    @When("^I click on Run Match button$")
    public void click_on_run_match_button() {
        onRunMatchSteps.click_on_run_match();
    }

    @Then("^the popup message should be shown \"([^\"]*)\"$")
    public void the_popup_message_should_be_shown(String message){
        onRunMatchSteps.verify_message_run_match_service_popup(message);
    }
    
    @Given("^I select matching process record with label \"([^\"]*)\" in \"([^\"]*)\" tab$")
    public void i_select_matching_process_record_of_table(String label, String tab) {
    	onRunMatchSteps.view_record_with_name(tab, label);
    }
    
    @Given("^I select matching field record with label \"([^\"]*)\" in \"([^\"]*)\" tab$")
    public void i_select_matching_field_record_of_table(String label, String tab) {
    	onRunMatchSteps.view_matching_field_record_with_name(tab, label);
    	
    }
    

}
