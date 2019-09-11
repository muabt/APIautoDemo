package com.orchestranetworks.auto.addon.widget.general;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.XFormat;
import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class NavigationWidgetImpl extends BaseWidgetImpl implements NavigationWidget {
	public static final String XPATH_NAVIGATION_ITEM = "//a//descendant-or-self::*[text()='%s']";

	public NavigationWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
			long timeoutInMilliseconds) {
		super(page, locator, webElement, timeoutInMilliseconds);
	}

	public NavigationWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
		super(page, locator, timeoutInMilliseconds);
	}

	@Override
	public void changeDataspace() {
		removeChooseDatasetDiv();
		switchOutDefaultIFrame();
		if (isElementExistNow(xPathBtn("Change dataspace"))) {
			clickBtn("Change dataspace");
		}
	}

	@Override
	public void changeDataset() {
		removeChooseDatasetDiv();
		switchOutDefaultIFrame();
        if (isElementExistNow(xPathBtn("Select dataset"))) {
            clickBtn("Select dataset");
        }
	}

	@Override
	public void expandNavigationItems() {

	}

	@Override
	public void expandNavigationItem(String[] itemList) {
		collapseAll();
		waitAbit(1000);
		for (int i = 0; i < itemList.length - 1; i++) {
			expandItem(itemList[i].trim());
		}
	}

	@Override
	public void collapseNavigationItems() {
		collapseAll();
	}

	@Override
	public void collapseNavigationItem(String menu) {
		String xPathExpanded = "//li[descendant-or-self::*[contains(text(),'" + menu
				+ "')]]//button[@title='Expanded']";
		clickOnElement(xPathExpanded);
	}

	@Override
	public void accessNavigationItem(String menu) {
		// No extents Webpageobject then using default method of serenity
		menu = SessionData.getValueFromSession(menu);
		String xpath = XFormat.of(XPATH_NAVIGATION_ITEM, menu);
		clickOnElement(xpath);
	}

	private void collapseAll() {
		String xPathExpandedBtn = "//button[@title='Expanded']";
		int numOfExpandedBtn = findAllElement(xPathExpandedBtn).size();
		for (int i = numOfExpandedBtn; i >= 1; i--) {
			clickBtn("Expanded", i);
		}
	}

	private void expandItem(String item) {
		String xPathCollapsed = "//li[descendant-or-self::*[contains(text(),'" + item
				+ "')]]//button[@title='Collapsed']";
		String xPathExpanded = "//li[descendant-or-self::*[contains(text(),'" + item
				+ "')]]//button[@title='Expanded']";
		if (isElementExistNow(xPathCollapsed)) {
			clickOnElement(xPathCollapsed);
			waitForPresenceOfElement(xPathExpanded);
		}
	}

}
