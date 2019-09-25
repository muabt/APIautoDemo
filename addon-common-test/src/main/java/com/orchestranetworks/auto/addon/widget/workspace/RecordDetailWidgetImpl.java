package com.orchestranetworks.auto.addon.widget.workspace;

import com.orchestranetworks.auto.addon.XFormat;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

import java.util.ArrayList;
import java.util.List;

public class RecordDetailWidgetImpl extends BaseWidgetImpl implements RecordDetailWidget {

    private static final String MERGE_POLICY_TAB = "//ul[@id='ebx_WorkspaceFormTabviewTabs']//span[text()='%s']/ancestor::li";
    private static final String XPATH_LABEL= "(//td[@class='ebx_Label'])";
    private static final String XPATH_VALUE = "(//td[@class='ebx_Input'])";



    public RecordDetailWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
                                  long timeoutInMilliseconds) {
        super(page, locator, webElement, timeoutInMilliseconds);
    }

    public RecordDetailWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    @Override
    public void clickOnTabOfLabel(String label) {
        String xPath = "//ul[@id='ebx_WorkspaceFormTabviewTabs']//span[contains(text(),'" + label + "')]";
        clickOnElement(xPath);
    }

    @Override
    public void selectTab(String tabName) {
        waitForAllLoadingCompleted();
        clickByJS(XFormat.of(MERGE_POLICY_TAB, tabName));
    }

    @Override
    public void selectRadioButton(String label, String value) {
        waitForAllLoadingCompleted();
        selectRadioBoxGroup(label, value);
    }

    @Override
    public void addAnOccurrence() {
        clickBtn("Add an occurrence");
    }

    @Override
    public List<List<String>> getRecordDetail() {
        List<List<String>> metadataRecordView = new ArrayList<List<String>>();
        int numOfHeaders = findAllElements(XPATH_LABEL).size();
        List<String> rowLabel = new ArrayList<String>();
        for (int i = 1; i <= numOfHeaders; i++) {
            String cell = getText(XPATH_LABEL + "[" + i + "]").trim();
            rowLabel.add(cell);
            System.out.println("Cell: " + cell);
        }
        metadataRecordView.add(rowLabel);

        List<String> rowValue = new ArrayList<String>();
        System.out.println("Table: " + metadataRecordView);
        for (int j = 1; j <= numOfHeaders; j++) {
            String cell = getText(XPATH_VALUE + "[" + j + "]").replaceAll("\\*", "").trim();
            rowValue.add(cell);
            System.out.println("cellValue: " + cell);
        }
        metadataRecordView.add(rowValue);
        return metadataRecordView;
    }
}
