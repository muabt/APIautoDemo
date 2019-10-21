package com.orchestranetworks.auto.addon.widget.filter;

import com.orchestranetworks.auto.addon.utils.XFormat;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class SearchWidgetImpl extends BaseWidgetImpl implements SearchWidget {
    private static final String XPATH_SEARCH_TEXTBOX = "//input[@name='%s']";
    private static final String NAVIGATION_ITEM = "//a//descendant-or-self::*[text()='%s']";
    private static final String XPATH_EXPAND_BUTTON = "//label[contains(.,'%s')]//button[@title='expand']";
    private static final String XPATH_SEARCH_FIELD = "(//span[text()='%s']/ancestor::div[contains(@class,'ebx_SSFFakeFieldset')])[last()]";
    private static final String XPATH_BTN_DELETE_OCCURRENCE = "(//button[@title='Delete this occurrence.'])";

    public SearchWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
                            long timeoutInMilliseconds) {
        super(page, locator, webElement, timeoutInMilliseconds);
    }

    public SearchWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    @Override
    public void clickApplyTextSearch() {
        clickBtn(Constants.BTN_APPLY, 2);
        waitForAllLoadingCompleted();
    }

    @Override
    public void clickApplyAdvancedSearch() {
        clickBtn(Constants.BTN_APPLY, 1);
        waitForAllLoadingCompleted();

    }

    public void clickApply(int index) {
        clickBtn(Constants.BTN_APPLY, index);
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

    /**
     * Click to button expand
     *
     * @param label label of the button that need to expand
     */
    @Override
    public void clickBtnExpandWithLabel(String label) {
        clickOnElement(XFormat.of(XPATH_EXPAND_BUTTON, label));
        waitForAllLoadingCompleted();
    }

    @Override
    public void switchToFilterPanel() {
        switchToIFrame(Constants.IFRAME_LEGACY);
    }

    /**
     * Select logical search value
     *
     * @param logical logical value
     */
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

    /**
     * Select operator for individual field
     *
     * @param operator operator to select
     * @param field    field to select
     */
    @Override
    public void selectOperatorOfField(String operator, String field) {
        String xPathDDLOfField = XFormat.of(XPATH_SEARCH_FIELD, field) + "//select";
        String xPathOper = xPathDDLOfField + "/option[text()='" + operator + "']";
        clickOnElement(xPathDDLOfField);
        waitElementToBePresent(xPathOper).waitUntilClickable().click();
    }

    /**
     * Input search value into a criterion
     *
     * @param value     input search value
     * @param type      type of input value
     * @param fieldName field name to input value
     */
    @Override
    public void inputSearchValue(String value, String type, String fieldName) {
        String xPathTxtOfField = "(" + XFormat.of(XPATH_SEARCH_FIELD, fieldName) + "//div//input)[last()]";
        String xPathEnum = XFormat.of(XPATH_SEARCH_FIELD, fieldName) + "//div//button[@title='Open drop-down list']";
        String xPathCheckbox = XFormat.of(XPATH_SEARCH_FIELD, fieldName) + "//tr//label[text()='" + value + "']";

        switch (type) {
            case "INPUT":
                waitTypeAndTab(xPathTxtOfField, value);
                break;
            case "ENUMERATION":
                String[] itemList = value.split(",");
                for (int j = 0; j < itemList.length; j++) {
                    selectDDLbyJS(xPathEnum, value);
                    waitAbit(500);
                }
                break;
            case "DATE":
                inputDateTime(fieldName, value);
                break;
            case "BOOLEAN":
                waitElementToBePresent(xPathCheckbox).waitUntilClickable().click();
                waitAbit(500);
                break;
        }
    }

    /**
     * Switch to advanced mode
     */
    @Override
    public void selectAdvancedMode() {
        String xPathParent = "//div[@id='ebx_FilterBlockList']";
        clickBtn(xPathParent, Constants.BTN_ACTIONS);
        clickOnElement(XFormat.of(NAVIGATION_ITEM, Constants.ADVANCED_MODE));
    }

    /**
     * Unselect a field in search window
     *
     * @param field field to unselect
     */
    @Override
    public void unselectField(String field) {
        uncheckCheckbox(field);
    }

    /**
     * Select the checkbox field
     *
     * @param searchType type of search. Eg: Text search, Validation search
     * @param label      check box label. Eg: Id, First Name...
     */
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

    /**
     * Click to button Add logical block
     */
    @Override
    public void addLogicalBlock() {
        String xPathParent = "//div[@id='ebx_FilterBlockList']";
        clickBtn(xPathParent, Constants.BTN_ACTIONS);
        clickOnElement(XFormat.of(NAVIGATION_ITEM, Constants.ADD_LOGICAL_BLOCK));
        waitForAllLoadingCompleted();
        switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
    }

    /**
     * Click to button add
     */
    @Override
    public void clickBtnAddBlock() {
        clickBtn(Constants.BTN_ADD);
        switchToIFrame(Constants.IFRAME_LEGACY);
    }

    /**
     * Select checkbox for search item
     *
     * @param searchType search type, eg Validation search, Text search
     * @param fieldName  field need to check
     */
    @Override
    public void selectSearchItem(String searchType, String fieldName) {
        if (searchType.equals(Constants.FUZZY_SEARCH)) {
            checkCheckbox("//form[@id='FILTER_4_filterForm']", fieldName, 1);
            waitForAllLoadingCompleted();
        } else {
            checkCheckbox(fieldName);
            waitForAllLoadingCompleted();
        }
    }

    @Override
    public void removeAllOccurrence() {
        int numOfButton = findAllElements(XPATH_BTN_DELETE_OCCURRENCE).size();
        for (int i = numOfButton; i >= 1; i--) {
            clickOnElement(XPATH_BTN_DELETE_OCCURRENCE + "[" + i + "]");
            numOfButton = findAllElements(XPATH_BTN_DELETE_OCCURRENCE).size();
        }
    }

    @Override
    public boolean isAdvancedSearchActivated() {
        System.out.println("Filter: " + isElementExistNow("//button[@class='ebx_Button ebx_IconButton ebx_DefaultButton ebx_Filter ebx_ButtonPushed']"));
        return isElementExistNow("//button[@class='ebx_Button ebx_IconButton ebx_DefaultButton ebx_Filter ebx_ButtonPushed']");
    }
}
