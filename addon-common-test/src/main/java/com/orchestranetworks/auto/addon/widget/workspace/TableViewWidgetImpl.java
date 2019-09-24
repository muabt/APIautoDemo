package com.orchestranetworks.auto.addon.widget.workspace;

import java.util.List;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.XFormat;
import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;

public class TableViewWidgetImpl extends BaseWidgetImpl implements TableViewWidget {

    private static final String XPATH_TABLE = "//table[@class='ebx_tvFixed']";
    public static final String XPATH_CHECKBOX_RECORD = "//div[@id='ebx_WorkspaceContent']//tr[(td[%1$s]) or (td/div[%1$s])]//input[@type='checkbox']";
    private static final String XPATH_NO_RECORDS_FOUND = "//div[contains(@class,'tvMessageEmpty') and .='No records found.']";
    public static final String NAVIGATION_ITEM = "//a//descendant-or-self::*[text()='%s']";

    public TableViewWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
                               long timeoutInMilliseconds) {
        super(page, locator, webElement, timeoutInMilliseconds);
    }

    public TableViewWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    @Override
    public void selectFirstRecords(int numberOfRecords) {
        for (int i = 1; i <= numberOfRecords; i++) {
            selectRecordWithIndex(i);
        }
    }
    
    @Override
    public void selectLastRecord() {
    	String xPathSelectRecord = "(//td[@class='ebx_tvSelectCell']//input[@type='checkbox'])";
    	List<WebElementFacade> list = getPage().findAll(xPathSelectRecord);
    	
    	if (list.size() > 0) {
    		int lastIndex = list.size();
    		selectRecordWithIndex(lastIndex);
    		waitForInvisibilityOfElement(xPathSelectRecord);
    	}
        
        
    }

    private void selectRecordWithIndex(int index) {
        String xPathSelectRecord = "(//td[@class='ebx_tvSelectCell']//input[@type='checkbox'])[" + index + "]";
        // Use waitUntilClickable will throw TimeoutException, so just click() only
        getElement(xPathSelectRecord).click();
        waitForInvisibilityOfElement(xPathSelectRecord);
    }

    @Override
    public void selectRecordWithPK(String[] primaryKey) {
        String xPathRow = "//div[@id='ebx_WorkspaceContent']//tr[(td[%s])";
        primaryKey[0] = sSpecialTextPredicates(primaryKey[0]);
        if (primaryKey.length >= 2) {
            for (int i = 1; i < primaryKey.length; i++) {
                primaryKey[i] = sSpecialTextPredicates(primaryKey[i]);
                xPathRow += " and (td[%s])";
            }
        }
        xPathRow += "]";
        xPathRow = XFormat.of(xPathRow, primaryKey);
        switchToLastIFrame();
        clickByJS(xPathRow + "//input[@type='checkbox']");
    }

    @Override
    public void selectRecordWithPK(String recordPK) {
        waitForPresenceOfElement(XPATH_TABLE);
        clickByJS(XFormat.of(XPATH_CHECKBOX_RECORD, sSpecialTextPredicates(recordPK)));
    }

    /**
     * TODO: Change param name to meaningful name
     *
     */
    @Override
    public void accessRecordWithText(String tableName) {
        String xPath = "(//table[@class='ebx_tvMain']//td[text()='" + tableName + "'])[1]";
        executeJS("var evt = document.createEvent('MouseEvents');" + "evt.initMouseEvent('dblclick',true, true, window, 0, 0, 0, 0, 0, false, false, false, false, 0,null);" + "arguments[0].dispatchEvent(evt);", xPath);
    }


    public boolean existRecordInTable() {
        switchToLastIFrame();
        return !isElementExistNow(XPATH_NO_RECORDS_FOUND);
    }


    public void selectAllRecord() {
        clickOnElement(XFormat.of(NAVIGATION_ITEM, "Select all in page"));
    }

    public void clickBtnSelectAndSort() {
        switchToLastIFrame();
        clickBtn(Constants.BTN_SELECT_AND_SORT);
    }


    @Override
    public String get_text_data_cell(int rowInd, String colCode) {
        int colIndex = getColumnIndexWithLabel(colCode);
        return getTextDataCell(rowInd, colIndex);
    }
}
