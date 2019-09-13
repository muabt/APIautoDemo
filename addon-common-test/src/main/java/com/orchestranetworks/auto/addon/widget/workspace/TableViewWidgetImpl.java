package com.orchestranetworks.auto.addon.widget.workspace;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.XFormat;
import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class TableViewWidgetImpl extends BaseWidgetImpl implements TableViewWidget {
	
	private static final String XPATH_TABLE = "//table[@class='ebx_tvFixed']";
	public static final String XPATH_CHECKBOX_RECORD = "//div[@id='ebx_WorkspaceContent']//tr[(td[%1$s]) or (td/div[%1$s])]//input[@type='checkbox']";

	public TableViewWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
			long timeoutInMilliseconds) {
		super(page, locator, webElement, timeoutInMilliseconds);
	}

	public TableViewWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
		super(page, locator, timeoutInMilliseconds);
		System.out.println("table view widget constructor");
	}

	@Override
	public void selectFirstRecords(int numberOfRecords) {
		for (int i = 1; i <= numberOfRecords; i++) {
			selectRecordWithIndex(i);
		}
	}

	private void selectRecordWithIndex(int index) {
		String xPathSelectRecord = "(//td[@class='ebx_tvSelectCell']//input[@type='checkbox'])[" + index + "]";
		// Use waitUntilClickable will throw TimeoutException, so just click() only
		getElement(xPathSelectRecord).click();
		waitForInvisibilityOfElement(xPathSelectRecord);
	}
	
	@Override
	public void selectRecordWithPK(String[] primaryKey) {
		String xPathRow = "//div[@id='ebx_WorkspaceContent']//tr[(td[%s])";
		primaryKey[0] = sSpecialTextPredicates(primaryKey[0]);
		if (primaryKey.length >= 2) {
			for (int i = 1; i < primaryKey.length; i++) {
				primaryKey[i] = sSpecialTextPredicates(primaryKey[i]);
				xPathRow += " and (td[%s])";
			}
		}
		xPathRow += "]";
		xPathRow = XFormat.of(xPathRow, primaryKey);
		switchToLastIFrame();
		clickByJS(xPathRow + "//input[@type='checkbox']");
	}
	
	@Override
	public void selectRecordWithPK(String recordPK) {
		waitForPresenceOfElement(XPATH_TABLE);
		clickByJS(XFormat.of(XPATH_CHECKBOX_RECORD, sSpecialTextPredicates(recordPK)));
	}
}
