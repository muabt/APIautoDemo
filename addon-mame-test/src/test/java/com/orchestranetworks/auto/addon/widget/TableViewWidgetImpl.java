package com.orchestranetworks.auto.addon.widget;

import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;
import net.serenitybdd.core.pages.PageObject;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import java.util.ArrayList;
import java.util.List;

public class TableViewWidgetImpl extends BaseWidgetImpl implements TableViewWidget {
    private static final String XPATH_RCV_CELL = "(//record-view//div[@class='bottom']//tr[contains(@class,\"row\")][%r%]/td[contains(@class,'cell-container')]//span[@title])[%c%]";

    public TableViewWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement, long timeoutInMilliseconds) {
        super(page, locator, webElement, timeoutInMilliseconds);
    }

    public TableViewWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    public List<List<String>> getDataRecordViewTable() {
        int numOfHeader = 0;
        String xPathListHeader = "//record-view//div[@class='top ebx_tvHeaderContainer']//span[@class='ebx_RawLabel']";
        String headerCellValue = "";
        List<String> listHeader = new ArrayList<String>();

        List<List<String>> actualTable = new ArrayList<List<String>>();
        numOfHeader = findAllElement(xPathListHeader).size();
        for (int i = 1; i <= numOfHeader; i++) {
            String xPathHeaderCell = "(" + xPathListHeader + ")[" + i + "]";
            headerCellValue = getText(xPathHeaderCell);
            listHeader.add(headerCellValue);
        }
        actualTable.add(listHeader);

        int numOfRow = 0;
        String xPathRow = "//record-view//div[@class='bottom']//tr[contains(@class,\"row\")]";
        String cellValue = "";
        numOfRow = findAllElement(xPathRow).size() / 2;
        for (int rowind = 1; rowind <= numOfRow; rowind++) {
            List<String> row = new ArrayList<String>();
            for (int colInd = 1; colInd <= numOfHeader; colInd++) {
                String xPathCell = XPATH_RCV_CELL.replaceAll("%r%", String.valueOf(rowind)).replaceAll("%c%",
                        String.valueOf(colInd));
                cellValue = getTextCell(xPathCell);
                row.add(cellValue);
            }
            actualTable.add(row);
        }
        SessionData.addDataTable("RECORD_VIEW_TBL", actualTable, false);
        return actualTable;
    }

    public List<List<String>> getDataPreviewTable() {

        int numOfHeader = 0;
        String xPathListHeader = "//preview-record-view//div[@class='top ebx_tvHeaderContainer']//span[@class='ebx_RawLabel']";
        String headerCellValue = "";
        List<String> listHeader = new ArrayList<String>();

        List<List<String>> actualTablePreview = new ArrayList<List<String>>();
        numOfHeader = findAllElement(xPathListHeader).size();
        for (int i = 1; i <= numOfHeader; i++) {
            String xPathHeaderCell = "(" + xPathListHeader + ")[" + i + "]";
            headerCellValue = getText(xPathHeaderCell);
            listHeader.add(headerCellValue);
        }
        actualTablePreview.add(listHeader);
        String cellValue = "";
        List<String> row = new ArrayList<String>();
        for (int colInd = 1; colInd <= numOfHeader; colInd++) {
            String xPathCell = "(//preview-record-view//div[@class='bottom']//td[contains(@class,\"cell-container ebx_tvEven\")]//span[@title])["
                    + colInd + "]";
            cellValue = getTextCell(xPathCell);
            row.add(cellValue);
        }
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
        String xPathCell = XPATH_RCV_CELL.replaceAll("%r%", String.valueOf(row)).replaceAll("%c%",
                String.valueOf(col + 1));
        xPathCell = xPathCell + "//ancestor::*[local-name()='td' or local-name()='th']";
        String highlightedColor = "rgba(244, 244, 244, 1)";
        String color = getElement(xPathCell).getCssValue("background-color");
        return color.equals(highlightedColor) ? true : false;
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

}