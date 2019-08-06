package com.orchestranetworks.auto.addon.common.pages;

import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.LoadConfig;
import com.orchestranetworks.auto.addon.LogWork;
import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.XFormat;
import com.orchestranetworks.auto.addon.common.WebPageObject;

public class CommonPage extends WebPageObject {

	public CommonPage(WebDriver driver) {
		super(driver);
	}

	private static final String XPATH_SECTION_TREE_REDUCED = "_ebx-tree_section _ebx-tree_section_is-reduced";
	private static final String XPATH_MENU_ICON_PERSPECTIVE = "//div[@class='_ebx-custom-perspective-navigation_menu_icon']";
	private static final String NAVIGATION_ITEM = "//span[text()='%s']";
	private static final String XPATH_SELECTOR_PANEL = "//div[@class='yui-panel-container shadow']";

	private static final String TITLE_MENU_TITLE_DATASET = "Data";
	private static final String TITLE_MENU_TITLE_DATASPACE = "Dataspaces";
	private static final String TITLE_MENU_TITLE_WORKFLOW = "Data workflows";
	private static final String TITLE_MENU_TITLE_INSIGHT = "Insight";
	private static final String TITLE_MENU_TITLE_DATAMODEL = "Data models";
	private static final String TITLE_MENU_TITLE_WORKFLOW_MODEL = "Workflow models";
	private static final String TITLE_MENU_TITLE_SERVICE = "Data services";
	private static final String TITLE_MENU_TITLE_ADMINISTRATION = "Administration";
	//
	private static final String XPATH_BTN_LOGOUT = "//button[@id='ebx_Logout']";
	private static final String XPATH_USER_PANEL = "//div[@class='_ebx-profile_avatar _ebx-profile_avatar-only']";
	private static final String XPATH_LANGUAGE = "//span[@class='ebx-simpleButton-label' and text()='Language']";
	private static final String XPATH_CHOOSE_LANGUAGE = "//span[@class='_ebx-menu_item_label' and text()='%s']";
	private static final String XPATH_PERSPECTIVE_NAME = "//ul[@class='_ebx-menu_list']//span[text()='%s']";
	private static final String XPATH_SELECTION_MENU_OPTION = "//div[@id='ebx_MenuForMenuButtons']//a[.='%s']";
	private static final String XPATH_NEW_DATASET_NAME = "//h2[contains(@class,'menu-selector-is-sub-title')]//span[@class='_ebx-documentation-label']";

	public void access_to_homepage() {
		open();
		clearCache();
		getDriver().navigate().to(LoadConfig.getURL());
		getDriver().manage().window().maximize();

		waitForAllLoadingCompleted();
	}

	public void clearCache() {
		getDriver().manage().deleteAllCookies();
		// Actions actionObject = new Actions(getDriver());
		// actionObject.keyDown(Keys.CONTROL).sendKeys(Keys.F5).keyUp(Keys.CONTROL).perform();
		executeJS(Constants.JS_LOCAL_STORAGE_CLEAR);
		executeJS(Constants.JS_SESSION_STORAGE_CLEAR);
	}

	public void click_on_user_panel() {
		findBy(XPATH_USER_PANEL).click();

	}

	public void click_btn_logout() {
		findBy(XPATH_BTN_LOGOUT).click();

	}

	public void click_menu(String title) {
		switchOutDefaultIFrame();
		switch (title.toLowerCase()) {
		case "dataset":
			title = TITLE_MENU_TITLE_DATASET;
			break;
		case "dataspace":
			title = TITLE_MENU_TITLE_DATASPACE;
			break;
		case "workflow":
			title = TITLE_MENU_TITLE_WORKFLOW;
			break;
		case "insight":
			title = TITLE_MENU_TITLE_INSIGHT;
			break;
		case "datamodel":
			title = TITLE_MENU_TITLE_DATAMODEL;
			break;
		case "workflow model":
			title = TITLE_MENU_TITLE_WORKFLOW_MODEL;
			break;
		case "data service":
			title = TITLE_MENU_TITLE_SERVICE;
			break;
		case "administration":
			title = TITLE_MENU_TITLE_ADMINISTRATION;
			break;
		default:
			LogWork.info("There is no menu or wrong XPATH");
			break;
		}
		clickOnElement(findBy("title", title));
	}

	// MuaBT add
	public void click_on_language() {
		findBy(XPATH_LANGUAGE).click();
	}

	public void click_on_choose_language(String languagename) {
		findBy(XFormat.of(XPATH_CHOOSE_LANGUAGE, languagename)).click();
	}

	// ***********************************************

	private String get_text_dataset_name(String keyTitle) {
		waitForAllLoadingCompleted();
		String label = getElement(XPATH_NEW_DATASET_NAME).getText();
		SessionData.saveValueToSession(keyTitle, label);
		return label;
	}

	public void select_perspective(String name) {
		clickBtn(Constants.BTN_PERSPECTIVE);
		waitForAllLoadingCompleted();
		clickOnElement(XFormat.of(XPATH_PERSPECTIVE_NAME, name));

	}

	public void go_to_perspective_action(String path) {
		String[] itemList = path.split(" > ");
		collapseAll();
		for (int i = 0; i < itemList.length - 1; i++) {
			expandItem(itemList[i]);
			waitABit(2000);
		}
		select_menu_item_perspective(itemList[itemList.length - 1]);
	}

	public void select_menu_item_perspective(String item) {
		item = SessionData.getValueFromSession(item);
		boolean isPresent = findAllElement(XPATH_SECTION_TREE_REDUCED).size() > 0;
		if (isPresent) {
			clickOnElement(XPATH_MENU_ICON_PERSPECTIVE);
			clickOnElement(XFormat.of(NAVIGATION_ITEM, item));
		} else {
			clickOnElement(XFormat.of(NAVIGATION_ITEM, item));
		}
	}

	public void click_btn_select_and_sort() {
		clickBtn(Constants.BTN_SELECT_AND_SORT);
	}

	public void select_option_of_table(String option) {
		clickOnElement(XFormat.of(XPATH_SELECTION_MENU_OPTION, option));
	}

	public void click_btn_save_and_close() {
		clickBtn(Constants.BTN_SAVE_AND_CLOSE);
		switchOutDefaultIFrame();
	}

	public void click_btn_apply() {
		clickBtn(Constants.BTN_APPLY);
	}

	public void go_to_admin_service(String service) {
		go_to_navigation(service);
	}

	public void confirm_popup() {
		confirmPopupOK();
	}

	public void click_btn_submit() {
		clickBtn("Submit");
	}

	public void go_to_navigation(String path) {
		String[] itemList = path.split(">");
		collapseAll();
		for (int i = 0; i < itemList.length - 1; i++) {
			expandItem(itemList[i]);
			waitABit(2000);
		}
		selectNavigationMenuItem(itemList[itemList.length - 1]);
	}

	public void selectNavigationMenuItem(String item) {
		item = SessionData.getValueFromSession(item);
		clickOnElement(XFormat.of(NAVIGATION_ITEM, item));
	}

	public void remove_div() {
		switchToIFrame(Constants.IFRAME_LEGACY);
		boolean isPresent = findAllElement(XPATH_SELECTOR_PANEL).size() > 0;
		if (isPresent) {
			((JavascriptExecutor) getDriver()).executeScript("arguments[0].style.visibility='hidden';",
					findBy(XPATH_SELECTOR_PANEL));
			waitForInvisibilityOfElement(XPATH_SELECTOR_PANEL);
		}
		waitAbit(2000);
	}

	public void select_an_admin_feature() {
		remove_div();
		clickOnElement("//h2[@title='Select dataset']");
	}
}
