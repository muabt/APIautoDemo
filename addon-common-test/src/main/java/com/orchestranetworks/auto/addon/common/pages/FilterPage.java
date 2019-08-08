package com.orchestranetworks.auto.addon.common.pages;

import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.XFormat;
import com.orchestranetworks.auto.addon.common.WebPageObject;

import net.serenitybdd.core.pages.WebElementFacade;

public class FilterPage extends WebPageObject {

	public FilterPage(WebDriver driver) {
		super(driver);
	}

	private static final String XPATH_SEARCH_FIELD = "//span[text()='%s']/ancestor::div[contains(@class,'ebx_SSFFakeFieldset')]";
	private static final String XPATH_DATETIME = "//span[text()='%s']/ancestor::div[contains(@class,'ebx_SSFFakeFieldset')]//span/input[contains(@name,'%s')]";
	private static final String BTN_FILTERS = "Filters";
	private static final String XPATH_EXPAND_BUTTON = "//label[contains(.,'%s')]//button[@title='expand']";
	private static final String XPATH_SEARCH_TEXTBOX = "//input[@name='%s']";
	private static final String BTN_CLOSE_POPUP = "//div[@class='_ebx-pop-up_bottom']//*[.='Close']";
	private static final String XPATH_POPUP_MESSAGE = "//div[@class='_ebx-pop-up']//*[@class='_ebx-notification-box_list_item']";
	public static final String NAVIGATION_ITEM = "//a//descendant-or-self::*[text()='%s']";

	public void select_field_to_search(String searchType, String label) {
		if (searchType.equals(Constants.TEXT_SEARCH) || searchType.equals(Constants.VALIDATION_SEARCH)) {
			checkCheckbox(label);
			waitAbit(500);
		} else {
			checkCheckbox("//form[@id='FILTER_4_filterForm']", label, 1);
			waitAbit(500);
		}
	}

	public void click_btn_expand_with_label(String label) {
		clickOnElement(XFormat.of(XPATH_EXPAND_BUTTON, label));
		waitForAllLoadingCompleted();
	}

	public String get_text_popup_message() {
		waitForAllLoadingCompleted();
		switchOutDefaultIFrame();
		return getTextValue(XPATH_POPUP_MESSAGE);
	}

	public void click_btn_close_popup() {
		clickOnElement(BTN_CLOSE_POPUP);
		waitForAllLoadingCompleted();
	}

	public void click_btn_apply_search() {
		clickBtn(Constants.BTN_APPLY, 1);
		waitForAllLoadingCompleted();
	}

	public void click_btn_add_block() {
		clickBtn(Constants.BTN_ADD);
		switchToIFrame(Constants.IFRAME_LEGACY);
	}

	public void click_btn_apply_text_search() {
		clickBtn(Constants.BTN_APPLY, 2);
		waitForAllLoadingCompleted();
	}

	public void click_btn_apply_validation_search() {
		clickBtn(Constants.BTN_APPLY, 3);
		waitForAllLoadingCompleted();
	}

	public void click_btn_apply_fuzzy_search() {
		clickBtn(Constants.BTN_APPLY, 4);
		waitForAllLoadingCompleted();
	}

	public void select_search_criteria(String criteria) {
		select_ddl_add_criterion(criteria);
		waitAbit(1000);
	}

	public void click_btn_filter() {
		clickBtn(BTN_FILTERS);
	}

	public void input_date_time(String label, String datetime) {
		String[] date = datetime.split("/");
		// input month value
		waitTypeAndTab(XFormat.of(XPATH_DATETIME, label, "month"), date[0]);
		// input date value
		waitTypeAndTab(XFormat.of(XPATH_DATETIME, label, "day"), date[1]);
		// input year value
		waitTypeAndTab(XFormat.of(XPATH_DATETIME, label, "year"), date[2]);
		waitABit(1000);
	}

	public void select_operator_of_field(String oper, String fieldName) {
		String xPathDDLOfField = XFormat.of(XPATH_SEARCH_FIELD, fieldName) + "//select";
		String xPathOper = xPathDDLOfField + "/option[text()='" + oper + "']";
		clickOnElement(xPathDDLOfField);
		waitElementToBePresent(xPathOper).waitUntilClickable().click();
	}

	public void input_ddl_then_enter(String xPathDDL, String value) {
		WebElementFacade e = waitElementToBePresent(xPathDDL);
		e.clear();
		e.type(value);
		waitABit(1000);
		e.sendKeys(Keys.ENTER);
	}

	private void select_ddl_add_criterion(String value) {
		String xPathAddCri = "//option[.='Add a criterion']/parent::select";
		String xPathValue = "//select/option[contains(.,'" + value + "')]";
		clickOnElement(xPathAddCri);
		waitElementToBePresent(xPathValue).waitUntilClickable().click();
		waitForAllLoadingCompleted();
	}

	public void input_search_value(String value, String type, String fieldName) {
		String xPathTxtOfField = XFormat.of(XPATH_SEARCH_FIELD, fieldName) + "//div//input";
		String xPathEnum = XFormat.of(XPATH_SEARCH_FIELD, fieldName) + "//div//input[@value='Select an item to add']";
		String xPathCheckbox = XFormat.of(XPATH_SEARCH_FIELD, fieldName) + "//tr//label[text()='" + value + "']";

		switch (type) {
		case "INPUT":
			waitTypeAndTab(xPathTxtOfField, value);
			break;
		case "ENUM":
			input_ddl_then_enter(xPathEnum, value);
			waitAbit(500);
			break;
		case "DATE":
			input_date_time(fieldName, value);
			break;
		case "BOOLEAN":
			waitElementToBePresent(xPathCheckbox).waitUntilClickable().click();
			waitAbit(500);
			break;
		}
	}

	public void input_text_keyword(String keyword) {
		waitTypeAndTab(XFormat.of(XPATH_SEARCH_TEXTBOX, "criteria"), keyword);
	}

	public void input_validation_keyword(String keyword) {
		waitTypeAndTab(XFormat.of(XPATH_SEARCH_TEXTBOX, "message"), keyword);

	}

	public void input_fuzzy_keyword(String keyword) {
		waitTypeAndTab(XFormat.of(XPATH_SEARCH_TEXTBOX, "TESE_searchValue"), keyword);

	}

	public void select_advanced_mode() {
		String xPathParent = "//div[@id='ebx_FilterBlockList']";
		clickBtn(xPathParent, Constants.BTN_ACTIONS);
		clickOnElement(XFormat.of(NAVIGATION_ITEM, Constants.ADVANCED_MODE));
	}

	public void add_logical_block() {
		String xPathParent = "//div[@id='ebx_FilterBlockList']";
		clickBtn(xPathParent, Constants.BTN_ACTIONS);
		clickOnElement(XFormat.of(NAVIGATION_ITEM, Constants.ADD_LOGICAL_BLOCK));
		waitForAllLoadingCompleted();
		switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
	}

	public void select_logical_block_info(String logicalValue, String criteria) {
		select_logical_search(logicalValue);
		select_ddl_add_criterion(criteria);
	}

	public void select_logical_search(String value) {
		String xPathLogical = "//option[.='All criteria match']/parent::select";
		String xPathValue = "//select/option[contains(.,'" + value + "')]";

		clickOnElement(xPathLogical);
		waitElementToBePresent(xPathValue).waitUntilClickable().click();
		waitForAllLoadingCompleted();
	}
}
