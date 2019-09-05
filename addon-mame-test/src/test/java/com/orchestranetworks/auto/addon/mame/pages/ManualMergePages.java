package com.orchestranetworks.auto.addon.mame.pages;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.aspectj.weaver.NewFieldTypeMunger;
import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.LogWork;
import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.common.WebPageObject;

public class ManualMergePages extends WebPageObject {

	public ManualMergePages(WebDriver driver) {
		super(driver);
	}

	private static final String XPATH_RCV_CELL = "(//record-view//div[@class='bottom']//tr[contains(@class,\"row\")][%r%]/td[contains(@class,'cell-container')]//span[@title])[%c%]";

	public List<List<String>> get_actual_mergedtable() {
		switchToIFrame("serviceIframe");
		waitAbit(3000);
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
				String xPathCell = XPATH_RCV_CELL.replaceAll("%r%", String.valueOf(rowind)).replaceAll("%c%",
						String.valueOf(colInd));
				cellValue = getTextCell(xPathCell);
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
			cellValue = getTextCell(xPathCell);
			row.add(cellValue);
		}
		actualTablePreview.add(row);

		return actualTablePreview;
	}
	private String getTextCell(String xPathCell) {
		try {
			return getText(xPathCell);
		} catch (Exception e) {
			return "";
		}
	}

	public void click_button_next() {
		waitAbit(3000);
//		switchToIFrame("serviceIframe");
		String xPath = "//button[@class='ebx_Button ebx_DefaultButton']";
		clickOnElement(xPath);
	}

	public void click_button_merge() {
		String xPath = "//button[@class='ebx_Button ebx_DefaultButton mergeBtn']";
		clickOnElement(xPath);
	}

	public boolean is_cell_highlighted(int row, int col) {
		String xPathCell = XPATH_RCV_CELL.replaceAll("%r%", String.valueOf(row)).replaceAll("%c%",
				String.valueOf(col + 1));
		xPathCell = xPathCell + "//ancestor::*[local-name()='td' or local-name()='th']";
		String highlightedColor = "rgba(244, 244, 244, 1)";
		String color = getElement(xPathCell).getCssValue("background-color");
		return color.equals(highlightedColor) ? true : false;
	}

//	public List<Map<String, String>> get_actual_record_metadata() {
//		List<Map<String, String>> actualRecordMetadata = new ArrayList<Map<String, String>>();
//		for (int i = 0; i < actualRecordMetadata.size(); i++) {
//			Map<String, String> row = actualRecordMetadata.get(i);
//			row.get("groupId");
//
//			actualRecordMetadata.get(i).get("groupId");
//			actualRecordMetadata.get(i).get("state");
//			actualRecordMetadata.get(i).get("autoCreated");
//			actualRecordMetadata.get(i).get("functionalId");
//		}
//		return actualRecordMetadata;
//	}

	public String get_value_table(int rowInd, String colName) {
		int rowIndex = rowInd + 1;
		int colIndex = getColumnIndexWithLabel(colName);
		return getTextDataCell(rowIndex, colIndex);
	}

}
