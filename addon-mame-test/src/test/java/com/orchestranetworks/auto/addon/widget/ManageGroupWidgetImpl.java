package com.orchestranetworks.auto.addon.widget;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;
import com.orchestranetworks.auto.addon.utils.MAMEConstants;
import net.serenitybdd.core.pages.PageObject;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import java.util.ArrayList;
import java.util.List;

public class ManageGroupWidgetImpl extends BaseWidgetImpl implements ManageGroupWidget {
    public ManageGroupWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement, long timeoutInMilliseconds) {
        super(page, locator, webElement, timeoutInMilliseconds);
    }

    public ManageGroupWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }


    private static final String XPATH_HEADER = "(//th[contains(@id,'ebx_workspaceTable')]/span[last()])";
    private static final String XPATH_ROW = "//table[@class='ebx_tvFixed']//tr";
    private static final String XPATH_CELL = "((//table[@class='ebx_tvFixed']//tr[%1$s]| //table[@class='ebx_tvMain']//tr[%1$s])/td[not(contains(@style,'hidden')) and not (ancestor::table[@class='ebx_tableCellWithButtonOnRight_table']) and not(@class='ebx_tvSelectCell')])[%2$s]";
    private static final String XPATH_NO_RECORD = "//div[@class='ebx_tvMessageEmpty ebx_ValueND']";

    @Override
    public List<List<String>> getDataDuplicatesTable() {
        switchToIFrame(MAMEConstants.IFRAME_DUPLICATE);
        return getGroupDataTable();
    }

    @Override
    public List<String> getDataSuspectsTable() {
        switchToIFrame(MAMEConstants.IFRAME_SUSPECT);
        return getSuspectNoRecordFound();
    }

    @Override
    public String getNoRecordFound() {
        switchToIFrame(MAMEConstants.IFRAME_SUSPECT);
        return getText(XPATH_NO_RECORD);
    }


    private List<List<String>> getGroupDataTable() {
        int numOfHeader = findAllElements(XPATH_HEADER).size();
        int numOfRow = findAllElements(XPATH_ROW).size();
        List<List<String>> tbl = new ArrayList<List<String>>();
        List<String> row = new ArrayList<String>();
        for (int i = 1; i <= numOfHeader; i++) {
            String h = getElement(XPATH_HEADER + "[" + i + "]").getTextValue().replace("\n", "").trim();
            row.add(h);
        }
        System.out.println(row);
        tbl.add(row);

        for (int i = 1; i <= numOfRow; i++) {
            row = new ArrayList<String>();
            for (int j = 1; j <= numOfHeader; j++) {
                String cell = getElement(String.format(XPATH_CELL, i, j)).getTextValue().replace("\n", "").trim();
                System.out.println(cell);
                row.add(cell);
            }
            tbl.add(row);
        }
        System.out.println("tbl=" + tbl);
        return tbl;
    }

    private  List<String> getSuspectNoRecordFound() {
        int NumOfHeader = findAllElements(XPATH_HEADER).size();
        List<String> header = new ArrayList<String>();
        for (int i = 1; i <= NumOfHeader; i++) {
            String h = getElement(XPATH_HEADER + "[" + i + "]").getTextValue().replace("\n", "").trim();
            header.add(h);
        }
        return header;
    }
}


