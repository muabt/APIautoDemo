package com.orchestranetworks.auto.addon.widget.general;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class ImportWidgetImpl extends BaseWidgetImpl implements ImportWidget {

    public ImportWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
                                long timeoutInMilliseconds) {
        super(page, locator, webElement, timeoutInMilliseconds);
    }

    public ImportWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

	@Override
	public void selectFileThenImport(String fileName) {
		//switchToIFrame(Constants.IFRAME_LEGACY);
		selectImportBox("Archive to import", fileName);
		 clickBntImport();
	}
	
	private void selectImportBox(String label, String value) {
        String xPathDDL = "//label[.='" + label + "']/ancestor::div//select";
        String xPathValue = xPathDDL + "/option[@value='" + value + "']";
        clickOnElement(xPathDDL);
        waitElementToBePresent(xPathValue).waitUntilClickable().click();
    }

	@Override
	public void clickBntImport() {
		clickBtn("Import");
	}
    
    
}