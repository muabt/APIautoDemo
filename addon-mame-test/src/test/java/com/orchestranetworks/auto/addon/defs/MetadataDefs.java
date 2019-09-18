package com.orchestranetworks.auto.addon.defs;

import java.util.List;

import com.orchestranetworks.auto.addon.steps.ManualMergeSteps;
import com.orchestranetworks.auto.addon.steps.MetadataSteps;

import cucumber.api.java.en.And;
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
	public void i_want_to_verify_data_displayed_in_main_tab(List<List<String>> getMetadataRecordView) throws Exception  {
		onMetadataSteps.verify_data_displayed_in_main_tab (getMetadataRecordView);
	}
	
	@When("^I want to see detail record$")
    public void i_want_to_see_detail_record() throws Exception  {
        onMetadataSteps.click_button_preview_record();
    }
	
	@Then("^I should see detailed record as following $")
    public void i_should_see_detailed_record_as_following() throws Exception {
        
    }
	@When("^I want to come back metadata screen$")
    public void i_want_to_come_back_metadata_screen() throws Throwable {
        
    }
	@When("^I want to see group of record$")
    public void i_want_to_see_group_of_record() throws Throwable {
        
    }
	@Then("^I should see manage group of table \"([^\"]*)\"$")
    public void i_should_see_manage_group_of_table_something(String strArg1) throws Throwable {
        
    }
	
	@And("^I should see Duplicates table as following$")
    public void i_should_see_duplicates_table_as_following() throws Throwable {
	}
	@And("^I should see the Suspects table as following$")
    public void i_should_see_the_suspects_table_as_following() throws Throwable {
        
    }
}