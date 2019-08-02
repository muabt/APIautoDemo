package com.orchestranetworks.auto.addon.common.defs;

import java.util.List;
import java.util.Map;

import com.orchestranetworks.auto.addon.common.steps.DataspaceSteps;

import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import net.thucydides.core.annotations.Steps;

public class DataspaceDefs {
	@Steps
	DataspaceSteps onDataspaceSteps;

	@And("^I create child Dataspace with information as following$")
	public void user_creates_child_dataspace_with_information_as_following(DataTable dt) throws Throwable {
		List<Map<String, String>> dataTable = dt.asMaps(String.class, String.class);
		onDataspaceSteps.click_btn_create_dataspace();
		Map<String, String> row = dataTable.get(0);
		String identifier = row.get("Identifier");
		String owner = row.get("Owner");
		String engLabel = row.get("English Label");

		if (!identifier.isEmpty()) {
			onDataspaceSteps.enter_identifier(identifier);
		}
		if (!owner.isEmpty()) {
			onDataspaceSteps.select_owner(owner);

		}
		if (!engLabel.isEmpty()) {
			onDataspaceSteps.enter_english_label(engLabel);

		}
		onDataspaceSteps.click_btn_create();

	}

	@And("^I select dataspace service \"([^\"]*)\"$")
	public void user_select_dataspace_service_something(String servicePath) throws Throwable {
		onDataspaceSteps.click_dataspace_actions();
		onDataspaceSteps.select_dataspace_service(servicePath);

	}

	@Then("^I should see Dataspace with information as following$")
	public void user_should_see_dataspace_with_information_as_following(DataTable dt) throws Throwable {
	}
}
