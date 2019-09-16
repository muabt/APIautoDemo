package com.orchestranetworks.auto.addon.defs;

import java.util.Map;

import com.orchestranetworks.auto.addon.steps.AdministrationSteps;
import cucumber.api.DataTable;
import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.common.steps.DatasetSteps;
import com.orchestranetworks.auto.addon.steps.ManualMergeSteps;

import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

import java.util.List;

public class ManualMergeDefs {
	@Steps
	ManualMergeSteps onManualMergeSteps;
	@Steps
	DatasetSteps onDatasetSteps;
	@Steps
    AdministrationSteps onAdministrationSteps;

	@Then("^record view table will be displayed and highlighted as below$")
	public void user_will_see_the_data_as_below(List<List<String>> tableMerge) {
		onManualMergeSteps.verify_record_view_table(tableMerge);
	}
//
//	@Then("^the table will be showed as below$")
//    public void the_table_will_be_showed_as_below(List<List<String>> tableMerge) {
//		onManualMergeSteps.verify_record_view_table(tableMerge);
//    }
	
	@And("^preview table is displayed as below$")
	public void table_is_highlighted_and_display_on_preview_table_as_below(List<List<String>> tablePreview) {
		onManualMergeSteps.verify_table_preview(tablePreview);
	}
	
	/*
	 * @And("^the screen displays buttons as below$") public void
	 * the_screen_displays_buttons_as_below() {
	 * 
	 * }
	 */

	@When("^I complete merging process$")
	public void i_complete_merging_process() {
		onManualMergeSteps.click_button_next();
		onManualMergeSteps.click_button_merge();

	}

	@Then("^I will see table RecordMetadata as below$")
	public void i_will_see_table_recordmetadata_as_below(DataTable recordMetadataExpect) throws Throwable {
		List<Map<String, String>> list = recordMetadataExpect.asMaps(String.class, String.class);
		for (int i = 0; i < list.size(); i++) {
			Map<String, String> row = list.get(i);
			String recordID = row.get("recordId");
			String groupID = row.get("groupId");
			String state = row.get("state");
			String autoCreated = row.get("autoCreated");
			String functionalID = row.get("functionalId");

			if (!recordID.isEmpty()) {
			}
			if (!groupID.isEmpty()) {
			}
			if (!state.isEmpty()) {
			}
			if (!autoCreated.isEmpty()) {
			}
			if (!functionalID.isEmpty()) {
			}
		}

	}

	@Given("^I want to access the Matching record of table \"([^\"]*)\"$")
	public void i_want_to_access_the_matching_record_of_table(String tblName) {
	    onAdministrationSteps.access_matching_table();
	    onAdministrationSteps.select_record_with_name(tblName);
	}

	@And("^I select the expected source field \"([^\"]*)\"$")
	public void i_select_the_expected_source_field(String fieldName) {

	}
}
