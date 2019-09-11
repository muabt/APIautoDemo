package com.orchestranetworks.auto.addon.widget.workspace;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class TableViewWidgetImpl extends BaseWidgetImpl implements TableViewWidget {
	public TableViewWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
			long timeoutInMilliseconds) {
		super(page, locator, webElement, timeoutInMilliseconds);
	}

	public TableViewWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
		super(page, locator, timeoutInMilliseconds);
		switchToLastIFrame();
	}

	@Override
	public void selectFirstRecords(int numberOfRecords) {
		for (int i = 1; i < numberOfRecords; i++) {
			select_record_with_index(i);
		}
	}

	private void select_record_with_index(int index) {
		String xPathSelectRecord = "(//td[@class='ebx_tvSelectCell']//input[@type='checkbox'])[" + index + "]";
		// Use waitUntilClickable will throw TimeoutException, so just click() only
		getElement(xPathSelectRecord).click();
		//clickOnElement(xPathSelectRecord);
	}
}
