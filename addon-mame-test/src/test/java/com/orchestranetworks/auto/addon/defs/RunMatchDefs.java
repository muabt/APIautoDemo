package com.orchestranetworks.auto.addon.defs;

import java.util.List;
import java.util.Map;

import com.orchestranetworks.auto.addon.steps.ManualMergeSteps;
import com.orchestranetworks.auto.addon.steps.RunMatchSteps;

import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.annotations.Steps;

public class RunMatchDefs {
	
	@Steps
	RunMatchSteps onRunMatchSteps;
	
	@Steps
	ManualMergeSteps onManualMergeSteps;
	
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
    @Then("^I should see Run Match with information as following$")
    public void user_should_see_run_match_with_information_as_following(DataTable dt) throws Throwable {
        List<Map<String, String>> dataTable = dt.asMaps(String.class, String.class);
        Map<String, String> row = dataTable.get(0);
        onRunMatchSteps.input_run_match(row);
    }
    
    @When("^I click on Run Match button$")
    public void click_on_run_match_button() throws Throwable {
        onRunMatchSteps.click_on_run_match();
    }
    
    @Then("^Verify message Run Match service can not be executed. No matching process is actived$")
    public void verify_message_run_match_service_can_not_executed_by_no_matching_process_is_actived() throws Throwable {
        onRunMatchSteps.verify_message_run_match_service_can_not_executed_by_no_matching_process_is_actived();
    }
    
    @Then("^Verify message Run Match service can not be executed. No Decision Tree is configured$")
    public void verify_message_run_match_service_can_not_executed_by_no_decision_tree_is_configured() throws Throwable {
        onRunMatchSteps.verify_message_run_match_service_can_not_executed_by_no_decision_tree_is_configured();
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
