package com.orchestranetworks.auto.addon.defs;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.orchestranetworks.auto.addon.steps.RunMatchSteps;

import cucumber.api.DataTable;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

public class RunMatchDefs {
	
	@Steps
	RunMatchSteps onRunMatchSteps;
	
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

}
