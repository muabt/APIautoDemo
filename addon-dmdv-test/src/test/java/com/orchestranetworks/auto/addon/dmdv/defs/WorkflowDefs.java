package com.orchestranetworks.auto.addon.dmdv.defs;

import org.junit.Assert;
import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.dmdv.steps.GraphViewSteps;
import com.orchestranetworks.auto.addon.dmdv.steps.WorkflowSteps;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import net.thucydides.core.annotations.ClearCookiesPolicy;
import net.thucydides.core.annotations.Managed;
import net.thucydides.core.annotations.Steps;

public class WorkflowDefs {
	@Managed(clearCookies = ClearCookiesPolicy.BeforeEachTest)
	WebDriver driver;
	
	@Steps
	GraphViewSteps onGraphViewSteps;
	
	@Steps
	WorkflowSteps onWorkflowSteps;
	
	 @Given("^user accesses Data workflows menu$")
	    public void user_accesses_data_workflows_menu() throws Throwable {
		 	onWorkflowSteps.click_on_data_workflows_menu();
	    }

	    @Given("^user accesses Workflow launchers$")
	    public void user_accesses_workflow_launchers() throws Throwable {
	    	onWorkflowSteps.click_on_workflow_launchers();
	    }

	    @And("^user lunch workflow model \"([^\"]*)\"$")
	    public void user_lunch_workflow_model_something(String workflowname) throws Throwable {
	        onWorkflowSteps.click_on_launch_button(workflowname);
	    }
	    
	    @Given("^user accesses to Inbox$")
	    public void user_accesses_to_inbox() throws Throwable {
	    	onWorkflowSteps.click_on_inbox();
	    }
	    
	    @And("^user start work item$")
	    public void user_start_work_item() throws Throwable {
	        onWorkflowSteps.click_on_start_work_item();
	    }
	    
	    @Then("^the popup message should be displayed \"([^\"]*)\"$")
	    public void the_popup_message_should_be_displayed_something(String msg) throws Throwable {
	    	  String actualmsg = onWorkflowSteps.get_notification_message();
			  Assert.assertEquals(msg, actualmsg);
	    }
}
