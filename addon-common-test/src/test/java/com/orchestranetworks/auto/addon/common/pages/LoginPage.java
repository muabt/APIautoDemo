package com.orchestranetworks.auto.addon.common.pages;

import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.WebPageObject;

public class LoginPage extends WebPageObject {

	private static final String BTN_SELECT_PERSPECTIVE = "Select perspective";
	private static final String XPATH_DIV_LOADING = "//div[@class='_ebx-loading']";
	private static final String XPATH_LOADER_GIF = "//img[contains(@src,'images/loader.gif')]";
	private static final String XPATH_NAVIGATION_PANEL = "//div[@class='_ebx-modeless-modal _ebx-modeless-modal-with-background']";
	private static final String XPATH_INPUT_PASSWORD = "//input[@name='password']";
	private static final String XPATH_INPUT_NAME = "//input[@name='login']";

	public LoginPage(WebDriver driver) {
		super(driver);
	}

	private static final String XPATH_USER_ERROR = "//div[child::input[@type='text']]//p[@class='_ebx-component-with-label_message']|//div[@class='_login_form_error']";
	private static final String XPATH_PASS_ERROR = "//div[child::input[@type='password']]//p[@class='_ebx-component-with-label_message']";

	public void enter_username(String username) {
		waitTypeAndTab(XPATH_INPUT_NAME, username);

	}

	public void enter_password(String password) {
		waitTypeAndTab(XPATH_INPUT_PASSWORD, password);

	}

	public void click_btn_login() {
		clickBtn("Log in");
		waitForAllLoadingCompleted();
	}

	public boolean is_login_success() {
		waitForNotPresenceOfElement(XPATH_LOADER_GIF);
		waitForNotPresenceOfElement(XPATH_DIV_LOADING);
		return isElementExistNow(xPathBtn(BTN_SELECT_PERSPECTIVE)) ? true : false;
	}

	public String get_login_error_message() {
		return getText(XPATH_USER_ERROR);
	}

	public String get_pass_error_message() {
		return getText(XPATH_PASS_ERROR);
	}

	public void remove_choose_dataset_div() {
		String xPathDatasetDiv = XPATH_NAVIGATION_PANEL;
		boolean isPresent = findAllElement(xPathDatasetDiv).size() > 0;
		if (isPresent) {
			((JavascriptExecutor) getDriver()).executeScript(Constants.JS_HIDDEN, findBy(xPathDatasetDiv));
			waitForInvisibilityOfElement(xPathDatasetDiv);

		}
	}

}
