package com.orchestranetworks.auto.addon.widget.workspace;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import net.serenitybdd.core.pages.PageObject;

public class NewTableImpl extends NewItemWidgetImpl {
	public NewTableImpl(PageObject page, ElementLocator locator, WebElement webElement, long timeoutInMilliseconds) {
		super(page, locator, webElement, timeoutInMilliseconds);
	}

	public NewTableImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
		super(page, locator, timeoutInMilliseconds);
	}
}
