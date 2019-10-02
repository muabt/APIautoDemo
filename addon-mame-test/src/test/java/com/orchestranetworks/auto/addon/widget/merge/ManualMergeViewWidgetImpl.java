package com.orchestranetworks.auto.addon.widget.merge;


import java.util.ArrayList;
import java.util.List;

import com.orchestranetworks.auto.addon.utils.MAMEConstants;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class ManualMergeViewWidgetImpl extends BaseWidgetImpl implements ManualMergeViewWidget {
    private static final String XPATH_RCV_CELL = "(//record-view//div[@class='bottom']//tr[contains(@class,'row')][%1$s]/td[contains(@class,'cell-container')]//span[@title])[%2$s]";
    private static final String XPATH_RCV_HEADER = "(//record-view//div[@class='top ebx_tvHeaderContainer']//span[@class='ebx_RawLabel'])";
    private static final String XPATH_RCV_ROW = "//record-view//div[@class='bottom']//tr[contains(@class,'row')]";
    private static final String XPATH_PREVIEW_HEADER = "(//preview-record-view//div[@class='top ebx_tvHeaderContainer']//span[@class='ebx_RawLabel'])";
    private static final String XPATH_PREVIEW_CELL = "(//preview-record-view//div[@class='bottom']//td[contains(@class,'cell-container ebx_tvEven')]//span[@title])[%s]";
    private static final String BACKGROUND_COLOR = "background-color";
    private static final String XPATH_RESET_BTN = "(//div[@class='resetSection']/button)[1]";
    private static final String XPATH_CANCEL_ACTION = "(//div[@class='resetSection']/button)[2]";
    private static final String XPATH_MERGE_STEP_SELECTION = "//div[@class='ui-dropdown-content-left']";
    private static final String XPATH_STEP_SELECTED = "(//div[@class='ui-dropdown-content-left']/span)[2]";

    public ManualMergeViewWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    @Override
    public List<List<String>> getDataRecordViewTable() {
        waitForAllLoadingCompleted();
        List<String> row = new ArrayList<String>();
        List<List<String>> actualTable = new ArrayList<List<String>>();

        int numOfHeader = findAllElements(XPATH_RCV_HEADER).size();
        for (int i = 1; i <= numOfHeader; i++) {
            String xPathHeaderCell = XPATH_RCV_HEADER + "[" + i + "]";
            row.add(getText(xPathHeaderCell));
        }
        actualTable.add(row);

        int numOfRow = findAllElements(XPATH_RCV_ROW).size() / 2;
        for (int rowind = 1; rowind <= numOfRow; rowind++) {
            row = new ArrayList<String>();
            for (int colInd = 1; colInd <= numOfHeader; colInd++) {
                String xPahtCell = String.format(XPATH_RCV_CELL, rowind, colInd);
                row.add(getTextCell(xPahtCell));
            }
            actualTable.add(row);
        }

        return actualTable;
    }

    @Override
    public List<List<String>> getDataPreviewTable() {

        List<String> listHeader = new ArrayList<String>();
        List<String> row = new ArrayList<String>();
        List<List<String>> actualTablePreview = new ArrayList<List<String>>();
        int numOfHeader = findAllElements(XPATH_PREVIEW_HEADER).size();
        for (int i = 1; i <= numOfHeader; i++) {
            String xPathHeaderCell = XPATH_PREVIEW_HEADER + "[" + i + "]";

            listHeader.add(getText(xPathHeaderCell));
            row.add(getTextCell(String.format(XPATH_PREVIEW_CELL, i)));
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

    @Override
    public boolean isCellHighlighted(int row, int col) {
        String xPathCell = String.format(XPATH_RCV_CELL, row, col + 1);
        xPathCell = xPathCell + "//ancestor::*[local-name()='td' or local-name()='th']";
        String highlightedColor = "rgba(244, 244, 244, 1)";
        String color = getElement(xPathCell).getCssValue(BACKGROUND_COLOR);
        return color.equals(highlightedColor);
    }


    @Override
    public void clickBtnNext() {
        clickBtn(MAMEConstants.NEXT);
    }

    @Override
    public void clickBtnCancel() {
        clickBtn(MAMEConstants.CANCEL_THE_MERGE_PROCESS);

    }

    @Override
    public void clickBtnApplyMergePolicy() {
        clickBtn(MAMEConstants.APPLY_MERGE_POLICY);
    }

    @Override
    public void clickBtnCancelLastAction() {
        clickBtn(MAMEConstants.CANCEL_LAST_ACTION);

    }

    @Override
    public void changeMergeStep(String step) {

    }

    @Override
    public String getTextOfResetBtn() {
        return getElement(XPATH_RESET_BTN).getAttribute(MAMEConstants.TITLE);
    }

    @Override
    public String getTextOfRightBtn() {
        return getElement(XPATH_RESET_BTN).getAttribute(MAMEConstants.TITLE);
    }

    @Override
    public String getTextOfCancelActionButton() {
        return getElement(XPATH_CANCEL_ACTION).getAttribute(MAMEConstants.TITLE);
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
        return getElement(XPATH_MERGE_STEP_SELECTION).getAttribute("textContent").trim();
    }


    @Override
    public String getActualTableName() {
        return getTextValue(XPATH_STEP_SELECTED);
    }

}
