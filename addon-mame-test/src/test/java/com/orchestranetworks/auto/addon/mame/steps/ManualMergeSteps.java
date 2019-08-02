package com.orchestranetworks.auto.addon.mame.steps;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;

import java.util.List;

import com.orchestranetworks.auto.addon.mame.pages.ManualMergePages;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class ManualMergeSteps {

	ManualMergePages onManualMergePages;

	public void verify_datatable(List<List<String>> expectedTable) {
		List<List<String>> actualTable = onManualMergePages.get_actual_mergedtable();
		assertEquals(expectedTable, actualTable);
	}

	public void verify_table_preview(List<List<String>> expectedTablePreview) {

		List<List<String>> actualTablePreview = onManualMergePages.get_actual_previewTable();
		assertEquals(expectedTablePreview, actualTablePreview);

	}

	public void click_button_next() {
		onManualMergePages.click_button_next();
	}

	public void click_button_merge() {
		onManualMergePages.click_button_merge();
	}

}
