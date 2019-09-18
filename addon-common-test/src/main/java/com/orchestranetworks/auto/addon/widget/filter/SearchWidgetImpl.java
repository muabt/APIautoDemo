package com.orchestranetworks.auto.addon.widget.filter;

import com.orchestranetworks.auto.addon.XFormat;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class SearchWidgetImpl extends BaseWidgetImpl implements SearchWidget {
    private static final String XPATH_SEARCH_TEXTBOX = "//input[@name='%s']";
    private static final String NAVIGATION_ITEM = "//a//descendant-or-self::*[text()='%s']";
    private static final String XPATH_EXPAND_BUTTON = "//label[contains(.,'%s')]//button[@title='expand']";
    private static final String XPATH_SEARCH_FIELD = "//span[text()='%s']/ancestor::div[contains(@class,'ebx_SSFFakeFieldset')]";

    public SearchWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
                            long timeoutInMilliseconds) {
        super(page, locator, webElement, timeoutInMilliseconds);
    }

    public SearchWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    @Override
    public void clickApply() {
        clickBtn(Constants.BTN_APPLY, 1);
        waitForAllLoadingCompleted();
    }

    @Override
    public void inputTextKeyword(String keyword) {
        waitTypeAndTab(XFormat.of(XPATH_SEARCH_TEXTBOX, "criteria"), keyword);
    }

    @Override
    public void inputValidationKeyword(String keyword) {
        waitTypeAndTab(XFormat.of(XPATH_SEARCH_TEXTBOX, "message"), keyword);
    }

    @Override
    public void inputFuzzyKeyword(String keyword) {
        waitTypeAndTab(XFormat.of(XPATH_SEARCH_TEXTBOX, "TESE_AUTO_searchValue"), keyword);
    }

    @Override
    public void clickBtnExpand(String label) {
        clickOnElement(XFormat.of(XPATH_EXPAND_BUTTON, label));
        waitForAllLoadingCompleted();
    }

    @Override
    public void switchToFilterPanel() {
        switchToIFrame(Constants.IFRAME_LEGACY);
    }

    @Override
    public void selectLogicalSearch(String logical) {
        String xPathLogical = "//option[.='All criteria match']/parent::select";
        String xPathValue = "//select/option[contains(.,'" + logical + "')]";

        clickOnElement(xPathLogical);
        waitElementToBePresent(xPathValue).waitUntilClickable().click();
        waitForAllLoadingCompleted();
    }

    @Override
    public void selectSearchCriteria(String criteria) {
        String xPathAddCri = "//option[.='Add a criterion']/parent::select";
        String xPathValue = "//select/option[contains(.,'" + criteria + "')]";
        clickOnElement(xPathAddCri);
        waitElementToBePresent(xPathValue).waitUntilClickable().click();
        waitForAllLoadingCompleted();

    }

    @Override
    public void selectOperatorOfField(String operator, String field) {
        String xPathDDLOfField = XFormat.of(XPATH_SEARCH_FIELD, field) + "//select";
        String xPathOper = xPathDDLOfField + "/option[text()='" + operator + "']";
        clickOnElement(xPathDDLOfField);
        waitElementToBePresent(xPathOper).waitUntilClickable().click();
    }

    @Override
    public void inputSearchValue(String value, String type, String fieldName) {
        String xPathTxtOfField = XFormat.of(XPATH_SEARCH_FIELD, fieldName) + "//div//input";
        String xPathEnum = XFormat.of(XPATH_SEARCH_FIELD, fieldName) + "//div//input[@value='Select an item to add']";
        String xPathCheckbox = XFormat.of(XPATH_SEARCH_FIELD, fieldName) + "//tr//label[text()='" + value + "']";

        switch (type) {
            case "INPUT":
                waitTypeAndTab(xPathTxtOfField, value);
                break;
//            case "ENUM":
//                input_ddl_then_enter(xPathEnum, value);
//                waitAbit(500);
//                break;
//            case "DATE":
//                input_date_time(fieldName, value);
//                break;
            case "BOOLEAN":
                waitElementToBePresent(xPathCheckbox).waitUntilClickable().click();
                waitAbit(500);
                break;
        }
    }

    @Override
    public void selectAdvancedMode() {
        String xPathParent = "//div[@id='ebx_FilterBlockList']";
        clickBtn(xPathParent, Constants.BTN_ACTIONS);
        clickOnElement(XFormat.of(NAVIGATION_ITEM, Constants.ADVANCED_MODE));
    }

    @Override
    public void unselectField(String field) {
        uncheckCheckbox(field);
    }

    @Override
    public void selectField(String searchType, String label) {
        if (searchType.equals(Constants.FUZZY_SEARCH)) {
            checkCheckbox("//form[@id='FILTER_4_filterForm']", label, 1);
            waitAbit(500);
        } else {
            checkCheckbox(label);
            waitAbit(500);
        }
    }

    @Override
    public void addLogicalBlock() {
        String xPathParent = "//div[@id='ebx_FilterBlockList']";
        clickBtn(xPathParent, Constants.BTN_ACTIONS);
        clickOnElement(XFormat.of(NAVIGATION_ITEM, Constants.ADD_LOGICAL_BLOCK));
        waitForAllLoadingCompleted();
        switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
    }

    @Override
    public void clickBtnAddBlock() {
        clickBtn(Constants.BTN_ADD);
        switchToIFrame(Constants.IFRAME_LEGACY);
    }

}
