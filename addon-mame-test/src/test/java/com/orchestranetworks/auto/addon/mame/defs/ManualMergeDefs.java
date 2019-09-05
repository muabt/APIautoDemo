package com.orchestranetworks.auto.addon.mame.defs;

import java.util.*;
import java.util.Map;

import cucumber.api.DataTable;
import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.mame.steps.ManualMergeSteps;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;
import io.vavr.collection.*;
import java.util.List;

public class ManualMergeDefs {
	@Steps
	ManualMergeSteps onManualMergeSteps;

	@Then("^record view table will be displayed and highlighted as below$")
	public void user_will_see_the_data_as_below(List<List<String>> tableMerge) {
		String tblName = "RECORD_VIEW_EXP";
		SessionData.addDataTable(tblName, tableMerge, false);
		onManualMergeSteps.verify_datatable(tblName);
	}

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

	@Then("^user will see table RecordMetadata as below$")
	public void user_will_see_table_recordmetadata_as_below(DataTable recordMetadataExpect) {
		List<Map<String, String>> list = recordMetadataExpect.asMaps(String.class, String.class);
		for (int i = 0; i < list.size(); i++) {
			Map<String, String> row = list.get(i);
			String recordID = row.get("recordId");
			String groupID = row.get("groupId");
			String state = row.get("state");
			String autoCreated = row.get("autoCreated");
			String functionalID = row.get("functionalId");

			if (!recordID.isEmpty()) {
				onManualMergeSteps.verify_record_value(i, "recordId", recordID);
			}
			if (!groupID.isEmpty()) {
				onManualMergeSteps.verify_group_id(i);
			}
			if (!state.isEmpty()) {
				onManualMergeSteps.verify_record_value(i, "state", state);
			}
			if (!autoCreated.isEmpty()) {
				onManualMergeSteps.verify_record_value(i, "autoCreated", autoCreated);
			}
			if (!functionalID.isEmpty()) {
				onManualMergeSteps.verify_record_value(i, "functionalId", functionalID);
			}
		}

	}
}
