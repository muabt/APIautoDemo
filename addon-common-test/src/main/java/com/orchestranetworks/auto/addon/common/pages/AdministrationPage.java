package com.orchestranetworks.auto.addon.common.pages;

import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.XFormat;
import com.orchestranetworks.auto.addon.common.WebPageObject;

public class AdministrationPage extends WebPageObject {
	
	private static final String NAVIGATION_ITEM = "//span[%s]";
	private static final String XPATH_SELECTOR_PANEL = "//div[@class='yui-panel-container shadow']";
	private static final String XPATH_TABLE = "//table[@class='ebx_tvFixed']";

	public AdministrationPage(WebDriver driver) {
		super(driver);
	}

	public void select_an_admin_feature() {
		remove_div_on_administration_workspace();
		clickBtn(Constants.BTN_SELECT_ADMIN_FEATURE);
	}

	private void remove_div_on_administration_workspace() {
		switchToIFrame(Constants.IFRAME_LEGACY);
		boolean isPresent = findAllElement(XPATH_SELECTOR_PANEL).size() > 0;
		if (isPresent) {
			((JavascriptExecutor) getDriver()).executeScript("arguments[0].style.visibility='hidden';",
					findBy(XPATH_SELECTOR_PANEL));
			((JavascriptExecutor) getDriver()).executeScript("arguments[0].style.visibility='hidden';",
					findBy("//div[@id='ebx_SelectorPanel_mask']"));
			waitForInvisibilityOfElement(XPATH_SELECTOR_PANEL);
		}
		waitAbit(1000);
	}

	public void click_on_table_service_of_administration(String tableName) {
		clickOnElement(XFormat.of(NAVIGATION_ITEM, sSpecialTextPredicates(tableName)));
		waitForPresenceOfElement(XPATH_TABLE);
	}

	public void go_to_admin_service(String service) {
		go_to_navigation(service);
	}
	
	public void go_to_navigation(String path) {
		String[] itemList = path.split(">");
		collapseAll();
		for (int i = 0; i < itemList.length - 1; i++) {
			expandItem(itemList[i].trim());
			waitABit(2000);
		}
		selectNavigationMenuItem(itemList[itemList.length - 1]);
	}

	public void selectNavigationMenuItem(String item) {
		item = SessionData.getValueFromSession(item);
		clickOnElement(XFormat.of(NAVIGATION_ITEM, sSpecialTextPredicates(item)));
	}
	
	public void go_to_group_administration(String item) {
		switchToIFrame(Constants.IFRAME_LEGACY);
		clickOnElement("//span/a[contains(text(),'" + item + "')]");
		clickOnElement("//div[@id='ebx_NavigationTree']//a");
		waitAbit(2000);
	}
	
	public void go_to_administration_item(String item) {
		clickOnElement("//span/a/span/span[contains(text(),'" + item + "')]");
		waitAbit(2000);
	}
}
