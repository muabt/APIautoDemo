package com.orchestranetworks.auto.addon.common.pages;

import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.common.WebPageObject;

public class DataspacePage extends WebPageObject {

	private static final String BTN_CREATE_A_DATASPACE = "Create a dataspace";
	private static final String XPATH_SERVICE = "//a[text()='%s']|//span[text()='%s']";

	public DataspacePage(WebDriver driver) {
		super(driver);
	}

	public void select_dataspace_service(String servicePath) {
		String[] services = servicePath.split(">");
		for (int i = 0; i < services.length; i++) {
			clickOnElement(XPATH_SERVICE);
		}
		waitForAllLoadingCompleted();

	}

	public void click_btn_create_dataspace() {
		switchToLastIFrame();
		clickBtn(BTN_CREATE_A_DATASPACE);

	}

	public void select_owner(String owner) {
		enterDDLInput(Constants.LBL_OWNER, owner);
	}

	public void enter_english_label(String engLabel) {
		waitTypeAndTabWithLabel(Constants.LBL_LABEL, engLabel);

	}

	public void enter_identifier(String identifier) {
		waitTypeAndTabWithLabel(Constants.LBL_IDENTIFIER, identifier);
	}

	public void click_dataspace_actions(String string) {
		clickBtn(Constants.BTN_ACTIONS);

	}

}
