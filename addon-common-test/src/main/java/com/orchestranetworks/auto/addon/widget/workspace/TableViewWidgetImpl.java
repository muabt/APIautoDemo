package com.orchestranetworks.auto.addon.widget.workspace;

import java.util.ArrayList;
import java.util.List;

import com.google.common.base.Joiner;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.orchestranetworks.auto.addon.common.TableObject;
import net.serenitybdd.core.Serenity;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.server.handler.DeleteSession;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.utils.XFormat;
import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;

public class TableViewWidgetImpl extends BaseWidgetImpl implements TableViewWidget {

    private static final String XPATH_TABLE = "//table[@class='ebx_tvFixed']";
    public static final String XPATH_CHECKBOX_RECORD = "//div[@id='ebx_WorkspaceContent']//tr[(td[%1$s]) or (td/div[%1$s])]//input[@type='checkbox']";
    private static final String XPATH_NO_RECORDS_FOUND = "//div[@class='ebx_tvMessageEmpty ebx_ValueND'  and .='No records found.']";
    public static final String NAVIGATION_ITEM = "//a//descendant-or-self::*[text()='%s']";
    public static final String XPATH_SELECT_AND_SORT = "//button[@title='Select and sort']";

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
    public void selectCheckboxWithText(String text) {
        String xpath = "(//td[@class='ebx_tvSelectCell']//input[@type='checkbox'])" +
                "[count(//div[@id='ebx_WorkspaceContent']//tr[td[text()='" + text + "']]/preceding-sibling::*)+1]";
        clickByJS(xpath);
    }

    @Override
    public void selectRecordWithPK(List<String> primaryKey) {
        String xPathRow = getRecordWithMultiplePK(primaryKey);
        switchToLastIFrame();
        // check if found >1 row satisfy condition
        int numOfRow = findAllElements(xPathRow).size();
        if (numOfRow > 1) {
            String joinPK = Joiner.on("").join(primaryKey);
            selectRecordWithJoinPK(xPathRow, numOfRow, joinPK);
        } else {
            clickByJS(xPathRow + "//input[@type='checkbox']");
        }
    }

    @Override
    public void accessRecordWithPK(List<String> primaryKey) {
        String xPathRow = getRecordWithMultiplePK(primaryKey) + "//td[1]";
        switchToLastIFrame();
        executeJS("var evt = document.createEvent('MouseEvents');" + "evt.initMouseEvent('dblclick',true, true, window, 0, 0, 0, 0, 0, false, false, false, false, 0,null);" + "arguments[0].dispatchEvent(evt);", xPathRow);


    }

    private String getRecordWithMultiplePK(List<String> primaryKey) {
        String xPathRow = "//table[@class='ebx_tvFixed']//tr[(td[%1$s])";
        String firstPK = primaryKey.get(0);
        if (primaryKey.get(0).toLowerCase().contains("[last]")) {
            firstPK=  Serenity.sessionVariableCalled(Constants.LAST_PK);
        }
        xPathRow = String.format(xPathRow, specialTextPredicates(firstPK));
        if (primaryKey.size() >= 2) {
            for (int i = 1; i < primaryKey.size(); i++) {
                xPathRow += " and (td[%s])";
                xPathRow = String.format(xPathRow, specialTextPredicates(primaryKey.get(i)));
            }
        }
        xPathRow += "]";
        return xPathRow;
    }

    @Override
    public String getLastRecordPK() {
        String pk = getElement("//table[@class='ebx_tvFixed']//tr[last()]").getTextValue().trim();
        Serenity.setSessionVariable(Constants.LAST_PK).to(pk);
        return pk;
    }

