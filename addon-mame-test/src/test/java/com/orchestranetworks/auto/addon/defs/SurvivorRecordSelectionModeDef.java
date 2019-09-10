package com.orchestranetworks.auto.addon.defs;

import java.util.*;

import com.orchestranetworks.auto.addon.steps.SurvivorRecordSelectionModeSteps;

import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import net.thucydides.core.annotations.Steps;

public class SurvivorRecordSelectionModeDef {
	@Steps
	SurvivorRecordSelectionModeSteps onSurvivorRecordSelectionModeSteps;

	@And("^the screen displays buttons as below$")
	public void the_screen_displays_buttons_as_below(DataTable tableButtons) {
		List<Map<String, String>> list = tableButtons.asMaps(String.class, String.class);
		for (int i = 0; i < list.size(); i++) {
			Map<String, String> row = list.get(i);
			String name = row.get("Name");
			String status = row.get("Status");

			if (!name.isEmpty()) {
				onSurvivorRecordSelectionModeSteps.verify_name_of_buttons(name);
			}
			if (!status.isEmpty()) {
				onSurvivorRecordSelectionModeSteps.verify_status_of_buttons(status);
			}
		}
	}

	@And("^I see the table name \"([^\"]*)\" in dropdowlist$")
	public void i_see_the_table_name_something_in_dropdowlist(String tableName) {
		onSurvivorRecordSelectionModeSteps.verify_name_of_table(tableName);
	}
}
