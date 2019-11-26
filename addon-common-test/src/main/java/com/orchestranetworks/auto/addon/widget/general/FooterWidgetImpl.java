package com.orchestranetworks.auto.addon.widget.general;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class FooterWidgetImpl extends BaseWidgetImpl implements FooterWidget {

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
        clickBtn("Save and close");
        waitForAllLoadingCompleted();
    }

    @Override
    public void clickBtnSaveAndCloseInInternalPopup() {
        clickBtn("Save and close");
    }

	@Override
	public void clickBtnClose() {
		clickBtn("Close");
	}

	@Override
	public void clickBtnCreate() {
		clickBtn("Create");
		waitForInvisibilityOfElement(xPathBtn("Create"));
	}

	@Override
	public void clickBtnCreateAndApply() {
		clickBtn("Create and apply");
	}

	@Override
	public void clickBtnSaveAndQuit() {
		clickBtn("Save and quit");
	}

	@Override
	public void clickBtnSubmit() {
		clickBtn("Submit");
	}

    @Override
    public void clickBtnCreateAndAdd() {

    }

	@Override
	public void clickBtnBackToMainView() {
		waitForVisibilityOfElement(xPathBtn("Back to main view"));
		clickBtn("Back to main view");
	}
}
