package com.orchestranetworks.auto.addon.widget.workspace;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class ChooseDatasetTypeWidgetImpl extends BaseWidgetImpl implements ChooseDatasetTypeWidget {
	public ChooseDatasetTypeWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
			long timeoutInMilliseconds) {
		super(page, locator, webElement, timeoutInMilliseconds);
	}

	public ChooseDatasetTypeWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
		super(page, locator, timeoutInMilliseconds);
	}

	@Override
	public void clickBtnPackagedDataModel() {
		clickBtn("Packaged data model");
	}

	@Override
	public void clickBtnEmbeddedDataModel() {
		clickBtn("Embedded data model");
	}

	@Override
	public void clickBtnExternalDataModel() {
		clickBtn("External data model");
	}
}
