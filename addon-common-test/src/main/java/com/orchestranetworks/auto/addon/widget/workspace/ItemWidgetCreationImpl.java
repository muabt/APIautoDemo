package com.orchestranetworks.auto.addon.widget.workspace;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class ItemWidgetCreationImpl extends BaseWidgetImpl implements ItemCreationWidget {
	public ItemWidgetCreationImpl(PageObject page, ElementLocator locator, WebElement webElement,
			long timeoutInMilliseconds) {
		super(page, locator, webElement, timeoutInMilliseconds);
	}

	public ItemWidgetCreationImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
		super(page, locator, timeoutInMilliseconds);
	}

	@Override
	public void enterIdentifier(String id) {

	}

	@Override
	public void enterUniqueName(String uniqueName) {
	}

	@Override
	public void enterOwner(String owner) {

	}

	@Override
	public void enterEnglishLabel(String label) {

	}
}
