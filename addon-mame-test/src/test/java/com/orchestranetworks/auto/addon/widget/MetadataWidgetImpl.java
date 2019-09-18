package com.orchestranetworks.auto.addon.widget;

import java.util.ArrayList;
import java.util.List;

import org.apache.xpath.res.XPATHMessages;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;
import com.orchestranetworks.auto.addon.pages.MetadataPage;

import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;

public class MetadataWidgetImpl extends BaseWidgetImpl implements MetadataWidget {

	public MetadataWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
		super(page, locator, timeoutInMilliseconds);
	}

	private static final String XPATH_MAIN_TAB = "//em[.='Main']";
	private static final String XPATH_EXECUTION_TAB = "//em[.='Execution log']";
	private static final String XPATH_TABs = "(//ul[@id='ebx_WorkspaceFormTabviewTabs']//em)";
	private static final String XPATH_LABEL_METADATA = "(//td[@class='ebx_Label'])";
	private static final String XPATH_VALUE_METADATA = "(//td[@class='ebx_Input'])";
	private static final String XPATH_PREVIEW_RECORD = "(//button[@class='ebx_FlatButton ebx_IconButton ebx_Open']/span)[1]";
	private static final String XPATH_PREVIEW_GROUP = "(//button[@class='ebx_FlatButton ebx_IconButton ebx_Open']/span)[2]";
	private static final String XPATH_LABEL_RECORD = "//table[@class='ebx_FieldList']//td[@class='ebx_Label']";
	private static final String XPATH_VALUE_RECORD = "(//*[@class='ebx_FieldDecorator'])";
	private static final String XPATH_CLOSE = "(//div[@class='ebx_ActionsBack']/button)[5]";
	

	@Override
	public boolean isMainSelected() {
		boolean isSelected = !getElement(XPATH_MAIN_TAB).getCssValue("border-bottom-color").equals("rgba(0, 0, 0, 0)");
		// boolean isSelected2 =
		// getElement(XPATH_MAIN_TAB+"/ancestor::li").getAttribute("title").equals("active");
		return isSelected;
	}

	@Override
	public List<String> getListTab() {
		int numOfTabs = findAllElement(XPATH_TABs).size();
		List<String> listTab = new ArrayList<String>();
		for (int i = 1; i == numOfTabs; i++) {
			listTab.add(getText(XPATH_TABs + "[" + i + "]"));
		}
		return listTab;
	}

	@Override
	public List<List<String>> getMetadataRecordView() {
		List<List<String>> metadataRecordView = new ArrayList<List<String>>();

		int numOfHeaders = findAllElement(XPATH_LABEL_RECORD).size();
		List<String> row = new ArrayList<String>();
		for (int i = 0; i < numOfHeaders; i++) {
			String cell = getText(XPATH_LABEL_RECORD + "[" + i+1 + "]");
			row.add(cell);
		}
		metadataRecordView.add(row);
		row.clear();
		for (int i = 0; i < numOfHeaders; i++) {
			String cell = getText(XPATH_VALUE_RECORD + "[" + i+1 + "]");
			row.add(cell);
		}
		metadataRecordView.add(row);

		return metadataRecordView;

	}

	@Override
	public void clickBtnPreviewRecord() {
		clickBtn("");

	}
	
	
	
	@Override
	public List<List<String>> getDataRecordDetail() {
		List<List<String>> dataRecordDetail= new ArrayList<List<String>>();
		int numOfHeaders = findAllElement(XPATH_LABEL_METADATA).size();
		List<String> row = new ArrayList<String>();
		for (int i = 0; i < numOfHeaders; i++) {
			String cell = getText(XPATH_LABEL_METADATA + "[" + i+1 + "]");
			row.add(cell);
		}
		dataRecordDetail.add(row);
		row.clear();
		for (int i = 0; i < numOfHeaders; i++) {
			String cell = getText(XPATH_VALUE_METADATA + "[" + i+1 + "]");
			row.add(cell);
		}
		dataRecordDetail.add(row);

		return dataRecordDetail;
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
	public List<List<String>> getDataRecordDuplicatesTable() {
		return null;
	}

	@Override
	public List<List<String>> getDataRecordSuspectTable() {
		return null;
	}

}
