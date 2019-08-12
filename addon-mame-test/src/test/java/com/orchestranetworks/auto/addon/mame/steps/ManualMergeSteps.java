package com.orchestranetworks.auto.addon.mame.steps;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.mame.pages.ManualMergePages;

import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class ManualMergeSteps {

	ManualMergePages onManualMergePages;

	public void verify_datatable(String expTable) {
		List<List<String>> actualTable = onManualMergePages.get_actual_mergedtable();
		SessionData.addDataTable("RECORD_VIEW_ACT", actualTable, false);
		// assertEquals(expTable, actualTable);
		SessionData.compareTableNotFixHeader(expTable, "RECORD_VIEW_ACT");

		// verify highlight
		LinkedHashMap<Integer, List<String>> expectedData = new LinkedHashMap<>();
		LinkedHashMap<Integer, List<String>> actualData = new LinkedHashMap<>();
		expectedData = SessionData.getDataTbRows(expTable);
		actualData = SessionData.getDataTbRows("RECORD_VIEW_ACT");
		List<String> expectedHeader = expectedData.get(0);
		List<String> actualHeader = actualData.get(0);

		for (int row = 1; row < expectedData.size(); row++) {
			for (int col = 0; col < expectedHeader.size(); col++) {

				String expectedCell = SessionData.getDataTbVal(expTable, row, col);
				String actualCell = SessionData.getDataTbVal("RECORD_VIEW_ACT", row, col);

				if (expectedCell.contains("{H}")) {
					assertTrue(onManualMergePages.is_cell_highlighted(row, col));
				} else {
					assertFalse(onManualMergePages.is_cell_highlighted(row, col));
				}
			}
		}
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

//	public void verify_record_metadata(DataTable recordMetadataExpect) {
//
//		List<Map<String, String>> actualRecordMetadata = onManualMergePages.get_actual_record_metadata();
//		assertEquals(recordMetadataExpect, actualRecordMetadata);
//
//	}

	public void verify_record_value(int rowInd, String colName, String expected) {
		String actual = onManualMergePages.get_value_table(rowInd, colName);
		assertEquals(expected, actual);

	}

	public void verify_group_id(int rowInd) {
		String groupID = onManualMergePages.get_value_table(0, "groupId");
		String actual = onManualMergePages.get_value_table(rowInd, "groupId");
		assertEquals(groupID, actual);
	}

}
