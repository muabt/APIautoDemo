package com.orchestranetworks.auto.addon.widget.general;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class PopupWidgetImpl extends BaseWidgetImpl implements PopupWidget {

	public PopupWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
			long timeoutInMilliseconds) {
		super(page, locator, webElement, timeoutInMilliseconds);
	}

	public PopupWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
		super(page, locator, timeoutInMilliseconds);
	}

	@Override
	public void confirmOK() {
		String xPath = "//div[@id='ebx_DialogBox']//button[text()='OK']|//div[@class='_ebx-pop-up']//button[contains(.,'OK')]";
		clickOnElement(xPath);
		waitForInvisibilityOfElement(xPath);
	}
	@Override
	public void confirmYES() {
		String xPath = "//div[@id='ebx_DialogBox']//button[text()='Yes']";
		clickOnElement(xPath);
		waitForInvisibilityOfElement(xPath);
	}

	@Override
	public void clickBtnClose() {
		String xPath = "//div[@id='ebx_DialogBox']//button[text()='Close']|//div[@class='_ebx-pop-up']//button[contains(.,'Close')]";
		clickOnElement(xPath);
		//getElement(xPath).click();
		waitForInvisibilityOfElement(xPath);
	}
}
