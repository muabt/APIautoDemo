package com.orchestranetworks.auto.addon.steps;

import static org.junit.Assert.assertEquals;

import com.orchestranetworks.auto.addon.pages.ManualMergePages;
import org.junit.Assert;

public class SurvivorRecordSelectionModeSteps {
	ManualMergePages onManualMergePages;

	public void verify_name_of_buttons(String name) {
		switch (name) {
		case "Reset":
			assertEquals(name, onManualMergePages.getTextOfResetBtn());
			break;
		case "Cancel last action":
			assertEquals(name, onManualMergePages.getTextOfCancelActionButton());
			break;
		case "Apply merge policy":
			assertEquals(name, onManualMergePages.getTextOfResetBtn());
			break;
		}
	}

	public void verify_status_of_buttons(String status) {
		Assert.assertEquals(status, onManualMergePages.getValueCancelLastAction(status));
	}

	public void verify_name_of_table(String tableName) {
		Assert.assertEquals(tableName, onManualMergePages.getActualTableName());
	}

}
