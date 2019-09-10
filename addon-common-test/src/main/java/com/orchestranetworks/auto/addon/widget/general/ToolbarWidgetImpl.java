package com.orchestranetworks.auto.addon.widget.general;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.annotations.findby.By;
import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;

public class ToolbarWidgetImpl extends BaseWidgetImpl implements ToolbarWidget {
	public ToolbarWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
			long timeoutInMilliseconds) {
		super(page, locator, webElement, timeoutInMilliseconds);
	}

	public ToolbarWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
		super(page, locator, timeoutInMilliseconds);
	}

	@Override
	public void clickBtnFilter() {
		clickBtn("Filters");
	}

	@Override
	public WebElementFacade getBtnView() {
		return findBy(xPathBtn("View)"));
	}

	@Override
	public WebElementFacade getBtnActions() {
		return findBy(xPathBtn("Actions"));
	}

	@Override
	public void selectService(String service) {
		clickBtn("Actions");
		find(By.linkText(service)).waitUntilClickable().click();
	}
}
