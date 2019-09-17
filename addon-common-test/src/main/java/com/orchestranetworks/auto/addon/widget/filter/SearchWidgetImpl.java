package com.orchestranetworks.auto.addon.widget.filter;

import com.orchestranetworks.auto.addon.XFormat;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class SearchWidgetImpl extends BaseWidgetImpl implements SearchWidget {
    private static final String XPATH_SEARCH_TEXTBOX = "//input[@name='%s']";
    public static final String NAVIGATION_ITEM = "//a//descendant-or-self::*[text()='%s']";
    private static final String XPATH_EXPAND_BUTTON = "//label[contains(.,'%s')]//button[@title='expand']";

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
    public void selectSearchCriteria(String criteria) {
        String xPathAddCri = "//option[.='Add a criterion']/parent::select";
        String xPathValue = "//select/option[contains(.,'" + criteria + "')]";
        clickOnElement(xPathAddCri);
        waitElementToBePresent(xPathValue).waitUntilClickable().click();
        waitForAllLoadingCompleted();

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
    public void addLogicalBlock() {
        String xPathParent = "//div[@id='ebx_FilterBlockList']";
        clickBtn(xPathParent, Constants.BTN_ACTIONS);
        clickOnElement(XFormat.of(NAVIGATION_ITEM, Constants.ADD_LOGICAL_BLOCK));
        waitForAllLoadingCompleted();
        switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
    }

}
