package com.orchestranetworks.auto.addon.defs;

import java.util.List;

import com.orchestranetworks.auto.addon.steps.ManualMergeSteps;
import com.orchestranetworks.auto.addon.steps.MetadataSteps;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

public class MetadataDefs {
	@Steps
	MetadataSteps onMetadataSteps;

	@Then("^I should list tabs are \"([^\"]*)\"$")
	public void i_should_list_tabs_are_something(List<String> listTab) throws Exception {
		onMetadataSteps.verify_list_tabs(listTab);
	}

	@When("^I want to verify data displayed in main tab$")
	public void i_want_to_verify_data_displayed_in_main_tab(List<String> getMetadatRecordView) throws Throwable {
		//onMetadataSteps.verify_data_displayed_in_main_tab();
	}
}
