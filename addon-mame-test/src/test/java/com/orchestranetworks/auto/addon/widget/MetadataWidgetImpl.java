package com.orchestranetworks.auto.addon.widget;

import java.util.List;

import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;
import com.orchestranetworks.auto.addon.pages.MetadataPage;

import net.serenitybdd.core.pages.PageObject;

public class MetadataWidgetImpl extends BaseWidgetImpl implements MetadataWidget {

	public MetadataWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
		super(page, locator, timeoutInMilliseconds);
	}

	private static final String XPATH_MAIN_TAB = "//em[.='Main']";
	private static final String XPATH_EXECUTION_TAB = "//em[.='Execution log']";

	@Override
	public boolean isMainSelected(String main) {
		return false;
	}

	@Override
	public List<String> getListTab() {
		boolean isSelected = false;
		String x = getElement(XPATH_MAIN_TAB).getCssValue("border-bottom-color");
		String y = getElement(XPATH_EXECUTION_TAB).getCssValue("border-bottom-color");
		System.out.println("Main tab color =" + x);
		System.out.println("XPATH_EXECUTION_TAB tab color =" + y);
		return null;
	}

	@Override
	public List<String> getMetadatRecordView() {
		return null;
	}

	@Override
	public void clickBtnPreviewRecord() {

	}

	@Override
	public void clickBtnPreviewGroup() {

	}

}