    private void selectRecordWithJoinPK(String xPathRow, int numOfRow, String joinPK) {
        for (int i = 1; i <= numOfRow; i++) {
            String xpathCell = "(" + xPathRow + ")[" + i + "]//input[@type='checkbox']";
            if (getTextValue(xpathCell + "/ancestor::tr").replaceAll("\n", "").equals(joinPK)) {
                clickByJS(xpathCell);
                break;
            }
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
    public boolean isRecordExistedWithPK(String[] primaryKeys) {
        String xPathRow = "//div[@id='ebx_WorkspaceContent']//tr[(td[%s])";
        primaryKeys[0] = specialTextPredicates(primaryKeys[0]);
        if (primaryKeys.length >= 2) {
            for (int i = 1; i < primaryKeys.length; i++) {
                primaryKeys[i] = specialTextPredicates(primaryKeys[i]);
                xPathRow += " and (td[%s])";
            }
        }
        xPathRow += "]";
        xPathRow = XFormat.of(xPathRow, primaryKeys);
        switchToLastIFrame();
        return isElementExistNow(xPathRow);
    }

    @Override
    public void unselectAllRecord() {
        clickBtn("Select and sort");
        clickOnElement("//span[.='Unselect all']");
    }

    @Override
    public void selectAllRecordInDisplayedTable() {
        List<WebElementFacade> list = findAllElements(XPATH_SELECT_AND_SORT);
        if (list.size() > 1) {
            for (int i = 0; i < list.size(); i++) {
                WebElementFacade e = list.get(i);
                if (e.isDisplayed() && e.isCurrentlyEnabled()) {
                    e.waitUntilClickable().click();
                    break;
                }
            }
        } else {
            list.get(0).waitUntilClickable().click();
        }
        clickOnElement("//*[.='Select all in page']");
    }

    @Override
    public void selectRecordWithPK(String recordPK) {
        waitForPresenceOfElement(XPATH_TABLE);
        clickByJS(XFormat.of(XPATH_CHECKBOX_RECORD, specialTextPredicates(recordPK)));
    }

    @Override
    public void accessRecordWithText(String label) {
        String xPath = "(//table[@class='ebx_tvMain' or @class='ebx_tvFixed']//td[" + specialTextPredicates(label) + "])[1]";
        executeJS("var evt = document.createEvent('MouseEvents');" + "evt.initMouseEvent('dblclick',true, true, window, 0, 0, 0, 0, 0, false, false, false, false, 0,null);" + "arguments[0].dispatchEvent(evt);", xPath);
    }


    public boolean isRecordInTableExisted() {
        switchToLastIFrame();
        return (!isElementExistNow(XPATH_NO_RECORDS_FOUND) || !getElement(XPATH_NO_RECORDS_FOUND).isDisplayed());
    }


    public void selectAllRecord() {
        clickOnElement(XFormat.of(NAVIGATION_ITEM, "Select all in page"));
    }

    public void clickBtnSelectAndSort() {
        switchToLastIFrame();
        clickBtn(Constants.BTN_SELECT_AND_SORT);
    }

    @Override
    public String getTextDataCell(int rowInd, String colCode) {
        int colIndex = getColumnIndexWithLabel(colCode);
        return getTextDataCell(rowInd, colIndex);
    }

    @Override
    public JsonObject getRecordWithPK(String pk, List<String> header) {
        int rowind = getRowIndexWithLabel(pk);
        JsonObject record = new JsonObject();
        record.addProperty(header.get(0), pk);
        header.remove(0);
        for (String h : header)
            record.addProperty(h, getTextDataCell(rowind, h));
        return record;
    }

    @Override
    public TableObject getDefaultViewTable(String tblName) {
        TableObject tbl = TableObject.newTable(tblName);
        JsonObject row;
        int numOfRow = getNumberOfTableRow();
        int numOfCol = getNumberOfTableCol();
        for (int i = 1; i <= numOfRow; i++) {
            row = new JsonObject();
            for (int j = 1; j <= numOfCol; j++) {
                row.addProperty(getColumnNameWithIndex(j), getTextDataCell(i, j));
            }
            tbl.addRecord(row);
        }
        return tbl;
    }

    @Override
    public boolean verifyMAMEConfigRecordExisted(String dataModel, String table) {
        String XPATH_MAME_RECORD_CONFIG = "//table[@class='ebx_tvMain']//tr[td[" + specialTextPredicates(dataModel) + "]][td[" + specialTextPredicates(table) + "]]";
        System.out.println("XPATH_MAME_RECORD_CONFIG" + XPATH_MAME_RECORD_CONFIG);
        boolean isExist = isElementExistNow(XPATH_MAME_RECORD_CONFIG);
        return isExist;
    }

    @Override
    public boolean isRecordWithPKExisted(String pk) {
        String xPath = "(//table[@class='ebx_tvMain' or @class='ebx_tvFixed']//td[text()='" + pk + "'])[1]";
        return isElementExistNow(xPath);
    }
}
