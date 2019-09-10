package com.orchestranetworks.auto.addon.widget.workspace;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class ChooseDatamodelTypeWidgetImpl extends BaseWidgetImpl implements ChooseDatamodelTypeWidget {
	public ChooseDatamodelTypeWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
			long timeoutInMilliseconds) {
		super(page, locator, webElement, timeoutInMilliseconds);
	}

	public ChooseDatamodelTypeWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
		super(page, locator, timeoutInMilliseconds);
	}

	@Override
	public void clickBtnSemanticModel() {
		clickBtn("Semantic model");
	}

	@Override
	public void clickBtnRelationalModel() {
		clickBtn("Relational model");
	}

}
