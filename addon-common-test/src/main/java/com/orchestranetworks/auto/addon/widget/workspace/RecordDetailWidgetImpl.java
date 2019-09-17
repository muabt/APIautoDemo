package com.orchestranetworks.auto.addon.widget.workspace;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class RecordDetailWidgetImpl extends BaseWidgetImpl implements RecordDetailWidget {
	public RecordDetailWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
			long timeoutInMilliseconds) {
		super(page, locator, webElement, timeoutInMilliseconds);
	}

	public RecordDetailWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
		super(page, locator, timeoutInMilliseconds);
	}
	
	public void clickOnTabOfLabel(String label) {
		String xPath = "//ul[@id='ebx_WorkspaceFormTabviewTabs']//span[contains(text(),'" + label + "')]";
		clickOnElement(xPath);
	}
}
