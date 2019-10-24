package com.orchestranetworks.auto.addon.widget.workspace;

import com.orchestranetworks.auto.addon.utils.Constants;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import net.serenitybdd.core.pages.PageObject;

public class DataspaceCreationImpl extends ItemCreationWidgetImpl {
	public DataspaceCreationImpl(PageObject page, ElementLocator locator, WebElement webElement,
			long timeoutInMilliseconds) {
		super(page, locator, webElement, timeoutInMilliseconds);
	}

	public DataspaceCreationImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
		super(page, locator, timeoutInMilliseconds);
	}
}
