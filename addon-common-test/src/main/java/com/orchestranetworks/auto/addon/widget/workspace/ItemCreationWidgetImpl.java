package com.orchestranetworks.auto.addon.widget.workspace;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.XFormat;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class ItemCreationWidgetImpl extends BaseWidgetImpl implements ItemCreationWidget {
	
	private static final String XPATH_DATETIME = "//label[text()='%s']/ancestor::tr//span//input[contains(@name,'%s')]";

	public ItemCreationWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
			long timeoutInMilliseconds) {
		super(page, locator, webElement, timeoutInMilliseconds);
	}

	public ItemCreationWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
		super(page, locator, timeoutInMilliseconds);
	}

	@Override
	public void enterIdentifier(String id) {
		waitTypeAndTabWithLabel(Constants.LBL_IDENTIFIER, id);
	}

	@Override
	public void enterUniqueName(String uniqueName) {
		waitTypeAndTabWithLabel(Constants.LBL_UNIQUE_NAME, uniqueName);
	}

	@Override
	public void enterEnglishLabel(String label) {
		waitTypeAndTabWithLabel(Constants.LBL_LABEL, label);

	}

	@Override
	public void selectOwner(String owner) {
		inputDDLThenTab(Constants.LBL_OWNER, owner);
	}

	@Override
	public void inputFieldContent(String col, String cell, String dataType) {
		waitForAllLoadingCompleted();
		switch (dataType) {
		case "TXT":
			waitTypeAndTabWithLabel(col, cell);
			break;
		case "DDL":
			inputDDLThenEnter(col, cell);
			break;
		case "RADIO":
			selectRadioBoxGroup(col, cell);
			break;
		case "DATE":
			inputDateTime(col, cell);
			break;
		}
	}
	
	@Override
	public void inputDateTime(String label, String datetime) {
		String[] date = datetime.split("/");
		// input month value
		waitTypeAndTab(XFormat.of(XPATH_DATETIME, label, "month"), date[0]);
		// input date value
		waitTypeAndTab(XFormat.of(XPATH_DATETIME, label, "day"), date[1]);
		// input year value
		waitTypeAndTab(XFormat.of(XPATH_DATETIME, label, "year"), date[2]);
		waitAbit(500);
	}

	@Override
	public void clickProfile() {
		clickOnElement("//input[@type='text' and @value='[not defined]']");

	}

	@Override
	public void chooseProfile() {
		clickOnElement("//div[@id=\"ebx_ISS_Results\"]/div[contains(text(),'(admin)')]");
	}
}
