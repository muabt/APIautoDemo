package com.orchestranetworks.auto.addon.widget;

import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class MetadataWidgetImpl extends BaseWidgetImpl implements MetadataWidget {

	public MetadataWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
		super(page, locator, timeoutInMilliseconds);
	}

	private static final String XPATH_MAIN_TAB = "//em[.='Main']";
	private static final String XPATH_EXECUTION_TAB = "//em[.='Execution log']";
	private static final String XPATH_TABs = "(//ul[@id='ebx_WorkspaceFormTabviewTabs']//em)";
	private static final String XPATH_TABLE_RECORD_VIEW = "//table[@class='ebx_FieldList space']";
	private static final String XPATH_RECORD_VIEW = "//tr[contains(@class, 'ebx_Field ebx_primary_key')]";
	private static final String XPATH_LABEL = "//td[@class='ebx_Label']";
	private static final String XPATH_VALUE = "//td[@class='ebx_Input']";
	
	
	
	@Override
	public boolean isMainSelected() {
		boolean isSelected = !getElement(XPATH_MAIN_TAB).getCssValue("border-bottom-color").equals("rgba(0, 0, 0, 0)");
		//boolean isSelected2 = getElement(XPATH_MAIN_TAB+"/ancestor::li").getAttribute("title").equals("active");
		return isSelected;
	}

	@Override
	public List<String> getListTab() {
		int numOfTabs = findAllElements(XPATH_TABs).size();
		List<String> listTab = new ArrayList<String>();
		for (int i = 1; i == numOfTabs; i++) {
			listTab.add(getText(XPATH_TABs+"["+i+"]"));
		}
		return listTab;
	}

	@Override
	public List<List<String>> getMetadataRecordView() {
	List<List<String>> metadataRecordView = new ArrayList<List<String>>();	
    int numOfRow = 0;
    int numOfCol = 0;
    String cellValue = "";
    numOfRow = findAllElements(XPATH_TABLE_RECORD_VIEW).size();
    for (int rowind = 1; rowind <= numOfRow; rowind++) {
		List<String> row = new ArrayList<String>();
		   for (int colInd = 1; colInd <= numOfCol; colInd++) {
			String xPathCell = XPATH_RECORD_VIEW .replaceAll("%r%", String.valueOf(rowind)).replaceAll("%c%",String.valueOf(colInd));
			cellValue = getTextCell(xPathCell);
			row.add(cellValue);
		   }
		   metadataRecordView.add(row);	  
    }
	return metadataRecordView;
			
}

	private String getTextCell(String xPathCell) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void clickBtnPreviewRecord() {
		clickBtn("");

	}
	
	@Override
	public void clickBtnClose() {
		clickBtn("");

	}
	@Override
	public void clickBtnPreviewGroup() {
		clickBtn("");
	}

	@Override
	public List<List<String>> getDataRecordDetail() {
		return null;
	}

	@Override
	public List<List<String>> getDataRecordDuplicatesTable() {
		return null;
	}

	@Override
	public List<List<String>> getDataRecordSuspectTable() {
		return null;
	}


}

