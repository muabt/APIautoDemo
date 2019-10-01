package com.orchestranetworks.auto.addon.widget.merge;


import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class ManualMergeViewWidgetImpl extends BaseWidgetImpl implements ManualMergeViewWidget {
    private static final String XPATH_RCV_CELL = "(//record-view//div[@class='bottom']//tr[contains(@class,'row')][%1$s]/td[contains(@class,'cell-container')]//span[@title])[%2$s]";

    public ManualMergeViewWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    public List<List<String>> getDataRecordViewTable() {
        waitForAllLoadingCompleted();
        List<String> row = new ArrayList<String>();
        List<List<String>> actualTable = new ArrayList<List<String>>();

        String xPathListHeader = "(//record-view//div[@class='top ebx_tvHeaderContainer']//span[@class='ebx_RawLabel'])";
        int numOfHeader = findAllElements(xPathListHeader).size();
        for (int i = 1; i <= numOfHeader; i++) {
            String xPathHeaderCell =  xPathListHeader + "[" + i + "]";
            row.add(getText(xPathHeaderCell));
        }
        actualTable.add(row);

        String xPathRow = "//record-view//div[@class='bottom']//tr[contains(@class,'row')]";
        int numOfRow = findAllElements(xPathRow).size() / 2;
        for (int rowind = 1; rowind <= numOfRow; rowind++) {
            row = new ArrayList<String>();
            for (int colInd = 1; colInd <= numOfHeader; colInd++) {
                String xPahtCell =  String.format(XPATH_RCV_CELL, rowind,colInd);
                row.add( getTextCell(xPahtCell));
            }
            actualTable.add(row);
        }

        return actualTable;
    }

    public List<List<String>> getDataPreviewTable() {
        String xPathListHeader = "(//preview-record-view//div[@class='top ebx_tvHeaderContainer']//span[@class='ebx_RawLabel'])";
        List<String> listHeader = new ArrayList<String>();
        List<String> row = new ArrayList<String>();
        List<List<String>> actualTablePreview = new ArrayList<List<String>>();
        int numOfHeader = findAllElements(xPathListHeader).size();
        for (int i = 1; i <= numOfHeader; i++) {
            String xPathHeaderCell =  xPathListHeader + "[" + i + "]";
            String xPathCell = "(//preview-record-view//div[@class='bottom']//td[contains(@class,'cell-container ebx_tvEven')]//span[@title])["
                    + i + "]";
            listHeader.add(getText(xPathHeaderCell));
            row.add(getTextCell(xPathCell));
        }

        actualTablePreview.add(listHeader);
        actualTablePreview.add(row);

        return actualTablePreview;
    }

    private String getTextCell(String xPathCell) {
        try {
            return getText(xPathCell);
        } catch (Exception e) {
            return "";
        }
    }

    public boolean isCellHighlighted(int row, int col) {
        String xPathCell =  String.format(XPATH_RCV_CELL, row,col+1);
        xPathCell = xPathCell + "//ancestor::*[local-name()='td' or local-name()='th']";
        String highlightedColor = "rgba(244, 244, 244, 1)";
        String color = getElement(xPathCell).getCssValue("background-color");
        return color.equals(highlightedColor);
    }

    public String get_value_table(int rowInd, String colName) {
        int rowIndex = rowInd + 1;
        int colIndex = getColumnIndexWithLabel(colName);
        return getTextDataCell(rowIndex, colIndex);
    }

    @Override
    public void clickBtnNext() {
        clickBtn("Next");
    }

    @Override
    public void clickBtnCancel() {
        clickBtn("Cancel the merge process");

    }

    @Override
    public void clickBtnApplyMergePolicy() {
        clickBtn("Apply merge policy");
    }

    @Override
    public void clickBtnCancelLastAction() {
        clickBtn("Cancel last action");

    }

    @Override
    public void changeMergeStep(String step) {

    }

    public String getTextOfResetBtn() {
        String xPath = "(//div[@class='resetSection']/button)[1]";
        return getElement(xPath).getAttribute("title");
    }

    public String getTextOfRightBtn() {
        String xPath = "(//div[@class='resetSection']/button)[1]";
        return getElement(xPath).getAttribute("title");
    }

    @Override
    public String getTextOfCancelActionButton() {
        String xPath = "(//div[@class='resetSection']/button)[2]";
        return getElement(xPath).getAttribute("title");
    }

    @Override
    public String isBtnCancelLastActionActive() {
        String status = "inactive";
        String xPath = "//div[@class='resetSection']/button/img";
        if (!getElement(xPath).getAttribute("src").contains("inactive")) {
            status = "active";
        }
        return status;
    }


    @Override
    public String getMergeStepsSelection() {
        String xPathTableName = "//div[@class='ui-dropdown-content-left']";
        return getElement(xPathTableName).getAttribute("textContent").trim();
    }


    @Override
    public String getActualTableName() {
        String xPathTableName = "(//div[@class=\"ui-dropdown-content-left\"]/span)[2]";
        return getTextValue(xPathTableName);
    }

}
