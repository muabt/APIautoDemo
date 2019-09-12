package com.orchestranetworks.auto.addon.defs;

import java.util.List;

import com.orchestranetworks.auto.addon.steps.ManualMergeSteps;
import com.orchestranetworks.auto.addon.steps.MetadataSteps;

import cucumber.api.java.en.Then;
import net.thucydides.core.annotations.Steps;

public class MetadataDefs {
	@Steps
	MetadataSteps onMetadataSteps;

	@Then("^I should list tabs as following \"([^\"]*)\"$")
	public void i_should_list_tabs_as_following(List<String> getListTab) throws Exception  {
		onMetadataSteps.verify_list_tabs(expectedTab);    
	}
}
