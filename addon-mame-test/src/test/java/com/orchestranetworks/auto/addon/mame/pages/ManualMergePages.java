package com.orchestranetworks.auto.addon.mame.pages;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.LogWork;
import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.common.WebPageObject;

public class ManualMergePages extends WebPageObject {

	public ManualMergePages(WebDriver driver) {
		super(driver);
	}

	public List<List<String>> get_actual_mergedtable() {
		switchToIFrame("serviceIframe");
		int numOfHeader = 0;
		String xPathListHeader = "//record-view//div[@class='top ebx_tvHeaderContainer']//span[@class='ebx_RawLabel']";
		String headerCellValue = "";
		List<String> listHeader = new ArrayList<String>();

		List<List<String>> actualTable = new ArrayList<List<String>>();
		numOfHeader = findAllElement(xPathListHeader).size();
		for (int i = 1; i <= numOfHeader; i++) {
			String xPathHeaderCell = "(" + xPathListHeader + ")[" + i + "]";
			headerCellValue = getText(xPathHeaderCell);
			listHeader.add(headerCellValue);
		}
		actualTable.add(listHeader);

		int numOfRow = 0;
		String xPathRow = "//record-view//div[@class='bottom']//tr[contains(@class,\"row\")]";
		String cellValue = "";
		numOfRow = findAllElement(xPathRow).size() / 2;
		for (int rowind = 1; rowind <= numOfRow; rowind++) {
			List<String> row = new ArrayList<String>();
			for (int colInd = 1; colInd <= numOfHeader; colInd++) {
				String xPathCell = "(//record-view//div[@class='bottom']//tr[contains(@class,\"row\")][" + rowind
						+ "]/td[contains(@class,'cell-container')]//span[@title])[" + colInd + "]";
				cellValue = getText(xPathCell);
				row.add(cellValue);
			}
			actualTable.add(row);
		}

		return actualTable;
	}

	public List<List<String>> get_actual_previewTable() {

		int numOfHeader = 0;
		String xPathListHeader = "//preview-record-view//div[@class='top ebx_tvHeaderContainer']//span[@class='ebx_RawLabel']";
		String headerCellValue = "";
		List<String> listHeader = new ArrayList<String>();

		List<List<String>> actualTablePreview = new ArrayList<List<String>>();
		numOfHeader = findAllElement(xPathListHeader).size();
		for (int i = 1; i <= numOfHeader; i++) {
			String xPathHeaderCell = "(" + xPathListHeader + ")[" + i + "]";
			headerCellValue = getText(xPathHeaderCell);
			listHeader.add(headerCellValue);
		}
		actualTablePreview.add(listHeader);
		String cellValue = "";
		List<String> row = new ArrayList<String>();
		for (int colInd = 1; colInd <= numOfHeader; colInd++) {
			String xPathCell = "(//preview-record-view//div[@class='bottom']//td[contains(@class,\"cell-container ebx_tvEven\")]//span[@title])["
					+ colInd + "]";
			cellValue = getText(xPathCell);
			row.add(cellValue);
		}
		actualTablePreview.add(row);

		return actualTablePreview;
	}

	public void click_button_next() {
		clickBtn("Next");

	}

	public void click_button_merge() {
		clickBtn("Merge");

	}

	private boolean compareRecordViewTable(List<List<String>> expectedTb, List<List<String>> actualTb) {
		List<String> expectedHeader = expectedTb.get(0);
		List<String> actualHeader = expectedTb.get(0);
		boolean diff = true;

		if (expectedTb.isEmpty() || actualTb.isEmpty()) {
			LogWork.error("Data Table Expected or Actual is empty. Nothing to compare.");
		}
		if (expectedTb.size() != actualTb.size()) {
			LogWork.error("Data Table Expected or Actual is different in number of row");
		}
		if (expectedHeader.size() != actualHeader.size()) {
			LogWork.error("Data Table Expected or Actual is different in number of row");
		}
		SessionData.addDataTable("EXPECTED_TBL", expectedTb, false);
		SessionData.addDataTable("ACTUAL_TBL", actualTb, false);
		LinkedHashMap<Integer, List<String>> expectedData = new LinkedHashMap<>();
		LinkedHashMap<Integer, List<String>> actualData = new LinkedHashMap<>();
		expectedData = SessionData.getDataTbRows("EXPECTED_TBL");
		actualData = SessionData.getDataTbRows("ACTUAL_TBL");
		for (int row : expectedData.keySet()) {
			for (int col = 1; col <= expectedHeader.size(); col++) {
				String expectedCell = SessionData.getDataTbVal("EXPECTED_TBL", row, col);
				String actualCell = SessionData.getDataTbVal("ACTUAL_TBL", row, col);
				if (expectedCell.contains("- %H%")) {
					expectedCell = expectedCell.replaceAll("- %H%", "").trim();
				}
			}
		}
		return diff;
	}

}
