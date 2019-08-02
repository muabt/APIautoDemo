package com.orchestranetworks.auto.addon.dmdv.defs;

import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.dmdv.steps.PerspectiveSteps;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import net.thucydides.core.annotations.ClearCookiesPolicy;
import net.thucydides.core.annotations.Managed;
import net.thucydides.core.annotations.Steps;

public class PerspectiveDefs {
	@Managed(clearCookies = ClearCookiesPolicy.BeforeEachTest)
	WebDriver driver;

	@Steps
	PerspectiveSteps onPerspectiveSteps;

	//Run service from perspective
	@Given("^user accesses select perspective menu$")
	public void user_accesses_select_perspective_menu() throws Throwable {
		onPerspectiveSteps.click_on_perspective_menu();
	}

	@Given("^user accesses perspective \"([^\"]*)\"$")
	public void user_accesses_perspective_something(String perspectivename) throws Throwable {
		onPerspectiveSteps.select_perspective(perspectivename);
	}

	@And("^user select action \"([^\"]*)\"$")
	public void user_select_action_something(String actionname) throws Throwable {
		onPerspectiveSteps.select_action(actionname);
	}

	// Select graph configuration screen
	@Then("^the select graph configuration should be displayed$")
	public void the_select_graph_configuration_should_be_displayed() throws Throwable {
		onPerspectiveSteps.verify_select_graph_config();
	}
}
