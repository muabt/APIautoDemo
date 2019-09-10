package com.orchestranetworks.auto.addon.widget.general;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class FooterWidgetImpl extends BaseWidgetImpl implements FooterWidget {
	private final String XPATH_BTN = "(//button[(@type='button' or @type='submit' or not(@type)) and not(@style='display: none;')][descendant-or-self::*[text()='{0}' or @title='{0}' or @value='{0}']])[1]";

	public FooterWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
			long timeoutInMilliseconds) {
		super(page, locator, webElement, timeoutInMilliseconds);
	}

	public FooterWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
		super(page, locator, timeoutInMilliseconds);
	}

	@Override
	public void clickBtnNext() {
		clickBtn("Next");
	}

	@Override
	public void clickBtnBack() {
		{
			clickBtn("Back");
		}
	}

	@Override
	public void clickBtnCancel() {
		clickBtn("Cancel");
	}

	@Override
	public void clickBtnSave() {
		clickBtn("Save");
	}

	@Override
	public void clickBtnSaveAndClose() {
		clickBtn("Save And Close");
	}

	@Override
	public void clickBtnClose() {
		clickBtn("Close");
	}

	@Override
	public void clickBtnCreate() {
		clickBtn("Create");
	}

	@Override
	public void clickBtnCreateAndApply() {
		clickBtn("Create and apply");
	}

	@Override
	public void clickBtnSaveAndQuit() {
		clickBtn("Save and quit");
	}
}